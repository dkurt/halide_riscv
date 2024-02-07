#include <opencv2/opencv.hpp>
#include <ker_weight.hpp>

#ifdef __riscv
  #include <HalideBuffer.h>
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
#endif
namespace voxel_upscale_const
{
    static const int scale_depth = 2; 
    static const int scale_height = 2;
    static const int scale_width = 2;

    static const int ker_depth = (2 * scale_depth - scale_depth % 2);
    static const int ker_height = (2 * scale_height - scale_height % 2);
    static const int ker_width = (2 * scale_width - scale_width % 2);

    static const int pad_depth = std::ceil(( scale_depth - 1) / 2);
    static const int pad_height = std::ceil(( scale_height - 1) / 2);
    static const int pad_width = std::ceil(( scale_width - 1) / 2);
};

using namespace voxel_upscale_const;

void voxel_up( float* src, float* kernel, float* dst,
                    int inpChannels, int width, int height, int batch){

    Halide::Buffer<float> input(src, {width, height, batch, inpChannels});
    Halide::Buffer<float> weights(kernel, { ker_width, ker_height, ker_depth, inpChannels});
    Halide::Buffer<float> output(dst, { width * scale_width, height * scale_height, batch * scale_depth, inpChannels});
    
    
    static Halide::Func deconv("deconvolution");
    if (!deconv.defined()) {
        input.set_name("input");
        weights.set_name("weights");
        Halide::Var x("x"), y("y"), n("n"), c("c");

        Halide::Func padded_input("constant_exterior");
        Halide::Func dilated_input("dilated_input");

        Halide::RDom r1(0, width, 0, height, 0, batch);
   
        dilated_input(x,y,n,c) = 0.0f; 
        dilated_input( r1.x * scale_width, r1.y * scale_height, r1.z * scale_depth, c) = 
                    input( r1.x, r1.y, r1.z, c);
        dilated_input.compute_root();
        Halide::Func bounded =
            Halide::BoundaryConditions::constant_exterior(dilated_input, 0,
                                                          0, (width - 1) * scale_width + 1,
                                                          0, (height - 1) * scale_height + 1,
                                                          0, (batch - 1) * scale_depth + 1,
                                                          0, inpChannels
                                                          );

        padded_input(x,y,n,c) = bounded(x,y,n,c);
        
        Halide::RDom r(0, ker_width, 0, ker_height, 0, ker_depth, 0, inpChannels);
        Halide::Expr kx = x + pad_width - r.x;
        Halide::Expr ky = y + pad_height - r.y;
        Halide::Expr kn = n + pad_depth - r.w;
        Halide::Expr kc = r.z;
        deconv(x, y, n, c) = Halide::sum(padded_input(kx, ky, kn, kc) *
                                         weights(r.x, r.y,  r.z, r.w));
        padded_input.compute_root();
       
        deconv.bound(x, 0, width * scale_width)
              .bound(y, 0, height * scale_height)
              .bound(n, 0, batch * scale_depth)
              .bound(c, 0, inpChannels);

      
        deconv.realize(output); 
        
    }
}

void upscale(std::vector<std::string> img_path, int width, int height)
{
  const int img_num = static_cast<int>(img_path.size());
  cv::Mat voxels({img_num, 4, width, height}, CV_32F);
  for(size_t i = 0; i < img_num; ++i)
  {
    cv::Mat img = cv::imread(img_path[i], cv::IMREAD_UNCHANGED);
    cv::Mat colors[4];
    for (size_t j = 0; j < 4; ++j) 
    {
        colors[j] = cv::Mat(std::vector<int>{width, height}, CV_32F, voxels.ptr<float>(i, j));
    }
    img.convertTo(img, CV_32F);
    cv::split(img, colors);
  }

  cv::Mat res({img_num * scale_depth, 4, width * scale_width, height * scale_height },CV_32F);

  voxel_up(voxels.ptr<float>(), ker_weight, res.ptr<float>(),
                  4, width, height, img_num);

  for(size_t i = 0; i < img_num * scale_depth; ++i)
  {
    cv::Mat img;
    cv::Mat colors[4];
    for(size_t j = 0; j < 4; ++j)
    {
      colors[j] = cv::Mat(std::vector<int>{width * scale_width, height * scale_height}, CV_32F, res.ptr<float>(i, j));
      //colors[j] = cv::Mat(std::vector<int>{width, height}, CV_32F, voxels.ptr<float>(i, j));
    }
    // colors[0] /= 0.75f;
    // colors[1] /= 0.75f;
    // colors[2] /= 0.75f;
    //colors[0].setTo(255);
    //colors[1].setTo(255);
    //colors[2].setTo(255);
    //colors[3].setTo(255);
    cv::merge(colors, 4, img);
    img.convertTo(img, CV_8U);
    cv::imwrite(cv::format("./new_image%04d.png", i + 1) , img);
  }

}
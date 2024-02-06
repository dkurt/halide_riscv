#include <opencv2/opencv.hpp>

//#ifdef HAVE_OPENCV_DNN

#ifdef __riscv
  #include <HalideBuffer.h>
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
#endif


void voxel_up(float* src, float* kernel, float* dst,
                    int inpChannels, int height, int width, int depth){

    static const int scale_depth = 3; 
    static const int scale_height = 3;
    static const int scale_width = 3;

    static const int ker_depth = (2 * scale_depth - scale_depth % 2);
    static const int ker_height = (2 * scale_height - scale_height % 2);
    static const int ker_width = (2 * scale_width - scale_width % 2);

    static const int pad_depth = std::ceil(( scale_depth - 1) / 2);
    static const int pad_height = std::ceil(( scale_height - 1) / 2);
    static const int pad_width = std::ceil(( scale_width - 1) / 2);


    Halide::Buffer<float> input(src, {depth, height, width, inpChannels});
    Halide::Buffer<float> weights(kernel, {ker_depth, ker_height, ker_width, inpChannels});
    Halide::Buffer<float> output(dst, {depth*scale_depth, height*scale_height, width*scale_width, inpChannels});
    
    
    static Halide::Func deconv("deconvolution");
    if (!deconv.defined()) {
        input.set_name("input");
        weights.set_name("weights");
        Halide::Var x("x"), y("y"), z("z"), c("c");

        Halide::Func padded_input("constant_exterior");
        Halide::Func dilated_input("dilated_input");

        Halide::RDom r1(0, depth, 0, height, 0, width);
        std::cout << "init"<<std::endl;
        dilated_input(x,y,z,c) = 0.0f; 
        dilated_input(r1.x * scale_depth, r1.y * scale_height, r1.z * scale_width, c) = 
                    input(r1.x, r1.y, r1.z, c);

        Halide::Func bounded =
            Halide::BoundaryConditions::constant_exterior(dilated_input, 0,
                                                          0, (depth - 1) * scale_depth + 1,
                                                          0, (height - 1) * scale_height + 1,
                                                          0, (width - 1) * scale_width + 1,
                                                          0, inpChannels);
        std::cout << "bound"<<std::endl;
        padded_input(x,y,z,c) = bounded(x,y,z,c);
        
        Halide::RDom r(0, ker_depth, 0, ker_height, 0, ker_width, 0, inpChannels);
        Halide::Expr kx = x + pad_depth - r.x;
        Halide::Expr ky = y + pad_height - r.y;
        Halide::Expr kz = z + pad_width - r.z;
        Halide::Expr kc = r.w;
        deconv(x, y, z, c) = Halide::sum(padded_input(kx, ky, kz,kc) *
                                         weights(r.x, r.y, r.z, c));
        std::cout << "sum"<<std::endl;
        deconv.bound(x, 0, depth * scale_depth)
              .bound(y, 0, height * scale_height)
              .bound(z, 0, width * scale_width)
              .bound(c, 0, inpChannels); 

        std::cout << "end sum"<<std::endl;

        //output = deconv.realize({depth*scale_depth, height*scale_height, width*scale_width, inpChannels});//(dst, {depth*scale_depth, height*scale_height, width*scale_width, inpChannels});
        deconv.realize(output); 
        std::cout << "realize"<<std::endl;
    }
}

//#endif
#include <opencv2/ts.hpp>

#include "algos.hpp"

using namespace cv;

TEST(ascii_art, halide){
    static const int rx = 15;
    static const int ry = 19;
    const std::string grey_scale = "$@B%8&WM#*OAHKDPQWMRZO0QLCJUYXVJFT/|()1{}[]?-_+~<>i!lI;:,^`'.  ";

    cv::Mat src = imread("cat.jpeg", cv::IMREAD_GRAYSCALE);
    cv::Mat dst(src.rows/ry, src.cols/rx, CV_32F),
    render(src.rows, src.cols, CV_8U, cv::Scalar(255));

    ascii_art_halide(src.ptr<uint8_t>(), dst.ptr<float>(), src.rows, src.cols);
    std::vector<std::pair<float, char>> lums={};
    std::vector<char> symbols(256);
    float lum_min = 255;
    float lum_max = 0;
    for(int i = 0; i < grey_scale.size(); i++){
        cv::Mat tmp(ry, rx, CV_8U, cv::Scalar(255));
        cv::putText(tmp, std::string(1, grey_scale[i]), cv::Point(1, ry-1),
            cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0), 1, cv::LINE_AA);

        float lum = 0;
        uint8_t *stmp;
        stmp = tmp.ptr<uint8_t>();
        for(int y = 0; y < tmp.rows; y++){
            for(int x = 0; x < tmp.cols; x++){
                lum += stmp[y*rx+x];
            }
        }
        std::pair<float, char> a(lum/(rx*ry), grey_scale[i]);
        lums.push_back(a);

    }
    std::sort(lums.begin(), lums.end());

    for(int i = 0; i < dst.rows; i++)
        for(int j = 0; j < dst.cols; j++){

            float lum = dst.at<float>(i, j);
            int index = (min(lum, 255.0f)/255.0f)*(lums.size()-1);
            std::cout << lum << std::endl;
            CV_Assert(index < lums.size());
            cv::Mat roi =  render.colRange(j*rx, (j+1)*rx).rowRange(i*ry, (i+1)*ry);
            cv::putText(roi, std::string(1, grey_scale[index]), cv::Point(1, ry-1),
                cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0), 1, cv::LINE_AA);
        }

    // imwrite("res_cat_ascii_halide.png", render);
    // imwrite("src_cat_ascii_halide.png", src);
    // ASSERT_EQ(true, true);
}

#include <opencv2/opencv.hpp>
#include <vector>
#include <string>
#include <cfloat>
#include <iostream>

#ifdef __riscv
#include <HalideBuffer.h>

using namespace Halide::Runtime;

#else

#include <Halide.h>



#endif
static const int norm_w = 3;
static const int norm_h = 3;
static const int rx = 5;
static const int ry = 9;
/*
void ascii_art_halide(const uint8_t* src, uint8_t* dst, int input_height, int input_width) {
    Halide::Func ascii_art;
    Halide::Var x, y;
    int output_width = input_width / rx;
    int output_height = input_height / ry;

    Halide::Buffer<uint8_t> input(src, input_width, input_height);

    // Convert to grey
 //   Halide::Func grey;
   // grey(x, y) = (input(x, y, 0) + input(x, y, 1) + input(x, y, 2)) / 3;

    Halide::Func lum;
    Halide::RDom r(0, rx, 0, ry);
    lum(x, y) += grey(x * rx + r.x, y * ry + r.y);

    Halide::Func average_lum;
    average_lum(x, y) = lum(x, y) / (rx * ry);

    const std::string grey_scale = "$@B%8&WM#*OAHKDPQWMRZO0QLCJUYXVJFT/|()1{}[]?-_+~<>i!lI;:,^`'.  ";
    uint8_t tmp = 255.0 / grey_scale.size();
    Halide::Func output;
    output(x, y) = grey_scale[Halide::cast<int>(average_lum(x, y) / tmp)];
    Halide::Buffer<uint8_t> output_buffer = output.realize(output_width, output_height);
    for (int y = 0; y < output_height; y++) {
        for (int x = 0; x < output_width; x++) {
            dst[y * output_width + x] = output_buffer(x, y);
        }
    }
}*/
void ascii_art_ref(const uint8_t* src, uint8_t* dst, int input_height, int input_width) {
    //convert to grey
    //...
    //parse to windows with size rx*ry
    int output_width = input_width / rx;
    int output_height = input_height / ry;
    for(int y = 0; y < output_height; y++){
        for(int x = 0; x < output_width; x++){
            float lum = 0;
            for(int j = 0; j < ry; ++j){
                for(int i = 0; i < rx; ++i){
                    lum += src[ (y * ry + j) * input_width + x * rx +i];   
                }   
            }
            dst[y * output_width + x] = static_cast<uint8_t>(lum/(rx*ry));
            lum = 0;
        }   
    }
    const std::string grey_scale = "$@B%8&WM#*OAHKDPQWMRZO0QLCJUYXVJFT/|()1{}[]?-_+~<>i!lI;:,^`'.  ";
    uint8_t tmp = 255.0/ grey_scale.size();


    // for(int y = 0; y < output_height; y++){
    //     for(int x = 0; x < output_width; x++){
    //         dst[y * output_width + x] = grey_scale[ floor(dst[y * output_width + x]/tmp)];
    //     }   
    // }


}

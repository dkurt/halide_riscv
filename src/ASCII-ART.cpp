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


    for(int y = 0; y < output_height; y++){
        for(int x = 0; x < output_width; x++){
            dst[y * output_width + x] = grey_scale[ floor(dst[y * output_width + x]/tmp)];
        }   
    }


}

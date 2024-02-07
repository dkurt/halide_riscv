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
static const int rx = 15;
static const int ry = 19;

void ascii_art_halide(uint8_t* src, uint8_t* dst, int input_height, int input_width) {
    int output_width = input_width / rx;
    int output_height = input_height / ry;
    Halide::Func ascii;
    Halide::Var x, y;
    
    Halide::Buffer<uint8_t> input(src, {input_width, input_height});
    Halide::Buffer<uint8_t> output(dst, {input_width / rx, input_height / ry});

    Halide::RDom r(0, rx, 0, ry);
    Halide::Expr s = Halide::sum(Halide::cast<uint32_t>(input(x*rx + r.x, y*ry + r.y)));
   
    //s = Halide::clamp(s/(rx*ry),0,255);
    ascii(x, y) = Halide::cast<uint8_t>(s/(rx*ry));
    ascii.realize(output);
    
}
void ascii_art_ref(const uint8_t* src, uint8_t* dst, int input_height, int input_width) {
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
}

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

using namespace Halide;


#endif
static const int norm_w = 3;
static const int norm_h = 3;
static const int rx = 15;
static const int ry = 19;

/*void ascii_art(const uint8_t* src, uint8_t* dst, int height, int width) {
    Buffer<uint16_t> input(src, {width, height});
    Buffer<uint16_t> output(dst, {width - 2, height - 2});
}*/

void ascii_art_ref(const uint8_t* src, uint8_t* dst, int height, int width) {
    //convert to grey

    std::vector<uint8_t> averanges = {};
    //parse to windows with size rx*ry

    float lum = 0;
    for(int y = 0; y <= height - ry; y+=ry){
        for(int x = 0; x < width; x+=rx){
            
            for(int j = y; j < y + ry; ++j){
                for(int i = x; i < x + rx; ++i){
                    lum += src[ j * width + i];
                    
                }
                
            }
            
            lum/=rx*ry;
            averanges.push_back(static_cast<uint8_t>(lum));
            lum = 0;
        }

        
    }
    
    std::string grey_scale = "$@B%8&WM#*OAHKDPQWMRZO0QLCJUYXVJFT/|()1{}[]?-_+~<>i!lI;:,^`'.  ";
    std::vector<uint8_t> result = {};
    uint8_t tmp = 255.0/ grey_scale.size();

    for(int i = 0; i < averanges.size(); ++i){
        result.push_back(grey_scale[ floor(averanges[i]/tmp)]);
    
    }
    /*
    for(int j = 0; j < height/ry; j++)
        for(int i = 0; i < width/rx; ++i) 
            dst[i+j*width/rx] = result[i][j];
    */


}




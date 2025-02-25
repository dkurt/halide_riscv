// Copyright (C), 2023, KNS Group LLC (YADRO)

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//     http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <opencv2/opencv.hpp>

void histogram_ref(const uint8_t* src, int32_t* dst, int height, int width);
void histogram_halide(uint8_t* src, int32_t* dst, int height, int width);
void histogram_opencv(const cv::Mat& src, cv::Mat& dst);

void bgr2gray_ref(const uint8_t* src, uint8_t* dst, int height, int width);
void bgr2gray_interleaved_halide(uint8_t* src, uint8_t* dst, int height, int width);
void bgr2gray_planar_halide(uint8_t* src, uint8_t* dst, int height, int width);
void bgr2gray_opencv(const cv::Mat& src, cv::Mat& dst);

void boxFilter_halide(uint16_t* src, uint16_t* dst, int height, int width);
void boxFilter_opencv(const cv::Mat& src, cv::Mat& dst);
void ascii_art_ref(const uint8_t* src, uint8_t* dst, int height, int width);
void ascii_art_halide(uint8_t* src, uint8_t* dst, int input_height, int input_width);

void julia_ref(uint8_t* dst, int height, int width);
void halide_julia(uint8_t* dst, int height, int width);

void LaplacianFilter(cv::Mat src, cv::Mat dst, int height, int width);
void standartDeviation(cv::Mat src, cv::Mat dst, int height, int width);
void wellExp(cv::Mat src, cv::Mat dst, int height, int width);
void weightsImage(cv::Mat src1, cv::Mat src2, cv::Mat src3, cv::Mat dst, int height, int width);
void weight_sum(cv::Mat src1, cv::Mat src2, cv::Mat src3, cv::Mat src4, cv::Mat dst, int height, int width);

#ifdef HAVE_OPENCV_DNN
void convolution_nchw_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width);
void convolution_nhwc_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width);
void convolution_opencv(const cv::Mat& src, const cv::Mat& weights, cv::Mat& dst,
                        int inpChannels, int outChannels);
#endif  // HAVE_OPENCV_DNN

void idw_ref(const uint8_t* src, uint8_t* dst, int height, int width, int* points, float* weights);

void idw_halide(const uint8_t* src, uint8_t* dst, int height, int width, int* pointsBuf, float* weightsBuf);

void voxel_up(float* src, float* kernel, float* dst,
                    int inpChannels, int height, int width, int depth);
void upscale(const std::vector<std::string> img_path, int width, int height);

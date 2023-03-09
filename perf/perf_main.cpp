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

#include <opencv2/ts.hpp>

#include "algos.hpp"

using namespace cv;

CV_PERF_TEST_MAIN("")

Mat src(1080, 1920, CV_8UC3);

PERF_TEST(histogram, reference) {
    Mat dst(3, 256, CV_32S);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        histogram_ref(src.ptr<uint8_t>(), dst.ptr<int32_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(histogram, opencv) {
    Mat dst(3, 256, CV_32F);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        histogram_opencv(src, dst);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(histogram, halide) {
    Mat dst(3, 256, CV_32S);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        histogram_halide(src.ptr<uint8_t>(), dst.ptr<int32_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(bgr2gray, reference) {
    Mat dst(src.size(), CV_8U);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        bgr2gray_ref(src.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(bgr2gray, opencv) {
    Mat dst(src.size(), CV_8U);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        bgr2gray_opencv(src, dst);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(bgr2gray_interleaved, halide) {
    randu(src, 0, 256);
    Mat dst(src.size(), CV_8U);

    PERF_SAMPLE_BEGIN()
        bgr2gray_interleaved_halide(src.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(bgr2gray_planar, halide) {
    randu(src, 0, 256);
    Mat dst(src.size(), CV_8U);

    PERF_SAMPLE_BEGIN()
        bgr2gray_planar_halide(src.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(boxFilter, halide) {
    Mat src16(src.size(), CV_16U);
    Mat dst(src.rows - 2, src.cols - 2, CV_16U);
    randu(src16, 0, 256);

    PERF_SAMPLE_BEGIN()
        boxFilter_halide(src16.ptr<uint16_t>(), dst.ptr<uint16_t>(), src.rows, src.cols);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(boxFilter, opencv) {
    Mat srcCh(src.size(), CV_8U);
    Mat dst(src.size(), CV_8U);
    randu(src, 0, 256);

    PERF_SAMPLE_BEGIN()
        boxFilter_opencv(srcCh, dst);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(convolution, opencv) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src({1, ic, height, width}, CV_32F);
    Mat kernel({oc, ic, 3, 3}, CV_32F);
    Mat dst({1, oc, height - 1, width - 1}, CV_32F);
    randn(src, 0, 1);
    randn(kernel, 0, 1);

    PERF_SAMPLE_BEGIN()
        convolution_opencv(src, kernel, dst, ic, oc);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

PERF_TEST(convolution_nchw, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src({1, ic, height, width}, CV_32F);
    Mat kernel({oc, ic, 3, 3}, CV_32F);
    Mat dst({1, oc, height - 2, width - 2}, CV_32F);
    randn(src, 0, 1);
    randn(kernel, 0, 1);

    PERF_SAMPLE_BEGIN()
        convolution_nchw_halide(src.ptr<float>(), kernel.ptr<float>(), dst.ptr<float>(),
                                ic, oc, height, width);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}


PERF_TEST(convolution_nhwc, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src({1, height, width, ic}, CV_32F);
    Mat kernel({ic, 3, 3, oc}, CV_32F);
    Mat dst({1, height - 2, width - 2, oc}, CV_32F);
    randn(src, 0, 1);
    randn(kernel, 0, 1);

    PERF_SAMPLE_BEGIN()
        convolution_nhwc_halide(src.ptr<float>(), kernel.ptr<float>(), dst.ptr<float>(),
                                ic, oc, height, width);
    PERF_SAMPLE_END()

    SANITY_CHECK_NOTHING();
}

Mat readFromFile(const std::string& path, const std::vector<int>& shape, int dtype) {
    std::ifstream ifs(path.c_str(), std::ios::binary);
    CV_Assert(ifs.is_open());

    Mat m(shape, dtype);
    ifs.read((char*)m.data, m.total() * m.elemSize());
    CV_Assert((size_t)ifs.gcount() == m.total() * m.elemSize());

    return m;
}

PERF_TEST(convolution_int8, halide) {
    static const int ic = 40;
    static const int oc = 16;
    static const int height = 56;
    static const int width = 56;
    Mat src = readFromFile("conv_inp.bin", {1, height, width, ic}, CV_8S);
    Mat kernel = readFromFile("kernel.bin", {ic, 1, 1, oc}, CV_8S);
    Mat bias = readFromFile("bias.bin", {oc}, CV_32S);
    Mat dst({1, height, width, oc}, CV_32S);
    src.convertTo(src, CV_32S);
    kernel.convertTo(kernel, CV_32S);

    int32_t inpZero = 128;
    int32_t outZero = -7;
    float inpScale = 0.0235294122248888;
    float outScale = 0.21487019956111908;
    std::vector<float> kernelScales = {0.00783687736839056,
                                        0.008358268067240715,
                                        0.007501534186303616,
                                        0.007673418149352074,
                                        0.006506798323243856,
                                        0.008637329563498497,
                                        0.016377447172999382,
                                        0.004656280856579542,
                                        0.015269875526428223,
                                        0.01427433267235756,
                                        0.009358197450637817,
                                        0.011772086843848228,
                                        0.004448991268873215,
                                        0.011401159688830376,
                                        0.014806065708398819,
                                        0.00932697020471096};

    PERF_SAMPLE_BEGIN()
        convolution_int8_halide(src.ptr<int32_t>(), kernel.ptr<int32_t>(), bias.ptr<int32_t>(), dst.ptr<int32_t>(),
                                ic, oc, height, width,
                                inpZero, outZero, inpScale, kernelScales.data(), outScale);
    PERF_SAMPLE_END()

    Mat ref = readFromFile("conv_out.bin", {1, height, width, oc}, CV_8S);
    ref.convertTo(ref, CV_32S);

    std::cout << norm(ref, dst, NORM_INF) << std::endl;
    SANITY_CHECK_NOTHING();
}

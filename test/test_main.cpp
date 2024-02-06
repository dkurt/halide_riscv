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
#include <iostream>

#include "algos.hpp"

using namespace cv;

const int width = 1920;
const int height = 1080;

CV_TEST_MAIN("")

TEST(histogram, opencv) {
    Mat src(height, width, CV_8UC3), dst(3, 256, CV_32F), ref(3, 256, CV_32S);
    randu(src, 0, 256);

    histogram_opencv(src, dst);
    histogram_ref(src.ptr<uint8_t>(), ref.ptr<int32_t>(), src.rows, src.cols);

    ref.convertTo(ref, CV_32F);
    ASSERT_EQ(countNonZero(dst != ref), 0);
}

TEST(histogram, halide)
{
    Mat src(height, width, CV_8UC3), dst(3, 256, CV_32S), ref(3, 256, CV_32S);
    randu(src, 0, 256);

    histogram_halide(src.ptr<uint8_t>(), dst.ptr<int32_t>(), src.rows, src.cols);
    histogram_ref(src.ptr<uint8_t>(), ref.ptr<int32_t>(), src.rows, src.cols);

    ASSERT_EQ(countNonZero(dst != ref), 0);
}

TEST(bgr2gray, opencv) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_8U), ref(height, width, CV_8U);
    randu(src, 0, 256);

    bgr2gray_opencv(src, dst);
    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);

    ASSERT_LE(norm(ref, dst, NORM_INF), 1);
}

TEST(bgr2gray_interleaved, halide) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_8U), ref(height, width, CV_8U);
    randu(src, 0, 256);

    bgr2gray_interleaved_halide(src.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);
    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);

    ASSERT_LE(norm(ref, dst, NORM_INF), 0);
}

TEST(bgr2gray_planar, halide) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_8U), ref(height, width, CV_8U);
    randu(src, 0, 256);
    Mat planar(height * 3, width, CV_8U);

    std::vector<cv::Mat> channels(3);
    channels[0] = planar.rowRange(0, height);
    channels[1] = planar.rowRange(height, height * 2);
    channels[2] = planar.rowRange(height * 2, height * 3);
    cv::split(src, channels);

    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);
    bgr2gray_planar_halide(planar.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);

    ASSERT_LE(norm(ref, dst, NORM_INF), 0);
}

TEST(boxFilter, halide) {
    Mat src(height, width, CV_8U), dst(height - 2, width - 2, CV_16U), ref(height, width, CV_8U);
    randu(src, 0, 256);
    Mat src16;
    src.convertTo(src16, CV_16U);

    boxFilter_halide(src16.ptr<uint16_t>(), dst.ptr<uint16_t>(), src.rows, src.cols);
    boxFilter_opencv(src, ref);

    ref = ref.rowRange(1, height - 1).colRange(1, width - 1);
    ref.convertTo(ref, CV_16U);
    ASSERT_LE(norm(ref, dst, NORM_INF), 1);
}

TEST(contrast, halide) {

    Mat image1 = imread("../halide_riscv/src/1.jpg");
    Mat image2 = imread("../halide_riscv/src/2.jpg");
    Mat image3 = imread("../halide_riscv/src/3.jpg");
    Mat image4 = imread("../halide_riscv/src/4.jpg");

    Mat image1Gray = imread("../halide_riscv/src/1.jpg", IMREAD_GRAYSCALE);
    Mat image2Gray = imread("../halide_riscv/src/2.jpg", IMREAD_GRAYSCALE);
    Mat image3Gray = imread("../halide_riscv/src/3.jpg", IMREAD_GRAYSCALE);
    Mat image4Gray = imread("../halide_riscv/src/4.jpg", IMREAD_GRAYSCALE);

    int imageWidth = image1Gray.cols;
    int imageHeigth = image1Gray.rows;

    int size = imageHeigth * imageHeigth;

    Mat dst(imageHeigth, imageWidth, CV_8U); // fix??

    Mat laplaced1(imageHeigth, imageWidth, CV_8U);
    Mat laplaced2(imageHeigth, imageWidth, CV_8U);
    Mat laplaced3(imageHeigth, imageWidth, CV_8U);
    Mat laplaced4(imageHeigth, imageWidth, CV_8U);

    LaplacianFilter(image1Gray, laplaced1, imageHeigth, imageWidth); // LaplacianFilter - 1920x1080x1 as result
    LaplacianFilter(image2Gray, laplaced2, imageHeigth, imageWidth);
    LaplacianFilter(image3Gray, laplaced3, imageHeigth, imageWidth);
    LaplacianFilter(image4Gray, laplaced4, imageHeigth, imageWidth);

    laplaced1 = abs(laplaced1); //absolute value
    laplaced2 = abs(laplaced2);
    laplaced3 = abs(laplaced3);
    laplaced4 = abs(laplaced4);

    imwrite("laplaced1.jpg", laplaced1); //write laplaced images
    imwrite("laplaced2.jpg", laplaced2);
    imwrite("laplaced3.jpg", laplaced3);
    imwrite("laplaced4.jpg", laplaced4);

    std::cout << "check LaplacedFilter" << std::endl;

    Mat stDev1(imageHeigth, imageWidth, CV_32F);
    Mat stDev2(imageHeigth, imageWidth, CV_32F);
    Mat stDev3(imageHeigth, imageWidth, CV_32F);
    Mat stDev4(imageHeigth, imageWidth, CV_32F);

    //check stability of image1/2/3/4

    standartDeviation(image1, stDev1, imageHeigth, imageWidth); // Calculation of standrat deviation - 1920x1080x1 as result
    standartDeviation(image2, stDev2, imageHeigth, imageWidth);
    standartDeviation(image3, stDev3, imageHeigth, imageWidth);
    standartDeviation(image4, stDev4, imageHeigth, imageWidth);

    std::cout << "check standartDeviation" << std::endl;

    Mat we1(imageHeigth, imageWidth, CV_32F); 
    Mat we2(imageHeigth, imageWidth, CV_32F);
    Mat we3(imageHeigth, imageWidth, CV_32F);
    Mat we4(imageHeigth, imageWidth, CV_32F);

    wellExp(image1, we1, imageHeigth, imageWidth); // Calculation of well-exposedness - 1920x1080x1 as result
    wellExp(image2, we2, imageHeigth, imageWidth);
    wellExp(image3, we3, imageHeigth, imageWidth);
    wellExp(image4, we4, imageHeigth, imageWidth);

    std::cout << "check well-exposedness" << std::endl;

    Mat weights1(imageHeigth, imageWidth, CV_32F);
    Mat weights2(imageHeigth, imageWidth, CV_32F);
    Mat weights3(imageHeigth, imageWidth, CV_32F);
    Mat weights4(imageHeigth, imageWidth, CV_32F);

    //pow() ??????

    weightsImage(laplaced1, stDev1, we1, weights1, imageHeigth, imageWidth); // Calculation of weight map - 1920x1080x1 as result
    weightsImage(laplaced2, stDev2, we2, weights2, imageHeigth, imageWidth);
    weightsImage(laplaced3, stDev3, we3, weights3, imageHeigth, imageWidth);
    weightsImage(laplaced4, stDev4, we4, weights4, imageHeigth, imageWidth);

    std::vector<Mat> weightsVec = {weights1, weights2, weights3, weights4};     

    std::vector<Mat> imagesVec = {image1, image2, image3, image4};

    std::cout << "check weights" << std::endl;

    Mat weights_sum(imageHeigth, imageWidth, CV_32F);

    weight_sum(weights1, weights1, weights1, weights1, weights_sum, imageHeigth, imageWidth);

    std::cout << "check weights sum" << std::endl;

    //opencv code 

    int maxlevel = static_cast<int>(logf(static_cast<float>(min(imageWidth, imageHeigth)) / logf(2.0f)));
        std::vector<Mat> res_pyr(maxlevel + 1);
        std::vector<Mutex> res_pyr_mutexes(maxlevel + 1);

        std::cout << "flag0" << std::endl;

        for (int i = 0; i < imagesVec.size(); ++i)
        imagesVec[i].convertTo(imagesVec[i], CV_32F);

        parallel_for_(Range(0, static_cast<int>(imagesVec.size())), [&](const Range& range) {
            for(int i = range.start; i < range.end; i++) {
                weightsVec[i] /= weights_sum;

                std::cout << "flag1" << std::endl;

                std::vector<Mat> img_pyr, weight_pyr;
                buildPyramid(imagesVec[i], img_pyr, maxlevel);
                buildPyramid(weightsVec[i], weight_pyr, maxlevel);
                // CV_CheckTypeEQ(img_pyr[0].type(), weight_pyr[0].type(), "");


                for(int lvl = 0; lvl < maxlevel; lvl++) {
                    Mat up;
                    pyrUp(img_pyr[lvl + 1], up, img_pyr[lvl].size());
                    img_pyr[lvl] -= up;
                }

                std::cout << "flag2" << std::endl;

                for(int lvl = 0; lvl <= maxlevel; lvl++) {
                    std::vector<Mat> splitted(3); // changed var to number
                    split(img_pyr[lvl], splitted);
                    for(int c = 0; c < 3; c++) {
                        splitted[c] = splitted[c].mul(weight_pyr[lvl]);
                    }
                    merge(splitted, img_pyr[lvl]);

                    std::cout << "flag2.1" << std::endl;

                    AutoLock lock(res_pyr_mutexes[lvl]);
                    if(res_pyr[lvl].empty()) {
                        res_pyr[lvl] = img_pyr[lvl];
                    } else {
                        res_pyr[lvl] += img_pyr[lvl];
                    }
                }

            }
        });

        std::cout << "flag3" << std::endl;
        
        for(int lvl = maxlevel; lvl > 0; lvl--) {
            Mat up;
            pyrUp(res_pyr[lvl], up, res_pyr[lvl - 1].size());
            res_pyr[lvl - 1] += up;
        }

        dst = res_pyr[0];

        imwrite("FinalImage.jpg", dst);
 
}

#ifdef HAVE_OPENCV_DNN

TEST(convolution_nchw, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src({1, ic, height, width}, CV_32F);
    Mat kernel({oc, ic, 3, 3}, CV_32F);
    Mat ref({1, oc, height - 2, width - 2}, CV_32F);
    Mat dst({1, oc, height - 2, width - 2}, CV_32F);
    randn(src, 0, 1);
    randn(kernel, 0, 1);

    convolution_opencv(src, kernel, ref, ic, oc);
    convolution_nchw_halide(src.ptr<float>(), kernel.ptr<float>(), dst.ptr<float>(),
                            ic, oc, height, width);

    ASSERT_LE(norm(ref, dst, NORM_INF), 4e-5f);
}

TEST(convolution_nhwc, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src_nchw({1, ic, height, width}, CV_32F);
    Mat kernel_oihw({oc, ic, 3, 3}, CV_32F);
    Mat ref({1, oc, height - 2, width - 2}, CV_32F);
    Mat dst_nhwc({1, height - 2, width - 2, oc}, CV_32F);
    randn(src_nchw, 0, 1);
    randn(kernel_oihw, 0, 1);

    convolution_opencv(src_nchw, kernel_oihw, ref, ic, oc);

    Mat kernel_ihwo, src_nhwc;
    cv::transpose(kernel_oihw.reshape(1, oc), kernel_ihwo);
    cv::transpose(src_nchw.reshape(1, ic), src_nhwc);

    convolution_nhwc_halide(src_nhwc.ptr<float>(), kernel_ihwo.ptr<float>(), dst_nhwc.ptr<float>(),
                            ic, oc, height, width);

    Mat dst;
    cv::transpose(dst_nhwc.reshape(1, dst_nhwc.size[1] * dst_nhwc.size[2]), dst);

    ASSERT_LE(norm(ref.reshape(1, 1), dst.reshape(1, 1), NORM_INF), 4e-5f);
}

#endif  // HAVE_OPENCV_DNN
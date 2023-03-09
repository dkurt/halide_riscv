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

#ifdef __riscv
  #include <HalideBuffer.h>
  #include "convolution_nchw.h"
  #include "convolution_nhwc.h"
  #include "convolution_int8.h"
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
  using namespace Halide;
  using namespace Halide::ConciseCasts;
#endif

static const int batch = 1;
static const int kW = 3;
static const int kH = 3;
static const int stride = 1;

void convolution_nchw_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width) {
    Buffer<float> input(src, {width, height, inpChannels, batch});
    Buffer<float> weights(kernel, {kW, kH, inpChannels, outChannels});
    Buffer<float> output(dst, {width - 2, height - 2, outChannels, batch});
#ifdef __riscv
    convolution_nchw(input, weights, output);
#else
    static Func conv("convolution_nchw");
    if (!conv.defined()) {
        input.set_name("input");
        weights.set_name("weights");

        Halide::Var x("x"), y("y"), c("c"), n("n");
        Halide::RDom r(0, kW, 0, kH, 0, inpChannels);
        Halide::Expr kx = x * stride + r.x;
        Halide::Expr ky = y * stride + r.y;
        Halide::Expr kc = r.z;

        conv(x, y, c, n) = sum(input(kx, ky, kc, n) *
                               weights(r.x, r.y, r.z, c));

        // Schedule
        conv.bound(x, 0, width - 2)
            .bound(y, 0, height - 2)
            .bound(c, 0, outChannels)
            .bound(n, 0, batch);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = 128;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;

        try {
            load_plugin("autoschedule_mullapudi2016");
            Pipeline(conv).apply_autoscheduler(target, {"Mullapudi2016", {{"parallelism", "0"}}});
        } catch(Halide::CompileError err) {
            CV_Error(cv::Error::StsError, err.what());
        }

        conv.print_loop_nest();

        // Dump AOT code
        std::string prefix = "convolution_nchw";
        conv.compile_to_header(prefix + ".h", {input, weights}, prefix, target);
        conv.compile_to_assembly(prefix + ".s", {input, weights}, prefix, target);
    }
#endif
}

void convolution_nhwc_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width) {
    Buffer<float> input(src, {inpChannels, width, height, batch});
    Buffer<float> weights(kernel, {outChannels, kW, kH, inpChannels});
    Buffer<float> output(dst, {outChannels, width - 2, height - 2, batch});
#ifdef __riscv
    convolution_nhwc(input, weights, output);
#else
    static Func conv("convolution_nhwc");
    if (!conv.defined()) {
        input.set_name("input");
        weights.set_name("weights");

        Halide::Var x("x"), y("y"), c("c"), n("n");
        Halide::RDom r(0, kW, 0, kH, 0, inpChannels);
        Halide::Expr kx = x * stride + r.x;
        Halide::Expr ky = y * stride + r.y;
        Halide::Expr kc = r.z;

        conv(c, x, y, n) = sum(input(kc, kx, ky, n) *
                               weights(c, r.x, r.y, r.z));

        // Schedule
        conv.bound(x, 0, width - 2)
            .bound(y, 0, height - 2)
            .bound(c, 0, outChannels)
            .bound(n, 0, batch);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = 128;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;

        try {
            load_plugin("autoschedule_mullapudi2016");
            Pipeline(conv).apply_autoscheduler(target, {"Mullapudi2016", {{"parallelism", "0"}}});
        } catch(Halide::CompileError err) {
            CV_Error(cv::Error::StsError, err.what());
        }

        conv.print_loop_nest();

        // Dump AOT code
        std::string prefix = "convolution_nhwc";
        conv.compile_to_header(prefix + ".h", {input, weights}, prefix, target);
        conv.compile_to_assembly(prefix + ".s", {input, weights}, prefix, target);
    }
#endif
}

void convolution_opencv(const cv::Mat& src, const cv::Mat& weights, cv::Mat& dst,
                        int inpChannels, int outChannels) {
    static cv::dnn::Net net;
    if (net.empty()) {
        cv::dnn::LayerParams lp;
        lp.set("num_output", outChannels);
        lp.set("kernel_w", kW);
        lp.set("kernel_h", kH);
        lp.set("stride", 1);
        lp.set("pad", 0);
        lp.set("bias_term", false);
        lp.type = "Convolution";
        lp.name = "testConv";
        lp.blobs.push_back(weights);
        net.addLayerToPrev(lp.name, lp.type, lp);
    }
    net.setInput(src);
    dst = net.forward();
}

void convolution_int8_halide(int32_t* src, int32_t* weights_, int32_t* bias_, int32_t* dst,
                             int inpChannels, int outChannels, int height, int width,
                             int32_t inpZero, int32_t outZero,
                             float inpScale, float* kernelScales, float outScale) {
    int kW = 1;
    int kH = 1;

    Buffer<int32_t> input(src, {inpChannels, width, height, batch});
    Buffer<int32_t> weights(weights_, {outChannels, 1, 1, inpChannels});
    Buffer<int32_t> bias(bias_, {outChannels});
    Buffer<int32_t> output(dst, {outChannels, width, height, batch});
#ifdef __riscv
    convolution_int8(input, weights, output);
#else
    static Func conv("convolution_int8");
    if (!conv.defined()) {
        input.set_name("input");
        weights.set_name("weights");
        bias.set_name("bias");

        Buffer<int32_t> scales(16);
        scales(0) = 1800;
        scales(1) = 1919;
        scales(2) = 1723;
        scales(3) = 1762;
        scales(4) = 1494;
        scales(5) = 1984;
        scales(6) = 3761;
        scales(7) = 1069;
        scales(8) = 3507;
        scales(9) = 3278;
        scales(10) = 2149;
        scales(11) = 2703;
        scales(12) = 1022;
        scales(13) = 2618;
        scales(14) = 3400;
        scales(15) = 2142;

        Halide::Var x("x"), y("y"), c("c"), n("n");
        Halide::RDom r(0, kW, 0, kH, 0, inpChannels);
        Halide::Expr kx = x * stride + r.x;
        Halide::Expr ky = y * stride + r.y;
        Halide::Expr kc = r.z;

        Expr input16 = input(kc, kx, ky, n) + inpZero;
        Expr weights16 = weights(c, r.x, r.y, r.z);
        Expr convolved = sum(input16 * weights16) + bias(c);
        conv(c, x, y, n) = ((scales(c) * convolved) >> 21) - outZero;

        // Schedule
        conv.bound(x, 0, width)
            .bound(y, 0, height)
            .bound(c, 0, outChannels)
            .bound(n, 0, batch);
        conv.vectorize(c, 16);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = 128;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;

        conv.print_loop_nest();

        // Dump AOT code
        std::string prefix = "convolution_int8";
        conv.compile_to_header(prefix + ".h", {input, weights}, prefix, target);
        conv.compile_to_assembly(prefix + ".s", {input, weights}, prefix, target);
    }
#endif
}

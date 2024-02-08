#include <opencv2/opencv.hpp>

#include "algos.hpp"

#include <limits>
#include <iostream>

using namespace std;

#ifdef __riscv
  #include <HalideBuffer.h>
  #include "idw_halide.h"
  #include "idw_halide_vec.h"
  #include "idw_halide_parallel.h"
  #include "idw_halide_parallel_vec.h"
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
  using namespace Halide;
#endif

static const int pointCount = 100;

void idw_halide(const uint8_t* src, uint8_t* dst, int height, int width, int* pointsBuf, float* weightsBuf) {
    float* maskBuf = new float[height * width]();

    Buffer<float> mask(maskBuf, {width, height});
    Buffer<uint8_t> output(dst, {width, height});

    Buffer<int> points(pointsBuf, {pointCount*3});
    Buffer<float> weights(weightsBuf, {pointCount});
#ifdef __riscv
<<<<<<< HEAD
    idw_halide_(mask);
#else
    static Func f("idw_halide_");
=======
    idw(mask);
#else
    static Func f("idw");
>>>>>>> 3b97268b3450a5058fcae17b4ec4a816f514fcb9

    // try {
    if (!f.defined()) {
        Var x("x"), y("y");
        RDom r(0, pointCount);
<<<<<<< HEAD
        f(x, y) = 0.F;
        Expr x0 = points(3*r+1);
        Expr y0 = points(3*r);
        Expr dx = x - x0;
        Expr dy = y - y0;
        Expr weight = weights(r);
        f(x, y) += hypot(dx, dy) * weight;

        // f.vectorize(r, 8);
        const int factor = 4;
        // f.update().atomic().vectorize(r, factor);
        // f.update().parallel(x);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        // f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("idw_halide.h", {}, "idw_halide_", target);
        f.compile_to_assembly("idw_halide.s", {}, "idw_halide_", target);
    }
    // }
    // catch (Halide::Error &e) {
    //     cout << e.what() << '\n';
    // }

    f.realize(mask);
#endif

    float maxVal = 193.0;
    float minVal = 58.0;
    float diff = maxVal - minVal;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            dst[y*width + x] = (uint8_t) (255 * (maskBuf[y*width + x] - minVal) / diff);
        }
    }
    delete[] maskBuf;
}

void idw_halide_parallel(const uint8_t* src, uint8_t* dst, int height, int width, int* pointsBuf, float* weightsBuf) {
    float* maskBuf = new float[height * width]();

    Buffer<float> mask(maskBuf, {width, height});
    Buffer<uint8_t> output(dst, {width, height});

    Buffer<int> points(pointsBuf, {pointCount*3});
    Buffer<float> weights(weightsBuf, {pointCount});
#ifdef __riscv
    idw_halide_parallel_(mask);
#else
    static Func f("idw_halide_parallel_");

    try {
    if (!f.defined()) {
        Var x("x"), y("y"), x_outer("x_outer"), y_outer("y_outer"), x_inner("x_inner"), y_inner("y_inner"), tile_index("tile_index");
        RDom r(0, pointCount);
        f(x, y) = 0.F;
        Expr x0 = points(3*r+1);
        Expr y0 = points(3*r);
        Expr dx = x - x0;
        Expr dy = y - y0;
        Expr weight = weights(r);
        f(x, y) += hypot(dx, dy) * weight;

        f.tile(x, y, x_outer, y_outer, x_inner, y_inner, width / 4, height / 4).fuse(x_outer, y_outer, tile_index).parallel(tile_index);
        f.update().tile(x, y, x_outer, y_outer, x_inner, y_inner, width / 4, height / 4).fuse(x_outer, y_outer, tile_index).parallel(tile_index);
        
        const int factor = 4;
        // f.update().atomic().vectorize(r, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        // f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("idw_halide_parallel.h", {}, "idw_halide_parallel_", target);
        f.compile_to_assembly("idw_halide_parallel.s", {}, "idw_halide_parallel_", target);
    }

    f.realize(mask);
    }
    catch (Halide::Error &e) {
        cout << e.what() << '\n';
    }
#endif

    float maxVal = 193.0;
    float minVal = 58.0;
    float diff = maxVal - minVal;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            dst[y*width + x] = (uint8_t) (255 * (maskBuf[y*width + x] - minVal) / diff);
        }
    }
    delete[] maskBuf;
}

void idw_halide_vec(const uint8_t* src, uint8_t* dst, int height, int width, int* pointsBuf, float* weightsBuf) {
    float* maskBuf = new float[height * width]();

    Buffer<float> mask(maskBuf, {width, height});
    Buffer<uint8_t> output(dst, {width, height});

    Buffer<int> points(pointsBuf, {pointCount*3});
    Buffer<float> weights(weightsBuf, {pointCount});
#ifdef __riscv
    idw_halide_vec_(mask);
#else
    static Func f("idw_halide_vec_");

    // try {
    if (!f.defined()) {
        Var x("x"), y("y");
        RDom r(0, pointCount);
=======

>>>>>>> 3b97268b3450a5058fcae17b4ec4a816f514fcb9
        f(x, y) = 0.F;
        Expr x0 = points(3*r+1);
        Expr y0 = points(3*r);
        Expr dx = x - x0;
        Expr dy = y - y0;
        Expr weight = weights(r);
        f(x, y) += hypot(dx, dy) * weight;

        // f.vectorize(r, 8);
        const int factor = 4;
        f.update().atomic().vectorize(r, factor);
<<<<<<< HEAD
        // f.update().parallel(x);
=======
>>>>>>> 3b97268b3450a5058fcae17b4ec4a816f514fcb9

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
<<<<<<< HEAD
        // f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("idw_halide_vec.h", {}, "idw_halide_vec_", target);
        f.compile_to_assembly("idw_halide_vec.s", {}, "idw_halide_vec_", target);
=======
        f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("idw.h", {}, "idw", target);
        f.compile_to_assembly("idw.s", {}, "idw", target);
>>>>>>> 3b97268b3450a5058fcae17b4ec4a816f514fcb9
    }
    // }
    // catch (Halide::Error &e) {
    //     cout << e.what() << '\n';
    // }

    f.realize(mask);
#endif

    float maxVal = 193.0;
    float minVal = 58.0;
    float diff = maxVal - minVal;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            dst[y*width + x] = (uint8_t) (255 * (maskBuf[y*width + x] - minVal) / diff);
        }
    }
    delete[] maskBuf;
}

<<<<<<< HEAD
void idw_halide_parallel_vec(const uint8_t* src, uint8_t* dst, int height, int width, int* pointsBuf, float* weightsBuf) {
    float* maskBuf = new float[height * width]();

    Buffer<float> mask(maskBuf, {width, height});
    Buffer<uint8_t> output(dst, {width, height});

    Buffer<int> points(pointsBuf, {pointCount*3});
    Buffer<float> weights(weightsBuf, {pointCount});
#ifdef __riscv
    idw_halide_parallel_vec_(mask);
#else
    static Func f("idw_halide_parallel_vec_");

    try {
    if (!f.defined()) {
        Var x("x"), y("y"), x_outer("x_outer"), y_outer("y_outer"), x_inner("x_inner"), y_inner("y_inner"), tile_index("tile_index");
        RDom r(0, pointCount);
        f(x, y) = 0.F;
        Expr x0 = points(3*r+1);
        Expr y0 = points(3*r);
        Expr dx = x - x0;
        Expr dy = y - y0;
        Expr weight = weights(r);
        f(x, y) += hypot(dx, dy) * weight;

        f.tile(x, y, x_outer, y_outer, x_inner, y_inner, width / 4, height / 4).fuse(x_outer, y_outer, tile_index).parallel(tile_index);
        f.update().tile(x, y, x_outer, y_outer, x_inner, y_inner, width / 4, height / 4).fuse(x_outer, y_outer, tile_index).parallel(tile_index);
        
        const int factor = 4;
        f.update().atomic().vectorize(r, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        // f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("idw_halide_parallel_vec.h", {}, "idw_halide_parallel_vec_", target);
        f.compile_to_assembly("idw_halide_parallel_vec.s", {}, "idw_halide_parallel_vec_", target);
    }

    f.realize(mask);
    }
    catch (Halide::Error &e) {
        cout << e.what() << '\n';
    }
#endif

    float maxVal = 193.0;
    float minVal = 58.0;
    float diff = maxVal - minVal;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            dst[y*width + x] = (uint8_t) (255 * (maskBuf[y*width + x] - minVal) / diff);
        }
    }
    delete[] maskBuf;
}

=======
>>>>>>> 3b97268b3450a5058fcae17b4ec4a816f514fcb9
void idw_ref(const uint8_t* src, uint8_t* dst, int height, int width, int* points, float* weights) {
    float* mask = new float[height * width]();

    float maxVal = 193.0;
    float minVal = 58.0;

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            float dot = 0;
            for (int i = 0; i < pointCount; i++) {
                int x0 = points[3 * i + 1];
                int y0 = points[3 * i];
                int dx = x - x0;
                int dy = y - y0;

                dot += sqrt(dx*dx + dy*dy) * weights[i];
            }

            mask[y*width + x] = dot;
        }
    }

    float diff = maxVal - minVal;

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            dst[y*width + x] = (uint8_t) (255 * (mask[y*width + x] - minVal) / diff);
        }
    }

    delete[] mask;
}

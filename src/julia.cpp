#include <opencv2/opencv.hpp>

#ifdef __riscv
#include <HalideBuffer.h>
#include "halide_julia_rv.h"

using namespace Halide::Runtime;

#else

#include <Halide.h>

using namespace Halide;

#endif

static const float ci = -0.75;
static const float cr = 0.0;

static const uint8_t step_bound = 255;
static const uint8_t upper_bound = 4;

static const int parallel_factor = 4;
static const int vector_factor = 4;

// no Expr type in riscv build
#ifndef __riscv
// src :: Int -> fraction :: Float -> Float
Expr halide_julia_norm(Expr src, Expr fraction) {
    return (((cast<float>(src)) * 4.0f) / fraction) - 2.0f;
}

struct HComplex {
    Expr real, imag;

    HComplex(Tuple t)
        : real(t[0]), imag(t[1]) {
    }

    HComplex(Expr r, Expr i)
        : real(r), imag(i) {
    }

    HComplex(FuncRef t)
        : HComplex(Tuple(t)) {
    }

    operator Tuple() const {
        return {real, imag};
    }

    HComplex operator+(const HComplex &other) const {
        return {real + other.real, imag + other.imag};
    }

    HComplex operator*(const HComplex &other) const {
        return {real * other.real - imag * other.imag,
                real * other.imag + imag * other.real};
    }

    Expr magnitude_squared() const {
        return real * real + imag * imag;
    }
};
#endif

void halide_julia(uint8_t* dst, int height, int width) {
    Buffer output(dst, {width, height});
#ifdef __riscv
    halide_julia_rv(output);
#else
    static Func julia("julia");

    if (!julia.defined()) {
        Var x, y;

        HComplex c(cr, ci);

        Expr x_ranged;
        x_ranged = halide_julia_norm(x, height);

        Expr y_ranged;
        y_ranged = halide_julia_norm(y, width);

        Var t;
        julia(x, y, t) = HComplex(x_ranged, y_ranged);

        // loop
        RDom index(1, step_bound);
        HComplex current = julia(x, y, index - 1);
        julia(x, y, index) = current * current + c;

        Expr esc_cond = HComplex(julia(x, y, index)).magnitude_squared() < upper_bound;
        Tuple first_escape = argmin(esc_cond);

        julia.update(0).vectorize(x, 4);

        // proj to result
        Func result;
        result(x, y) = cast<uint8_t>(first_escape[0]);

        Var yi, yo;
        result.split(y, yo, yi, parallel_factor);
        result.parallel(yo);

        julia.store_at(result, yo);
        julia.compute_at(result, yi);

        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = 128;

        CV_Assert(target.vector_bits <= 128);

        Halide::compile_standalone_runtime("halide_runtime.o", target);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        result.print_loop_nest();

        result.compile_to_header("halide_julia_rv.h", {}, "halide_julia_rv", target);
        result.compile_to_assembly("halide_julia_rv.s", {}, "halide_julia_rv", target);
    }
#endif
}

struct Complex {
    float real, imag;

    Complex(float fst, float snd)
        : real(fst), imag(snd) {
    }

    Complex operator+(const Complex &other) const {
        return {real + other.real, imag + other.imag};
    }

    Complex operator*(const Complex &other) const {
        return {real * other.real - imag * other.imag,
                real * other.imag + imag * other.real};
    }

    float magnitude_squared() const {
        return real * real + imag * imag;
    }
};

float julia_norm(int src, float fraction) {
    return ((((float)src) * 4.0f) / fraction) - 2.0f;
}

uint8_t julia_step(float x_src, float y_src) {
    static const Complex c(cr, ci);
    Complex current(x_src, y_src);

    int count = 0;

    for (;count < step_bound && current.magnitude_squared() <= upper_bound; count++) {
        current = current * current + c;
    }

    return count;
}

void julia_ref(uint8_t* dst, int height, int width) {
    static const int channel_number = 1;

    for (int y = 0; y < height; ++y) {
        uint8_t* dstData = dst + y * width * channel_number;

        for (int x = 0; x < width; ++x) {
            const float ranged_x = julia_norm(x, (float)height);
            const float ranged_y = julia_norm(y, (float)width);

            const uint8_t result = julia_step(ranged_x, ranged_y);

            dstData[x] = result;
        }
    }
}

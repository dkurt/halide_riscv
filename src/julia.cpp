#include <opencv2/opencv.hpp>

#ifdef __riscv
#include <HalideBuffer.h>
#include "bgr2gray_interleaved.h"
#include "bgr2gray_planar.h"

using namespace Halide::Runtime;

#else

#include <Halide.h>

using namespace Halide;

#endif

static const float ci = -0.75;
static const float cr = 0.0;

// src :: Int -> fraction :: Float -> Float
Expr halide_julia_norm(Expr src, Expr fraction) {
    return (((cast<float>(src)) * 4.0f) / fraction) - 2.0f;
}

struct Complex {
    Expr real, imag;

    Complex(Tuple t)
        : real(t[0]), imag(t[1]) {
    }

    Complex(Expr r, Expr i)
        : real(r), imag(i) {
    }

    Complex(FuncRef t)
        : Complex(Tuple(t)) {
    }

    operator Tuple() const {
        return {real, imag};
    }

    Complex operator+(const Complex &other) const {
        return {real + other.real, imag + other.imag};
    }

    Complex operator*(const Complex &other) const {
        return {real * other.real - imag * other.imag,
                real * other.imag + imag * other.real};
    }

    Expr magnitude_squared() const {
        return real * real + imag * imag;
    }
};

void halide_julia(uint8_t* dst, int height, int width) {
    static const uint8_t step_bound = 255;
    static const uint8_t upper_bound = 4;

    Buffer output(dst, width, height);

    Var x, y;

    Complex c(cr, ci);

    Expr x_ranged;
    x_ranged = halide_julia_norm(x, height);

    Expr y_ranged;
    y_ranged = halide_julia_norm(y, width);

    Func julia;
    Var t;
    julia(x, y, t) = Complex(x_ranged, y_ranged);

    // loop
    RDom index(1, 100);
    Complex current = julia(x, y, index - 1);
    julia(x, y, index) = current * current + c;

    Expr esc_cond = Complex(julia(x, y, index)).magnitude_squared() < upper_bound;
    Tuple first_escape = argmin(esc_cond);

    // proj to result
    Func result;
    result(x, y) = cast<uint8_t>(first_escape[0]);

    result.realize(output);
}

float julia_norm(int src, float fraction) {
    return ((((float)src) * 4.0) / fraction) - 2.0;
}

uint8_t julia_step(float x_src, float y_src) {
    static const uint8_t count_bound = 255;
    static const uint8_t upper_bound = 4;

    float x = x_src;
    float y = y_src;

    int count = 0;

    for (;count < count_bound && x * x + y * y < upper_bound; count++) {
        float new_x = x * x - y * y + cr;
        float new_y = 2 * x * y + ci;

        x = new_x;
        y = new_y;
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

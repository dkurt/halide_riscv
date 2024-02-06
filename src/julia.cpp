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
#include "bgr2gray_interleaved.h"
#include "bgr2gray_planar.h"

using namespace Halide::Runtime;

#else

#include <Halide.h>

using namespace Halide;

#endif

double convert_to_range(int src, double fraction) {
    return ((((double) src) * 4.0) / fraction) - 2.0;
}

uint8_t julia_step(double x_src, double y_src, double ci, double cr) {
    static const uint8_t count_bound = 255;
    static const uint8_t upper_bound = 4;

    double x = x_src;
    double y = y_src;

    int count = 0;

    for (;count < count_bound && x * x + y * y < upper_bound; count++) {
        double new_x = x * x - y * y + cr;
        double new_y = 2 * x * y + ci;

        x = new_x;
        y = new_y;
    }

    return count;
}

void julia_ref(uint8_t* dst, int height, int width) {
    static const int channel_number = 1;
    // hardcoded for now
    const double cx = -0.75;
    const double cy = 0.0;

    for (int y = 0; y < height; ++y) {
        uint8_t* dstData = dst + y * width * channel_number;

        for (int x = 0; x < width; ++x) {
            const double ranged_x = convert_to_range(x, (double) height);
            const double ranged_y = convert_to_range(y, (double) width);

            const uint8_t result = julia_step(ranged_x, ranged_y, cx, cy);

            dstData[x] = result;
        }
    }
}

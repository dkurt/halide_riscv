import os
import numpy as np
import tensorflow as tf

import cv2 as cv


# def conv(inp, kernel, bias):
#     height, width, inp_ch = inp.shape[1:]
#     out_ch, kh, kw = kernel.shape[:3]

#     out = np.zeros((1, 112, 112, 16), dtype=np.int8)
#     for oc in range(16):
#         for h in range(112):
#             for w in range(112):
#                 for kx in range(-1, 2):
#                     for ky in range(-1, 2):
#                         x = w * 2 + kx
#                         y = h * 2 + ky
#                         for ic in range(3):
#                             val = 0 <= x and x < width and 0 <= y and y < height inp[0, y, x, ic] : 0
#                             out[0, h, w, oc] += val *

#                             out[0, h, w, oc] += min(max(val, 0), 6)


testdata = os.environ['OPENCV_TEST_DATA_PATH']

# image = cv.imread(os.path.join(testdata, "cv", "shared", "lena.png"))
# image = cv.cvtColor(image, cv.COLOR_BGR2RGB)

interpreter = tf.lite.Interpreter("/home/dkurt/lite-model_movinet_a2_stream_kinetics-600_classification_tflite_int8_1.tflite",
                                  experimental_preserve_all_tensors=True)
interpreter.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Run model
# inp = cv.resize(image, inp_size)
# inp = np.expand_dims(inp, 0)
# inp = inp.astype(np.float32) / 255  # NHWC

np.random.seed(123)
inp = np.random.uniform(0, 1, [1, 1, 224, 224, 3]).astype(np.float32)

# print(input_details[0]['index'])
interpreter.set_tensor(60, inp)

interpreter.invoke()

conv_inp = interpreter.get_tensor(389)
conv_out = interpreter.get_tensor(390)

kernel = interpreter.get_tensor(153)
bias = interpreter.get_tensor(154)

print(bias)

def save(data, filename):
  with open(f"{filename}.bin", "wb") as f:
    f.write(data.tobytes())

save(conv_inp, "conv_inp")
save(conv_out, "conv_out")
save(kernel.transpose(3, 1, 2, 0), "kernel")
save(bias, "bias")
# print(conv_inp.shape)
# print(conv_out.shape)
print(kernel.shape)
print(kernel.transpose(3, 1, 2, 0).shape)
# exit()

# print(conv_out[0, 0, 2, 0])

print(conv_inp.shape)
print(conv_out.shape)
# print(conv_inp[0, 0, 0, 0])
print(conv_out[0, 0, 0, 0])

# print(kernel.shape)
# print(bias.shape)
# print(kernel.dtype)
# print(bias.dtype)
x_scale = 0.0235294122248888
k_scales = [
  0.00783687736839056,
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
  0.00932697020471096,
]
res_scale = 0.21487019956111908

# s = x_scale * k_scale / res_scale
shift = 21
scales = [round((x_scale * ks) / (res_scale * pow(2, -shift))) for ks in k_scales]
print(scales)
# for s in scales:
#     log2 = pow(2, -21)
#     mul = round(s / log2)
#     print(mul, abs(s - mul * log2))
# exit()

x = (conv_inp[0, 0, 0] + 128)
w = kernel[0].reshape(-1)
# res = (1800 * (np.sum(x * w) + bias[0])) >> 21
res = (1800 * (np.sum(x * w) + bias[0])) >> 21
print(res + 7)
# print(res)

# x = (conv_inp[0, 0, 0])
# w = kernel[0].reshape(-1)
# res = s * (np.sum(x * w) + bias[0]) + 7
# print(res)


# res = (inp / 0.003921568859368563 - 128).astype(np.int8)
# print(out[0, 0, 0, 0, 2])
# print(res[0, 0, 0, 0, 2])
# print(np.max(np.abs(out -  res)))
# print(out.shape)
# print(out.dtype)

# for details in output_details:
#     out = interpreter.get_tensor(details['index'])  # Or use an intermediate layer index
#     out_name = details['name']
#     np.save(f"{model_name}_out_{out_name}.npy", out)

import matplotlib.pyplot as plt
import numpy as np
import cv2 as cv

slices = []
for i in range(1, 73):
    slices.append(cv.imread(f"./new_image{i:04}.png", cv.IMREAD_UNCHANGED))
    slices[-1] = cv.rotate(slices[-1], cv.ROTATE_90_CLOCKWISE)
    slices[-1][...,3] = slices[-1][...,3] > 0

img = np.stack(slices, axis=2)

x, y, z = np.indices((img.shape[0] + 1, img.shape[1] + 1, img.shape[2] + 1))
is_visible = img[...,3]

img = img.astype(np.float32) / 255
colors = img[..., [2, 1, 0]]

ax = plt.figure().add_subplot(projection='3d')
ax.voxels(x, y, z, is_visible,
          facecolors=colors,
          edgecolors=np.clip(2*colors - 0.5, 0, 1),  # brighter
          linewidth=0.5)
ax.set(xlabel='x', ylabel='y', zlabel='z')
ax.set_aspect('auto')

plt.savefig("img.png")
from turtle import width
import cv2
import numpy as np

# load the image of the specified color and printing its shape and image.
img = cv2.imread("meme.jpg",cv2.IMREAD_GRAYSCALE)

print(img)

print(img.shape)

# Resolution and the size of the image.
height, width = img.shape[:2]
print(height)
print(width)

# Binary Representation of the file and writing the text to a file.
print(np.binary_repr(230,width=8))
file = open("img.txt",'w')
for i in range(height):
    for j in range(width):
        file.write(np.binary_repr(img[i][j],width=8)+"\n")
file.write(img)
cv2.imshow("test image",img)
cv2.waitKey(0)
cv2.destroyAllWindows()
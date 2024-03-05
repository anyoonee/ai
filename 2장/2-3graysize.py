import cv2 as cv 
import sys

img = cv.imread('soccer.jpg')
if img is None:
    sys.exit('파일을 찾을 수 없습니다.')

gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
gray_small = cv.resize(gray, dsize=(0,0), fx=0.5, fy=0.5)
img_small = cv.resize(img, dsize=(0,0), fx=0.6, fy=0.7)

cv.imwrite('soccer_gray.jpg', gray)
cv.imwrite('soccer_gray_small.jpg',gray_small)
cv.imwrite('soccer_hsv.jpg', hsv)
cv.imwrite('soccer_img_small.jpg', img_small)

cv.imshow('Color image', img)
cv.imshow('Gray Image', gray)
cv.imshow('Gray image small', gray_small)
cv.imshow('Hsv image', hsv)
cv.imshow('img small', img_small)



cv.waitKey()
cv.destroyAllWindows()

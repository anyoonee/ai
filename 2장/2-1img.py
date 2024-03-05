import cv2 as cv # opencv 사용
import sys # 운영체제 사용

img = cv.imread('soccer.jpg') #파일읽기
#img = cv.imread('girl_laughing.jpg')


if img is None : 
        sys.exit('파일을 찾을 수 없습니다.')
        
cv.imshow('soccer image', img)

cv.waitKey() # 멈추기
cv.destroyAllWindows() # 닫기

# 연습문제
img1 = cv.imread('soccer.jpg')
img2 = cv.imread('girl_laughing.jpg')

if img is None:
    sys.exit('파일을 찾을 수 없습니다.')
    
cv.imshow('open cv image1', img1, img1)
cv.imshow('open cv image2', img2, img1)


# 2-7 mouseEvent.py

import cv2 as cv
import sys

img = cv.imread('girl_laughing.jpg')

if img is None:
    sys.exit('파일을 찾을수가 없습니다.')

def draw(event,x,y,flags,param): #콜백 함수
    if event==cv.EVENT_LVUTTONDOWN: #마우스 왼쪽 버튼 클릭했을때
        cv.rectangle(img,(830,30),(1000,200),(0,0,255),2) # 직사각형 그리기
    elif event == cv.EVENT_RBUTTONDOWN:
        cv.rectangle(img,(x,y),(x+100,y+100),(255,0,0),2)
        
    cv.imshow('Drawing',img)
    
cv.namedWindow('Drawing')
cv.imshow('Drawing',img)

cv.setMouseCallback('Drawing',draw) # Drawing 윈도우에 draw 콜백 함수 지정

while(True):
    if cv.waitKey(1) == ord('q'):
       cv.destroyAllWindows()
       break



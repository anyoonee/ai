#.81
"""
price = 3000
num = 3
pay = 10000
change =  pay - price * num
print("거스름돈 --> %d"%change)
print(f"거스름돈 --> { change}")
"""

from datetime import datetime

print (datetime.today().year ) # 현재년도

#83
name = input("당신의 이름은?")
birth = int(input("당신이 태어난 해는?"))
age = 2023 - birth 
print("%s님의 나이는 만 %d 살 입니다."%(name,age))
  
#86
# year = input("년은? ")
# month = input("월은? ")
# day = input("일은? ")

from datetime import datetime

year = datetime.today().year
# print(year,month,day,sep='-')

#.87
width = 10
height = 20
length = 2 * width + 2 * height
area = width * height
print("사각형의 너비 : %dcm" % width)
print("사각형의 높이 : %dcm" % height)
print("둘레 길이 :  %dcm" % length)
print("면적 : %dcm2" % area)

#만약 사각형의 넓이가 100이 넘으면 큰 사각형
# 아니면 작은 사각형
if width >=100 : 
     print("큰사각형")
else : print("작은 사각형")

#넓이가 100<=넓이 <=300 큰사각형
#        50<=넓이 <=99 중간
#         0<=넓이 <=49 작은
if 100<= width <=300:
    print("큰사각형")
elif 50 <= width <=99:
    print("중간사각형")
else :
  print("작은사각형")
#
month = int(input("월을 숫자로 입력하세요 : "))
if month == "3" or month =="4" or month =="5":
  print(f"{month}월은 봄입니다.")

if 6<= month <=8 :
  print(f"{month}월은 여름입니다.")

if 9<= month <=11 :
  print(f"{month}월은 가을입니다.")

if 1<= month <=2 or month ==12 :
  print(f"{month}월은 겨울입니다.")

#
a = input("주민번호 뒷자리 첫번째 숫자를 입력해 주세요: ")
if a=="1" or a=="3":
  print("남성입니다!")

if a=="2" or a=="4" :
  print("여성입니다!")

#
char = input("영문 대문자 또는 소문자 하나를 입력하세요 : ")
char2 = char.upper()

if char2=='A' or char2=='E' or char2=='I' or char2=='O' or char2=='U' :
  print("%s -> 모음"%char)
else:
  print("%s -> 자음" % char)

#
height = int(input("키는? "))
weight = int(input("몸무게는? "))

s=(height -100)*0.9

print("=" * 50)
print("키 :", height)
print("몸무게 :" ,weight)
if weight >= s :
  print("건강을 위해 다이어트가 필요합니다.")
else :
  print("표준 또는 마른체형 입니다!")  

#
print("아르바이트 급여 계산 프로그램")
print("* 시급")
print("- 주간 근무 : 9620원")
print("- 야간근무 : 주간 시급 * 1.5")
print()

hour_pay = 9620

a = int(input("1(주간근무)또는 2(야간근무)을 입력해주세요 : "))
work_time = int(input("근무 시간을 입력해주세요 : "))

if a=="1" :
  day_night = "주간"
  pay = hour_pay * work_time
else :
  day_night = "야간"
  pay = hour_pay * work_time * 1.5
print(f"{work_time}시간 동안 일한 {day_night} 급여는 {pay}입니다.")
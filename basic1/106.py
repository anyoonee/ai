# 나이를 입력 받아서 65세 이상이면 입장료 무료
#age = int(input("나이?"))

from datetime import datetime

ticket =2000
birth = int(input("태어난 년도는?"))

currentYear = datetime.today().year
age = currentYear - birth

if birth > currentYear :
  print(f"올해가 {currentYear}년입니다 . 다시입력하세요.")
elif age >= 65 : 
  print(f"나이가 {age}로 입장료 무료입니다.")
elif age <=10 :
  print(f"나이가 {age}로 입장료 무료입니다.")
elif 40<= age <=60 :
 print(f"나이가 {age}로 요금 {ticket-1000} 입니다.")
elif 30<= age <=39 :
 print(f"나이가 {age}로 요금 {ticket-500} 입니다.") 
elif 20<= age <=29:
  print(f"나이가 {age}로 요금{ticket}입니다.")


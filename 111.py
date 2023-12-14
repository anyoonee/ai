# 111페이지
"""
start = int(input("시작 수는? "))
end = int(input("끝 수는?"))
num = int(input("정수를 입력하세요 : "))

result = "%d은(는) %d ~ %d 사이에없다."%(num,start,end)

if start <= num <= end :
  result = "%d은(는) %d ~ %d 사이에 있다."%(num,start,end)

  print(result)
"""
  # 난수(규칙이 없는 수)를 구하기
  
import random

c=0

# print(random.random()) # 0 <= r <1
# print(random.randrange(1,7)) #1 <= 랜덤수 < 7
thinkNumber = random.randrange(1,31)
result = "정답입니다"

a1 = int(input("답은?"))
while a1 !=thinkNumber :

    if a1 < thinkNumber :
      result = "답보다 큰 수 입니다."
      c += 1
    else :
      result = "답보다 작은 수 입니다."
      c += 1
    print(f"{result}")
    a1 = int(input("답은?"))
result = "정답입니다."
print(f"{c}번 만에 찾았습니다.")

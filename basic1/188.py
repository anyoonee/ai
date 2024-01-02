# 요소 변환 수정(삽입,삭제,업데이트)하기
flowers=["목련","벚꽃","장미","백일홍"]
print(flowers)
flowers[1]="무궁화" #수정
print(flowers)

#백일홍 수정하기 개나리
flowers[-1] = "개나리"
print(flowers)
#추가하기 뒤로 붙이기
flowers.append("백일홍")
print(flowers)
flowers.append("튜울립")
print(flowers)
#메소드 vs 함수 동작시키기
#메소드는 객체 안에서 동작을 시키는것
#함수 동작을 시키는 것

#실무에서는?
scores = [ ] # 빈 리스트
scores.append(100)
scores.append(90)
scores.append(85)
scores.append(100)
scores.append(95)
print(scores)

# 특정 위치 삽입하기
fruits = []
"""
while True :
  fruit = input("좋아하는 과일은?")
  if fruit == "끝" :
    break
  fruits.append(fruit)
print(fruits)
fruits.insert(1,"자몽")
print(fruits)
"""

#특정요소 찾기
number = [5,20,13,7,8,22,7,17]
print(number)
idx = number.index(7,5) # 7번값의 인덱스 찾는데 인덱스 번호 5번 이후
print(idx)

number = [5,20,13,7,8,22,7,17,8,9,8,1]
print(number.index(8,9,11))

flowers=["목련","벚꽃","장미","벚꽃","백일홍","벚꽃"]
# 처음으로 나오는 "벚꽃"이 몇번째 인덱스에 있나요?
print(flowers.index("벚꽃"))# 1번 인덱스에 있다.
# 인덱스 번호 4이후로 나오는 인덱스 찾기
print(flowers.index("벚꽃",4))

#삭제하기 remove(요소)
flowers=["목련","벚꽃","장미","벚꽃","백일홍","벚꽃"]
flowers.remove("목련")
print(flowers)
flowers.remove("벚꽃")
print(flowers)

x=flowers.pop(2)
print(x)
print(flowers)

flowers.clear()
print(flowers)

# 197
# 5-1
data = list(range(1,21))

for i in range(0,len(data)):
  print("%d"%data[i], end=" ")
print()

# 5-2
data = list(range(1,21))

for i in range(1,len(data),2):

    print("%d"%data[i], end=" ")
print()

# 5-3
data = list(range(1,21))
i=0
while i < len(data) :
   if(i+1)%2 == 1 :
    print("%d"%data[i], end=" ")
   i+=1
print()    

# 5-4
data=[]
for x in range(10,21) :
   data.append(x)
print(data)




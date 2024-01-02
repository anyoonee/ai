#복습
for i in range(10) :
  print(i, sep=" ")
print("-"*30)
for i in range(1,11) :
  print(i,end=" ")
print("-"*30)
for i in "I love you!" :
  print(i ,end=" ")
print("-"*30)
sum =0
j=1
while True:
  if sum >= 5000:
    break
  else :
    j += 1
    sum += j
print(j,sum)

#for문 이용해 10!구하기
fac =1
for i in range(1,11):
  fac = fac *i
print(fac)

#179.4-1
count=0
i=1

while i < 1001: 
   if i%3!=0 :
     print(i,end=" ")
     count +=1
   
   if count == 10 :
     print()
     count = 0

  
   i+=1  

# for i in range(1,1001) :
#   if count == 10 :
#     print()
#     count =0
#   if i%3 != 0 :
#     print(i,end=" ")
#     count +=1

#4-2
con = "y"
while con=="y":
    jumsu = int(input("성적을 입력하세요."))
    if 90 <= jumsu <=100 :
      result = "수"
    elif 80 <= jumsu <=89 :
      result = "우"
    elif 70 <= jumsu <=79 :
      result = "미"
    elif 60<= jumsu <=69 :
      result = "양"
    elif 0<= jumsu <=59 :
      result = "가"
    print(f"등급 : {result}")
    con=input("계속하시겠습니까?(중단:q, 계속:y)")

#4-3
start=int(input("시작 수를 입력하세요: "))
end=int(input("끝 수를 입력하세요: "))

"""
start = int( input("시작 수를 입력해주세요:") )   
end = int(input("끝 수를 입력해주세요 :"))    
x=True #소수인 경우는 True로 아닌 경우 False로    
for i in range( start, end+1) : # start 30 end 80
    for j in range( 2, start) : # 2~29까지 나누어 본다
        if i % j == 0 :
            x = False
            break # 한단계 반복문 밖으로 나간다. 즉 for j에서 밖으로 
    if x :
        print( i, end=" ")
"""
a = start

while a<=end+1 :
  x=True
  for i in range(2,a):
    if a%1 ==0 :
      x=False
      break
  if(x):
    print(a,end=" ")
  a+=1


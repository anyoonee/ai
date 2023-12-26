#7-1
def add(a,b):
  c = a+b
  print("%d + %d = %d"%(a,b,c))
add(12,15)
add(245,300)
add(-38,-12)

#7-2
def sum_int(start,end):
  total=0
  for i in range(start,end+1): #start~end(end 포함)
    total=total +i
  print("%d~%d 정수 합계 : %d"%(start,end,total))

sum_int(20,50)
sum_int(600,800)

#7-3
def member_join(*args):
  result=""
  for arg in args:              # 매개변수 args에 각 요소 값을 가지고 반복
    result = result + arg + " "
  print("가입 회원:", result )

member_join("김정연","안서영")
member_join("황선형","김철영","이창연")
member_join("정수진","김보람","정수연","함소영")

#7-4
def multiply(num,x):
  i=0
  while i< len(num) :
    num[i] = num[i] * x
    i=i+1
numbers = [10,20,30,40,50]

multiply(numbers,10)
print(numbers)

multiply(numbers,10)
print(numbers)
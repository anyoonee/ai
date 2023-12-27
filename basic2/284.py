
r = 0 # 전역변수
def printSum(sList) :
  # r = 0 지역변수
  global r # 지역변수 r 이라는 뜻
  r=0
  for s in sList :
    r+=s
  return r

sList = [1,3,5,6,2]
print(printSum(sList))
print(r)

# 288
#7-1
def func():
  x=200
  print(x)
func()


#7-2
def func():
  x=200
  print(x)

x=100
func()
print(x)

#7-3
def func():
  global x
  x=200
  print(x)

x=100
func()
print(x)

# 7-4

def km_to_mile(x):
  result = x * 0.621371
  return result

km=int(input("킬로미터를 입력하세요:"))
mile =km_to_mile(km)

print(f"{km} 킬로미터는 {mile} 마일이다.")

# 7-5
def plus(x,y):
  return x+y
  

def subtract(x,y):
  return x-y
 

def multiply(x,y):
  return x*y
  

def divide(x,y):
  return  x/y

print("-선택옵션")
print("1. 더하기")
print("2. 빼기")
print("3. 곱하기")
print("4. 나누기")

choice = input("원하는 연산을 선택하세요(1/2/3/4) :")

num1=int(input("첫 번째 숫자를 입력하세요: "))
num2=int(input("두 번째 숫자를 입력하세요: "))
print()

if choice == "1" :
  print(num1 ,"+",num2, "=", plus(num1,num2))

elif choice == "2":
  print(num1,"-",num2,"=",subtract(num1,num2))

elif choice == "3":
  print(num1,"*",num2,"=",multiply(num1,num2))

elif choice == "4":
  print(num1,"/",num2,"=",divide(num1,num2))

else :
  print("다시입력하세요!")

# 7-6
def count_char (string,x):
  count=0

  for i in string:
    if i==x:
      count=count+1
  
  return count
  

t=input("영어 문장을 입력하세요:")
c=input("알파벳하나를 입력하세요:")

num_char=count_char(t,c)

print(f"{t}에 포함된{c}의 개수는{num_char}개이다." )

# 7-7
def sum_tuple(numbers):
  total =0
  for number in numbers:
    total = total + number
  return total
tup1 = (10,20,30,40,50)
total = sum_tuple(tup1)
print("튜플의 합계 : ",total)

#7-8
def reverseFun(strVar):
    for i in range(len(strVar)-1,-1,-1):
      print(strVar[i],end="")

strVar = input("문자열을 입력하세요.")
reverseFun(strVar)
print()

#7-9
def blackToHypenFun(s1):
  global s
  s = s1.replace("","-")
s=input("문자열을 입력하세요.")
blackToHypenFun(s)
print(s)

# 심화문제 7-1

n=int(input("n값을 입력해주세요:"))

def decimalFun(n1) :
    de=[]
    for i in range(2,n1,1):
      
          de.append(i)
          break


decimalFun(n)

# 심화문제 7-2
eng_dict={"house":"집","piano":"피아노","christmas":"크리스마스","friends":"친구","bread":"빵"}
def engQuiz(eng_dict):
  for i in eng_dict : #키값들이 i변수에 담김
    answer = input(f"{eng_dict[i]}에 맞는 영어단어는?")
    if answer == i :
      print("참잘했어요!")
    else:
      print("틀렸어요!")

engQuiz(eng_dict)
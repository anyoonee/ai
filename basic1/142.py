






# start = int (input ("시작수?"))
# start = int (input("마지막수?"))
# increase = int(input("증가수?"))
# for x in range(start, stop, increase) :
#     print(x)

#1~100합

sum =0
for x in range (1,101,1):
    sum = sum +x


#146
for x in range(10): #0~9
    print(x)
for x in range(1,11): #1~10
    print(x)
for x in range(1,10,2): #1 3 5 7 9
    print(x)
for x in range(20,0,-2): # 20 18 16 ...2
    print(x)


#2024년도 1월 1일부터 2024년 1월 31일까지 출력
year =2024
month =1
day=1
for day in range(1,32) :
    print(year, month, day, sep="/")

# 1~100 합계 구하는데 3000넘어가면 멈추고 합계 출력
sum =0
for x in range(1,101) :
    sum += x
    if sum >= 3000:
        break
print(sum,x)

# 100~1000까지 5씩 증가해서 합계 5000이상 되면 멈추고 합계
sum =0
for x in range(100,10001,5) :
    sum +=x
    if sum>=5000:
        break
print(sum,x)       

# 문자열 for 문
for x in "abcdefg" :
    print(x)

#t 몇개?
count =0
count1=0
for x in "this is python" :
    print(x)
    if x == 't' :
        count += 1
        
    print(f"t의 갯수는 {count}개 입니다.")


#공백이 몇개?
    count1=0
for x in "this is python" :
    print(x)
    if x ==' ' :
        count1+=1
    print(f"공백은 {count1}개 입니다.")

# 이중 for문 - 구구단 출력
for i in range(1,10) :
    for j in range(2,10) :
        print( "%2dx%2d=%2d" %(j,i,j*i), end= " ")
    print()
 

for a in range(2,10):
    for b in range(1,10):
      print("%2dx%2d=%2d"%(a,b,a*b), end=" ")
    print()

"""
for i in range(1,10) : 
    for j in range(1,i+1) :
        print("*", end=" ")
    print()
"""

for i in range(1,11):
    print("*"*i,end="")
    print()



#157쪽
for i in range(10):
    print("*"*(10-i), end="")
    print()


for i in range(1,6) :
    for j in range(1,6-i):
        print(" ", end=" ")
        for k in range(1,2*i):
            print("*" , end="")
        print()

#154 4-1
count =0

for i in range(200,801) :
  if(i % 5 != 0):
    print("%d"%i,end=" ")
  count =count +1
  if(count%10 ==0) :
   print()

#4-2
print("-" * 40)
print("    cm       mm       m      inch      ")
print("-" * 40)

for cm in range(1,101):
    mm = cm * 10.0
    m = cm *0.01
    inch = cm * 0.3937
    print (("    %7d       %7.0f       %7.2f      %7.1f      ")%(cm,mm,m,inch))

print("-"*40)

#4-5
number = input ("숫자를 입력하세요 : ")
total = 0

for a in number :
  a = int(a)
  if a%2 !=0:
    total += 1

print("홀수의 갯수 : %d개"%total)




#4-6
print("-"*50)
print("%7s %7s %7s" % ("킬로그램","파운드","온스"))
print("-"*50)

for kg in range(100,201,2):
  pound = kg * 2.204623
  ounce = kg * 35.273962
  print("%8d %8.1f %8.1f" % (kg,pound,ounce))

print("-"*50)

#4-7
for i in range(1,6):
    for j in range(1,11):
      print("*", end=" ")
    print()

#4-8
for i in range(9,0,-1) :
  for j in range(0,i,1):
     print(i,end=" ")
  print()


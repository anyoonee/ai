#변수연습
name="홍길동"
_name="다른변수"
print(_name)
print(type(_name)) #type함수는 자료형을 보여준다.
number=10
print(type(number))
# 사칙연산
str1="abc"
str2="def"
print(str1+str2)
#print(str1-str2)
print(str1*3)

str3 = str1 + str2
print(str3)

number=1; number2=2; number3=3
number4= number+number2
number5= number2*number3
number6=number2**number3
number7=number3/number2
print(number,number2,number3,sep="--")
print(number4,number5,number6,number7,sep="==")

ok = True
ok1 = False
ok2 = ok1+ok  #or연산
ok3=ok1-ok2 # ??
ok4=ok1*ok2 #and 연산
print(ok3)

s="안녕하세요.반갑습니다."
print(s[3:5]) 
print(s[:6])
print(s[7:])
print(s[:])

a="100"
b="200"
c=(int)(a)+(int)(b) #숫자로 출력
c=a+b # 문자로 출력
print(type(c))
print (c)


#문자열 반복 연산자
x="토끼"*10
print(x)


#64~66쪽 문제
# 문자열 포맷팅
# %s = sting %d = 정수 
animal = "고양이"
age = 25
score = 12.52
x = "나는 %s를 좋아하는 %d 살 포인트점수 %.1f 입니다"  %(animal,age,score)
print(x)

y="a"
x="%c"%y # %c 한글자
print(x)

y=8
x="%o"%y #%o 8진수 
print(x)

y=15
x="%x"%y #%x 16진수
print(x)

# 키보드 입력
#input()
'''
name=input("이름을 입력하세요")
print("%s 입니다."%name)
'''
score = input("점수는")
# score = (int) (input("점수는"))
print(type(score))
print("%d 점입니다."% (int)(score))

# 실수 반지름 12.5789를 입력받아 원넓이

radius = (float)(input("반지름은?"))
area = radius * radius * 3.14
print("원넓이는 %f 입니다."%area)
# print("원넓이는 %.3f 입니다."%area) 소수점 셋째자리까지

#74
name = "홍지영"
a=10
b=20
print(name,a,b,a-b,100,sep=" ")

#76 null? 값이 없는것 ""

print("문자열에는 문자 앞 두에 쌍따옴표(\")를 \n 붙인다.")

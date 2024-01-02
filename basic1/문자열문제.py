#1. 문자열 인덱싱
letters="java programming"
print(letters[5],letters[1],letters[8])

#2. 문자열 슬라이싱
번호="43다6521"
print(번호[3:8])

#3. 문자열 인덱싱
string = "홀짝홀짝홀짝홀짝"
print(string[1:8:2])

#4. 문자열 슬라이딩
string = "PYTHON"
print(string[5],string[4],string[3],string[2],string[1],string[0])
print(string[::-1])
#string[시작인덱스 생략하면 0 : 종료 인덱스 생략하면 마지막 : 증가인덱스]

#
string ="abcdef"
# a-->A
print(string.replace('a','A'))
print(string)

string = string.replace('a','A')
print(string)

# 5. 문자열 치환
phone_number="010-888-9999"
phone_number = phone_number.replace("-","")
phone_number = phone_number.replace("-"," ")
print(phone_number)

# 7. 문자열 다루기
url = "http://gmail.com"
url = url.split(".")
print(url[1])

# 12.문자열 합치기
a="123"
b="456"
print(a+b)
print(a,b,sep="")

# 13. 문자열 곱하기
print("Hi!"*5)

# 14. "+"기호를 150번 나오게 하기
print("+"*150)

# 15. 문자열 더하기와 곱하기 이용하여 아래와 같이 출력하기
s1 = "python"
s2 = "c++"
s3 = "java"
print(("s1+s2+s3")*5)

# 16. 문자열 포매팅으로 출력하기
name1 = "홍길동"
age1 = 25
eyesight1 = 1.2
name2 = "이순신"
age2= 13
eyesight2 = 0.8

print("이름: %s 나이 : %d 시력 : %0.1f"%(name1,age1,eyesight1))
print("이름: %s 나이 : %d 시력 : %0.1f"%(name2,age2,eyesight2))

# 17. 문자열 출력하기(format)
print("이름 : {} 나이 : {} 시력 : {} ".format(name1,age1,eyesight1))
print("이름 : {} 나이 : {} 시력 : {} ".format(name2,age2,eyesight2))

# 18. 문자열 출력하기(최신버전)
print(f"이름 : {name1} 나이 : {age1} 시력 : {eyesight1}")
print(f"이름 : {name2} 나이 : {age2} 시력 : {eyesight2}")

# 19. 컴마를 제거하기
총금액 = "5,896,124,650"
총금액 = 총금액.replace(",","")
print(type(총금액))
총금액 = int(총금액)
print(총금액 +100)

# 20. 문자열 슬라이싱
날짜 = "2024/01(E) 1사분기"
날짜 = 날짜[0:7]
print(f"{날짜}")

# 21. 문자열의 좌우의 공백을 제거
data = "      공백제거하기   "
data = data.strip()
print("f{data}")

# 22.
lowerWord = "python is very good"



# .92
#1
a=10
b=20
print("두 수의 합 : %d" %(a+b))
#2

print(a,"+",b,"=",a+b)

print("%d+%d=%d"%(a,b,a+b))
#3
print("%d+%d=%d"%(a,b,a+b))

#4~6
a=input("첫 번째 과일을 입력하세요 : ")
b=input("두 번째 과일을 입력하세요 : ")
print(f"{a}와(과){b}은(는) 내가 좋아하는 과일이다.")

#7
a=input("첫 번째 숫자를 입력하세요. : ")
b=input("두 번째 숫자를 입력하세요. : ")
print(f"{a}/{b}={a/b}")

# 95
#2-1
kg=input("변환할 킬로그램(kg)은?")
print("-"*30)
print("킬로그램    파운드      온스")
print("-"*30)
#print(f"{kg}    {pound}     {ounce}")
print("%d       %.2f      %.2f"% (int(kg), pound, ounce ))
print("-"*30)

#2-2
phone = input("전화번호는?")
#방법1) "-"찾아서 ""바꾸기
delet = phone.replace("-","")
print(f"입력된 휴대번호 : {phone}")
print(f"하이픈 삭제된 휴대번호 : {delet}")

#방법2) split("-")
 

 #2-13
number="37366366845"
print(number[-2::])

#2-12
string="가는 말이 고와야 오는 말이 곱다"
print(string[7:14])
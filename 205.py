# 특정 문자열 찾기, 문자열 치환, 문자열 쪼개기
string1="Python is fun!"
print(string1)
a = string1.find("k")
print(a)

StudentName="홍길동 이순신 이경미"
#최수진 있나요?

if StudentName.find("최수진") == -1 :
  print("우리반 아닙니다.")
else : 
  print("우리반 입니다.")
"""
data = data.replace("/"," ")
print(data)
data = data.replace(" ", "-")
print(data)
"""

# 데이터 쪼개기
hello = "have a nice day; Happy new Year; Merry Christmas"
list1 = hello.split(";")
print(list1)
list1 = hello.split(";",1)
print(list1)

names = ["황애린","홍지수","안지영"]
print(names)

x="/".join(names)
print(x)

phoneNumber=["010","1234","3234"]
xx = "-".join(phoneNumber)
print(xx)
print(type(xx))

#209
phone_list1=["010-3654-2637", "010-3984-5377", "010-3554-0973"]
print(phone_list1)

phone_list2 =[]
for number in phone_list1:
  x=number.replace("-","")

  phone_list2.append(x)
print(phone_list2)

#210
sentences =["Love me, love my dog.","No news is good news.", "Blood is thicker than water."]

for sentences in sentences:
  x=sentences.replace("","_")
  print(x)

#218
questions=["s_hool","compu_er","deco_ation","windo_","hi_tory"]
answers=["c","t","r","w","s"]

for i in range(len(questions)):
  q = "%s : 밑 줄에 들어갈 알파벳은?"% questions[i]
  guess=input(q)

  if guess==answers[i]:
    print("정답!")
  else :
    print("틀렸어요!")

#219
scores=[]

while True:
  x=int(input("성적을 입력하세요(종료시 -1 입력) :"))

  if x == -1:
    break
  else :
    scores.append(x)

sum=0
for score in scores :
  sum+=score
avg=sum/len(scores)
print("합계:%d, 평균:%2.f"%(sum,avg)) 



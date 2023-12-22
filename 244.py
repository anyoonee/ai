# 244
scores={"김채린":85,"박수정":98,"함소희":94,"안예린":90,"연수진":93}

sum = 0

for key in scores:
  sum=sum+scores[key]
  print("%s:%d"%(key,scores[key]))

avg=sum/len(scores)

print("합계:%d, 평균:%.2f"%(sum,avg))

#245
admin_info={"id":"admin","password":"12345"}

input_id=input("아이디를 입력하세요:")
input_pass=input("비밀번호를 입력하세요:")

if input_id==admin_info["id"]and input_pass==admin_info["password"]:
  print("정보에 접근 권한이 있습니다.")
else :
  print("정보에 접근 권한이 없습니다.")

#6-4
words={"꽃":"flower","나비":"butterfly","학교":"school","자동차":"car","비행기":"airplane"}

print("<영어 단어 맞추기 퀴즈>")

for kor in words:
  input_word = input("'%s'에 해당하는 영어 단어를 입력해주세요: "%kor)
  if input_word==words[kor]:
    print("정답입니다!")
  else :
    print("틀렸습니다!")
    
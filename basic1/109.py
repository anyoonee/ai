ans1 = input("'사자'의 영어단어는 무엇일까요? :")
result = "땡! 틀렸습니다."
if ans1 == "lion" :
  result = "딩동댕! 참 잘했어요~~~~"
print(result)

ans2 = input("'오렌지'의 영어 단어는 무엇일까요? :")
result = "땡! 틀렸습니다."
if ans2 == "orange" :
  result= "딩동댕! 참 잘했어요~~~~"
print(result)

ans3 = input("'기차'의 영어 단어는 무엇일까요? :")
result = "땡! 틀렸습니다."
if ans2 == "train" :
  result= "딩동댕! 참 잘했어요~~~~"
print(result)


yn = "y"
while yn=="y" :
  q1 = input("질문단어는(한국어)?")
  a1 = input("답변단어(영어)?")

  if q1 == '사자' and a1 == 'lion' :
    result = "딩동댕! 참 잘했어요~~~~"
  elif q1 == '오렌지' and a1 == 'orange' :
    reselt = "딩동댕! 참 잘했어요~~~~"
  elif q1 == '기차' and a1 == 'train' :
    reselt = "딩동댕! 참 잘했어요~~~~"
  else :
    reselt = "땡! 틀렸습니다."
    print(reselt)

    yn=input("계속공부할래요?(y/n)")


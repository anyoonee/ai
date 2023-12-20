# 182리스트
# 여러 자료들의 목록형태로 관리하는 자료구조
# 특징: 순서가 있다. 수정가능. 요소의 종류 무상관
list1=[1,1.1,"문자",[1,9]]
print(list1[0])
print(list1[1:5:3])

#
list1=[3,15,-12.5,"사과","딸기"]
print(list1)
print(type(list1))#type() 자료형 보기

list2=list(range(1,21,2))
print(list2)
print(type(list2))

list3=list("abcdef")
print(list3)
print(type(list3))

color = ["빨강", "주황", "노랑", "초록", "파랑", "남색", "보라"]
print(color[0])
print(color[2:6])
print(color)
print(color[1],color[4],color[6])


#반복문과 리스트
for i in color :
  print(i, end=" ")
  print("나는%s를 좋아합니다."%i)
print(len(color)) #len(리스트)리스트 요소의 갯수

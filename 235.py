

print(color_list)




plus = color_list | p #합집합
print(plus)
plus = color_list -p #차집합
print(plus)

a={1,2,3}
#3을 바꾸기
a.update({1,2,4})
print(a)
a.remove(3)
print(a)

#삽입하기, 추가하기
b={10,11}
b.add(20)
print(b)

#수정하기
b.update({5})
print(b)
b.remove(10)
print(b)


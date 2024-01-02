# 튜플 - 수정이안됨. 용도-변동 불가
t=(1,2)
t1=1,2
print(t[0])
print(t1[1])
print(type(t))
t2=1,
print(type(t2))
# () 생략할수 있다, 1개요소(1,)
t3 = () # 빈튜플
print(type(t3))
animals=("토끼","거북이","사자","여우")
print(animals[-1:]) # list의 슬라이스와 동일
# 토끼를 돼지 바꾸기
# animals[0] = "돼지" 안됨
ani_list = list(animals)
print(type(ani_list))
ani_list[0] = "돼지"
print(ani_list)
animals = tuple(ani_list)
print(animals)


#튜플만들기
# 변수 = () , 변수 =  
n = tuple(range(10,21))
print(n)
n2 = tuple([1,2,3])
print(n2)

print(n[2:])
print(n[::-1])
print(len(n2))

tup1=(10,20,30)
tup2=(40,50,60)
tup3=tup1+tup2
print(tup1)
print(tup2)
print(tup3)
#print(tup1 * tup2) tup1의합?
print(tup1[0] + tup1[1] + tup1[2])
sm = sum(tup1)
print(sm)


t1=('valentain',2,14,'gift')
print(t1[1:2])
t2=('love')
print(t2[0])
t2[0:]

print(t2*2)
print(len(t1))

a_1=["홍길동","이수지","박상민"]
a_1[1]="하누리"
print(a_1)

a_1=["홍길동","이수지","박상민"]
a_1[1]="하누리"
print(a_1)

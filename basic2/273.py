def inch_to_cm(inch):
    cm = inch * 2.54
    return cm
num = 23
result = inch_to_cm(num)
print("%d inch => %.2f cm"%(num,result))

# 275 7-5
def tri_area(w,h):
    result = w * h * 0.5
    return result

width = 10
height = 15
print("삼각형의 너비 : ", width)
print("삼각형의 높이 : ", height)
print("삼각형의 넓이 : ", tri_area(width,height))

# 7-6
def sum_besu(n):
    sum=0
    for i in range(1,101):
        if i%n ==0 :
            sum = sum+i
    return sum
besu=3
total= sum_besu(besu)
print("1~100사이 %d의 배수의 합계 : %d" %(besu,total))

#7-7
def count_space(a):
    count = 0
    for x in a:
        if x ==" ":
            count = count+1
    return count
sentence ="Python is easy and powerful."

print(sentence)
num_space=count_space(sentence)
print("_공백의 개수 :",num_space)

#7-8
def get_item(userid):
    game_items={"kim":"총","lee":"대포","choi":"전투기","hwang":"병사"}

    for key in game_items:
        if key == userid:
            item = game_items[key]
    return item
user1="kim"
user2="hwang"

print("%s의 게임 아이템: %s"%(user1,get_item(user1)))
print("%s의 게임 아이템: %s"%(user2,get_item(user2)))
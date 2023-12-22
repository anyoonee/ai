#딕셔너리 생성
inventory={ "메로나":[300,20],
            "비비빅":[400,3],
            "죠스바":[250,100]}


for i in inventory :
  t = inventory[i][0] * inventory[i][1]
  print(f"{i} {inventory[i][0]}원 {inventory[i][1]}개 {t}원")



#메로나가격?
print(inventory["메로나"][0],"원",sep="")
#죠스바재고?
print(inventory["죠스바"][1],"개",sep="")
#월드콘 추가
inventory["월드콘"]=[1500,50]
print(inventory)
#조스바가격오름
inventory["죠스바"] = [350,100]
print(inventory)
#아이스크림품목수는?
print(len(inventory),"종류")
for key in inventory:
  print(key,end=" ")

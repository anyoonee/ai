#딕셔너리 key-value
score = {"kor":90, "eng":89, "math":95}
print(score["math"])
user={"id":"kim55","name":"강성준","level":"7","point":10000}
"""
print(user["id"])
print(user["level"])
"""
#전체 출력하기
for uKey in user :
  print(f"{uKey} - {user[uKey]}")

#추가하기
score["music"] = 100
print(score)
user["vip"] = "우수회원"
#수정하기
score["music"]=80
print(score)
user["vip"] = "최우수회원"
print(user)
#삭제하기
x=score.pop("music")
print(x)
print(score)
user.pop("music")
print(x)
print(score)
user.pop("vip")
print(user)

#반복문 써서 딕셔너리 처리
area_code = { 02:"서울", 051:"부산", 053:"대구", 062:"광주"}
for k in area_code: #key값이 자동ㅇ로 한개씩 k로 들어간다
  print(f"{k} - {area_code[k]}")

keys=[]


sk=[]
for k in area_code:
  sk += k
print(sk)

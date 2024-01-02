#딕셔너리를 json의 모습 string으로 만들기
"""
import json

member = {
          "id":"swhong",
          "name" : "홍성우",
          "age" : 23,
          "history" : [
            {"data": "2021-03-15","route": "moblie"},
            {"data": "2020-06-23","route": "pc"}]
}

string = json.dumps()

print(stirng)
print(type(string))
"""
# *** 
#이 json파일을 다른곳에서 이용하면된다.
import json

member = {
          "id":"kim",
          "name" : "김유신",
          "age" : 25,
          "history" : [
            {"data": "2021-03-15","route": "moblie"},
            {"data": "2020-06-23","route": "pc"}]
}

with open("./basic4/member.json","a",encoding="utf-8") as f:
  json.dump(member,f,ensure_ascii=False, indent=8)
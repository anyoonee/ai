"""
f = open("new_file.txt" , "w",encoding="utf-8")

names = ["이순신", "김지영"]

for name in names :
  f.write(name + "\n")

print("파일 쓰기 완료")
f.close()
"""

f = open("new_file.txt" , "r",encoding="utf-8")

# license = f.readlines() 여러줄을 한꺼번에 읽어옴
# line=f.readline() 한줄만 읽어옴 반복문 필요

while True :
  line = f.readline()
  if not line : break
  print(line)
f.close()

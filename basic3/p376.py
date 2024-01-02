#csv 파일 처리
import csv
"""
file_name = "./basic3/weater.csv"
f = open(file_name,"r")
lines = csv.reader(f)
print(lines)
for line in lines :
  print(line)
f.close()
"""

read_file_name = "./basic3/weater.csv"
write_file_name = "./basic3/weater_온도.csv"
rf = open(read_file_name,"r")
wf = open(write_file_name,"w")

lines = csv.reader(rf)
wr = csv.writer(wf)
#print(next(lines)) # 첫째줄
#print(next(lines))
next(lines)  # 열이름(제목명)을 구해 제거
for line in lines:
  if line[1] != "2023-12-27" :
    result = line[2]
    wr.writerrow(result)
rf.close()
wf.close()
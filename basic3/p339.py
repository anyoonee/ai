import time 

seconds = time.time()
print(seconds)

tm = time.gmtime()
print(tm) # 그리니치 표준시 우리나라 GMT+9 9시간 후의 시간

# loacltime함수 - 윈도우 운영체제의 셋팅한 나라 시간 타임스탬프로 현재시간을 나타냄
time.localtime(seconds)
print(tm)


string = time.ctime()
print(string)

tm = time.localtime(time.time())
sf = time.strftime("%Y년%m월%d일%A%I시%p%M분%S초")
print(sf)

print("시작")
time.sleep(10)
print("끝")

def func():
  sum =0
  for i in range(1,10001):
    sum+=i
  print(sum)

start = time.time()
func()
end = time.time()
func()



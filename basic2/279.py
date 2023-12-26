#지역변수
#전역변수
#변수의 생명주기 life cycle
def func():
  x=10  #지역변수
  print(x)

func()

gx = 200
def func2():
  # gx = gx + 300 오류남. 수정x
  print(gx)

func2() 
gx = gx + 300 # 오류x
print(gx)

def func3():
  global y  #함수안에 선언할 변수를 전역변수로 만들고 싶을때 선언
  # 스택공간에 변수를 할당
  # 계속 살아있는 변수로 메모리 비효율적 ex) 장바구니, 로그인유지
  y = 300
  y = y - 10
  print(y)

func3()
print(y)
y = y + 20
print(y)

def func4():
  print(y,"~~~")

func4()

#283
def func5():
  global x
  x=200
  print(x,"~")

x=100
print(x,"~~")
func5()
print(x, "~~~")

#284
def cir_area():
  global r
  result = r * r * 3.14
  return result
def cir_length():
  global r
  result = 2 * 3.14 * r
  return result
r=10 #전역변수
area = cir_area()
length = cir_length()
print("원의 면적:%.1f, 원주의 길이 : %.1f"%(area, length))


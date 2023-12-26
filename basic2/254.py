#함수 = 역할을 담당, 호출해서 사용
def hello(): # 생성
  print("안녕?!")
def goodMorning():
  print("Good morning")

hello() #호출
goodMorning()

#함수의 종류 p.257
#내장함수 - 미리 만들어둔것
#사용자정의함수 - 사용자가 만들어 주는 함수
def hi(name):
  print(f"안녕! {name}야!")

hi("현희") #매개변수에 들어갈 값 : 실인수 Arguments
hi("민수")

def myself(name,hight):
  print(f"나는 {name}이고 키는 {hight}cm 야")

myself("현희",160)
myself("민수",150)

#p.263 여러개 매개변수인 경우 (가변인 경우)
def average(*args):
  print(type(args))
  print(args)
  num_args=len(args) #실인수의 갯수가 나온다
  sum =0
  for i in range(num_args):
    sum = sum + args[i]
  avg = sum / num_args
  print(f"평균은{avg}")

average(85,96,87)
average(85,96,87,97,72)

def printAll(*str1):
  s=" " #공백
  for i in str1:
    s = s + i
  print(s)  

printAll("a", "b") # 출력은 ab
printAll("a", "b","c")
printAll("a", "b","c","d")
# p.265
def func(food): # fruits리스트의 힙메모리의 주소가 전달
  food.append("귤")
  print(food)

fruits = ["사과","오렌지","바나나","사과"] #리스트 - 수정, 중복 가능
func(fruits)

#튜플 - 리스트와 동일하나 수정X, 변경하면 안되는것 저장
def tD(tDP):
  #tDP.append("코스코")
  print(tDP)

tupleData = ("삼성", "LG","세스코")
tD(tupleData)

#딕셔너리 - map(자바)랑 같다.
def dicF(dicData):
  dicData[4]='d'
  print(dicData[1])

dictData = { 1: "a", 2:"b",3:"c"}


def returnSum(n1,n2,n3):
  s = n1+n2+n3
  return s

ss = returnSum(10,20,30)
print(ss)

#반지름 10을 이용해 원의 넓이 구하는 함수
def returnArea(r):
    return r * r *3.14

circleArea=returnArea(10)
print(circleArea)
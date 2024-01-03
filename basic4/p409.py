# 속성 : 자바에서 필드, 변수
# class A {
#   int k=10; #인스턴스 필드 - 파이썬에서는 인스턴스 속성 (자료쓰고변수버리기)
#   static int sk = 10; #정적 필드 - 파이썬에서 클래스 속성 (자료계속유지)
# }

class Student :
  pet = [] # 클래스 속성 , 값을 계속 유지
  def push_pet(self,x) :
    self.pet.append(x)

john = Student() # 객체화
john.push_pet("고양이")
sally = Student()
sally.push_pet("강아지")
print(sally.pet)

"""
class Student :
  def __init__(self):
   pet = [] # 클래스 속성 , 객체화때마다 초기화
  def push_pet(self,x) :
    self.pet.append(x)

john = Student() # 객체화
john.push_pet("고양이")
sally = Student()
sally.push_pet("강아지")
print(sally.pet)
"""
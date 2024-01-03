# 생성자
# 자바식 코드
# class P {
#       void P(){
#        생성자 용도 : 객체 생성하면서 초기화할때
#   }
#}
class Members :
    def __init__(self,name,age,gender) : # 생성자 __init__
        self.name = name
        self.age = age
        self.gender = gender
        
    def show_info(self) :
        print("이름 : " , self.name)
        print("나이 : " , self.age)
        print("성별 :", self.gender)

#객체 생성
m1 = Members("홍길동",25)
m1.show_info()
m2 = Members("홍길동",25,True)
m2.show_info()
#m3 = Members("홍길동",25,True,"a")
#m3.show_info()
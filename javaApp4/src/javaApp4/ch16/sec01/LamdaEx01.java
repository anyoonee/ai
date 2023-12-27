package javaApp4.ch16.sec01;

public class LamdaEx01 {

	public static void main(String[] args) {
		// 익명 구현 클래스		
		A a = new A() {
			@Override
			public int aM(int a, double b) {
				// TODO Auto-generated method stub
				return (int)(a + b);
			}
		};
		System.out.println(a.aM(10,1.8));
		
		// 람다식
		//A a1 = (int c, double d) -> { return (int)(c+d);};
		//A a1 = ( c,  d) -> { return (int)(c+d);}; 매개변수의 자료형 생략 가능
		A a1 = (c, d) -> (int)(c+d); // {} 안에 문장이 1개이니 생략, return 생략 가능
		System.out.println(a1.aM(20, 3.8));
		
		B b1 = (x,y,z) ->{
			System.out.println("이름은" + x);
			System.out.println("키는" + y);
			if(z) System.out.println("남");
			else System.out.println("여");
		};
		
		b1.bM("홍길동", 170, true);
		b1.bM("이수연", 165, false);
	}

}


// @~~ 어노테이션 바로 아래에 있는 객체를 성격제한할때 사용
// @FunctionalInterface 인터페이스 안에 추상 메소드가 1개만 있다 라는 성격
@FunctionalInterface
interface A {
	int aM(int a, double b);
}

interface B {
	void bM(String x, Integer y, Boolean z);
}

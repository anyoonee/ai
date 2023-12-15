package javaBasic5.ch08.sec03;

public class 확인문제8장 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// A a = new A(); 인터페이스는 객체화 할 수 없다.
		// 해당 인터페이스 사용을 위해 하단 클래스 구현 및 아래와 같이 사용 가능하다.
		AImpl a = new AImpl();
		Driver d = new Driver();
		d.a = new AImpl();
		d.dirve(a);
		A a1 = new AImpl();
		B  b = new BB(); //자동형 변환
		BB bb22= (BB) b; //강제형 변환
		b.aM();
		//b.bM(); 사용못함
		
		BB bb=(BB) b;//강제형변환
		
	 
		
		
	}

}

interface A{
	//상수
	static final int a=10;
	abstract void aM(); //추상메소드
	default void dM(); //default 메소드 오버라이드 가능.
	static void sM(); //정적메소드
	
}

class Driver{
	A a;
	void dirve(A a) {
		a.aM();
	}
}

class B{
	int a =10;
	void aM() {
		
	}
}

class BB extends B{
	int b =20;
	void bM() {
		System.out.println(b);
	}
	
}

class AImpl implements A{//구현클래스

	@Override
	public void aM() {
		System.out.println(a);
	}
	
	@Override
	public void dM() {
		System.out.println(b);
	}
	
}
package javaBasic6.ch09.sec05;

public class Any2Ex {

	public static void main(String[] args) {
		CImpl ci = new CImpl();
		ci.cM();
		
		C ci2 = new CImpl();//다형성
		ci2.cM();
		
		//익명구현객체
		C ci3 = new C() {
			@Override
			public void cM() {
				System.out.println("익명구현클래스의 메소드");
				
			}
		};  //인터페이스는 new 할 수 없다. new 객체() {내용 @Override}; - 익명객체 구조		
		ci3.cM();

	}

}

interface C{
	abstract void cM(); //추상메소드
}

class CImpl implements C{
	@Override
	public void cM() {
		System.out.println(" 구현클래스 (자식) 메소드");
		
	}
}
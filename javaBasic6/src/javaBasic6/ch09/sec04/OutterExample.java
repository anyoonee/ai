package javaBasic6.ch09.sec04;

public class OutterExample {

	public static void main(String[] args) {
		// 밖의 클래스를 먼저 객체화 
		Outter o = new Outter();
		
		//iaM() 호출하려면 1. 내부객체화 2. 메소드 호출
		Outter.Inner i = o.new Inner();
		i.iaM();
	}

}


class Outter{
	
	int a=10;
	void aM() {}
	static int sa=20;
	static void saM() {
		
		
	}
	
	class Inner{
		
		int ia = 100;
		void iaM() {
			//내부클래스는 외부클래스의 모든 멤버를 쓸 수 있다.
			ia =ia +20;
			aM();
			Outter.sa = Outter.sa + 100;
			Outter.saM();
		};
	//static int sia=10;
	//static void siaM() {};
		
		
	}
}
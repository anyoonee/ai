package javaBasic6.ch09.sec01;

public class AExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

class A{
	
	int a = 10;
	void aM() {
		System.out.println(a);
		// b = b+ 100; 내부클래스의 변수 사용할수 없다.
		// bM(); 내부클래스의 메소드를 사용할수 없다.
		
	}
	
	static int sa = 200; //정적멤버 번역할때 미리 스택메모리에 올림
	static void saM() {
		System.out.println(sa);
		//System.out.println(b); //new 하고 써야한다.
		//System.out.println(a); //static 붙어있는 메소드느 미리 올라가기 때문에 new 해서 쓰는 것은 못씀.
	}
	
	class B{
		// a = a+100; 메소드 안에 더해라 하고 명령해야하는데 클래스에다 명령해서 안됨
		// aM(); 메소드안에 메소드호출이라고 명령해야하는데 클래스에다 명령해서 안됨
		int b=20;
		void bM() {
			a=a+100; //내부클래스에서 외부클래스 필드를 사용할 수 있다.
			aM();	// 내부클래스에서 외부클래스의 메소드를 호출할 수 있다.		
			System.out.println(b);
		}
		class C{
			
		}
		
	}
}
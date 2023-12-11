package javaBasic3.ch06.sec10.exam03;

public class ClassName250 {

	//상수 const 
	static final int A =10;
	static final double PI = 3.141592;
	static final double RATE = 0.025;
	
	//변수 = 변하는 수
	static int a = 10;
	
	//인스턴스 멤버들
	int field;
	static void method() {
		a = a+10;
		System.out.println(A + 20);
		// A=1000; 에러 상수이기때문에 못바꿈
		};
	
	//정적 멤버들(클래스 멤버들)
	static int field2;
	static void method2() {};
	
	static {
		//field = 10; 오류 메모리에 올라가는 시점이 달라 사용불가.
		//method(); 오류
		field2 =20;
		method();
	}
	
	static void method3() {
		//field = 10; 오류
		// method(); 오류
		field2 =20;
		method();
	}
	
	{
	  field = 10; 
	  method(); 
	  field2 =20;
	  method();
	}
	
	void method4() {
		 field = 10; 
		  method(); 
		  field2 =20;
		  method();
	}
}

package javaBasic3.ch06.sec10.exam01;

//p.247
public class Calculator {

	//빌드단계 (클래스 로더단계)에서 자동으로 스택영역에 올라가서 계속 있는다.
	static double pi = 3.14159;
	
	static int plus(int x, int y) {
		return x + y;
	}
	
	static int multiply(int x, int y) {
		return x * y;
	}
	
	static int minus(int x, int y) {
		return x - y;
		
	}
	
	static int divide (int x, int y) {
		return x / y;
		
	}
	
}

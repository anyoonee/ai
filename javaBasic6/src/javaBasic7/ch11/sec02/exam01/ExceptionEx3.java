package javaBasic7.ch11.sec02.exam01;

public class ExceptionEx3 {

	public static void main(String[] args) throws ArithmeticException {
		
		B b = new B();
		b.b1();

	}

}

class B{
	void b1() throws ArithmeticException{
		b2();
	}
	void b2() throws ArithmeticException{
		
		int a=10;
		a =a/0;
		
	}
}

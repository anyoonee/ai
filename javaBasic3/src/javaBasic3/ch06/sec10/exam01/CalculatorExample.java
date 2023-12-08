package javaBasic3.ch06.sec10.exam01;


//247
public class CalculatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        double result1 = 10 * 10 * Calculator.pi;
        int result2 = Calculator.plus(10, 5); //메소드 호출
		int result3 = Calculator.minus(10,  5);
		int result4= Calculator.multiply(10, 5);
		int result5=Calculator.divide(10, 5);
		
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		System.out.println("곱하기 : " + result4);
		System.out.println("나누기 : " + result5);
	}

}

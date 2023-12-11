package javaBasic3.ch06.sec11;

public class CalculatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Calculator calculator = new Calculator(); // 1단계. 객체화(힙메모리에올림)
		
		calculator.poweron(); //메소드 호출
		calculator.poweroff();
		
		calculator.poweron();
		int result = calculator.plus(300, 500);
		System.out.println(result);
		
		// 문제 -50 ,-100 더하기
		result = calculator.plus(-50, -100);
		System.out.println(result);
		
		//문제 100,200,300 더하기
		result = calculator.plus(100, 200);
		result = calculator.plus(result, 300);
		System.out.println(result);
		
		// 메소드의 배개변수 3개
		result = calculator.plus(100, 200, 300);
		
		
	}

}

package javaBasic3.ch06.sec11;

public class Calculator {
	//메소드 동작 ~한다, ~하기 웃기, 잠자기, 놀기, 계산하기
	//형식 [접근제한자] 리턴타입 메소드명 ([매개변수...]) {}
	//형식에서 [] 생략가능 ... 여러개
	
	void poweron() {
		System.out.println("전원을 켭니다.");
	}
	
	void poweroff() {
		System.out.println("전원을 끕니다.");
	}
	
	int plus(int x, int y) {
		int result = x + y;
		return result; // return은 메소드를 호출한 곳을 변수 result 값을 되돌려줘라.
		
	}
	
	
	
	double divide(int x, int y) {
		double result = (double) x / (double) y ;
		return result; // 위에 result와 중복이 아니여서 사용 가능.( {} 내에서만 사용되서)
	}

	int plus(int x,int j, int k) {
		// TODO Auto-generated method stub
		int result = x + j + k;
		return result;
	}

		
}

}

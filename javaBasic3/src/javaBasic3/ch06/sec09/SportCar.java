package javaBasic3.ch06.sec09;

public class SportCar {

	int a; //필드 = 항목 = 변수
	
	void aPrinter() {   // 메소드 = 함수 = 동작
		System.out.println( a ); 
	}
	
	//생성자
	public SportCar() { // (기본생성자 - 객체화 시 초기값을 넣을때 사용) 생성자를 1개도 안만들면 기본으로 셋팅 및 
		
	}
	
	public SportCar(int a) {
		this.a = a;
	}
	
	
	
	
}

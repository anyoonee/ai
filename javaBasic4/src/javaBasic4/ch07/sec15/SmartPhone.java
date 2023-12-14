package javaBasic4.ch07.sec15;

public class SmartPhone extends Phone{

	SmartPhone(String owner){ //생성자 선언
		
		super(owner); //Phone 생성자 호출
	}
	
	
	void internetSearch() { // 메소드 선언
		System.out.println("인터넷 검색을 합니다.");
	}
	
	void smartTurnOn() {
		System.out.println("스마트폰을 켭니다.");
	}
	
	void smartTurnOff() {
		System.out.println("스마트폰을 끕니다.");
	}


	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		
	}
	
}

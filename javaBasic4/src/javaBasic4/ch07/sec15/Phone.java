package javaBasic4.ch07.sec15;

public abstract class Phone {

	
	String owner;
	
	public Phone() {
		
	}
	
	public Phone(String owner) {
		
	}
	
	/*
	public void turnOn() {
		System.out.println("폰 전원을 킨다.");
	}
	
	public void turnOff() {
		System.out.println("폰 전원을 끈다.");
	}
	*/
	public abstract void turnOn();
	public abstract void turnOff(); // 추상 클래스
}

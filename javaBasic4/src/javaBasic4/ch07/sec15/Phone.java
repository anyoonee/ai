package javaBasic4.ch07.sec15;

public abstract class Phone {

	
	String owner;
	
	public Phone() {
		
	}
	
	public Phone(String owner) {
		
	}
	
	/*
	public void turnOn() {
		System.out.println("�� ������ Ų��.");
	}
	
	public void turnOff() {
		System.out.println("�� ������ ����.");
	}
	*/
	public abstract void turnOn();
	public abstract void turnOff(); // �߻� Ŭ����
}

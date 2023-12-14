package javaBasic4.ch07.sec16;

public abstract class Machine {
	
	public void powerOn() {}
	public void powerOff() {}
	public abstract void work(); // 추상메소드 - 내용이 없는 메소드 - 자식에게 강제로 재정의
	
}

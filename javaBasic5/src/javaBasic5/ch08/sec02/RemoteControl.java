package javaBasic5.ch08.sec02;

public interface RemoteControl {

	// 상수 - 변하지 않는 수 , 내용을 바꾸지 못하는 수
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;
	
	// 추상메소드  선언 abstract 생략 가능
	void turnOn();
	void turnOff();
	void setVolume(int volume);
	// void qrRead(); 구현 안한 추상메소드가 있어 자식들이 난리남
	
	//자바가 버전업되면서 추가된 메소드
	//디폴트 메소드
	default void defaultM() {
		int sum=0;
		System.out.println("QR코드 입력받기");
		for(int i=0; i<10; i++) {
			sum += privateM(i);
		}
		
	}
	//정적메소드
	static void staticM() {
		System.out.println("카카오톡 인증받기");
	}
	//private메소드
	private int privateM(int i) {
		return i+10;
	}
	//private 메소드
	
}

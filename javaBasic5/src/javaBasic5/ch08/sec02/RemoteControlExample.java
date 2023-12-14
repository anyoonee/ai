package javaBasic5.ch08.sec02;

public class RemoteControlExample {

	public static void main(String[] args) {
		
		RemoteControl rc;
		
		rc = new Television();
		rc.turnOn();
		rc.setVolume(5);
		rc.turnOff();
		
		rc = new SmartPhone();
		rc.turnOn();
		rc.setVolume(5);
		rc.turnOff();
		
		rc.defaultM();
		RemoteControl.staticM();
		
		
		

	}

}

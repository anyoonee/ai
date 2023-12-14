package javaBasic4.ch07.sec15;

public class PhoneExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Play play = new Play();
		
		SmartPhone s = new SmartPhone();
		play.playing(s);
		play.stop(s);
		
		iphone iphone = new iphone();
		play.playing(iphone);
		play.stop(iphone);
		

	}

}

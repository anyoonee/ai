package javaBasic5.ch08.sec03;

public class È®ÀÎ¹®Á¦8Àå5¹ø {
	
	public static void printSound(Soundable soundable) {
		System.out.println(soundable.sound());
	}

	public static void main(String[] args) {
		Remocon r = new TV();
		r.powerOn();
		
		printSound(new Cat());
		printsound(new Dog());
	}

}


interface Soundable{
	public String sound();
}

class Cat implements Soundable{

	@Override
	public String sound() {
		return "¾ß¿Ë";
	}
	
}

class Dog implements Soundable{

	@Override
	public String sound() {
		// TODO Auto-generated method stub
		return "¸Û¸Û";
	}
	
}

interface Remocon{
	public void powerOn(); //Ãß»ó¸Þ¼Òµå
}

class TV implements Remocon{

	@Override
	public void powerOn() {
		System.out.println("TV¸¦ Ä×½À´Ï´Ù.");
		
	}
	
}
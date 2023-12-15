package javaBasic5.ch08.sec03;

public class Ȯ�ι���8��5�� {
	
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
		return "�߿�";
	}
	
}

class Dog implements Soundable{

	@Override
	public String sound() {
		// TODO Auto-generated method stub
		return "�۸�";
	}
	
}

interface Remocon{
	public void powerOn(); //�߻�޼ҵ�
}

class TV implements Remocon{

	@Override
	public void powerOn() {
		System.out.println("TV�� �׽��ϴ�.");
		
	}
	
}
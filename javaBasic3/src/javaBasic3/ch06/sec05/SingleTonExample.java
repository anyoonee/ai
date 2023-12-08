package javaBasic3.ch06.sec05;

public class SingleTonExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Singleton o1 = Singleton.getInstance();
		Singleton o2 = Singleton.getInstance();
		
		System.out.println(o1);
		System.out.println(o2);
	}

}

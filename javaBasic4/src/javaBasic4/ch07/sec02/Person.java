package javaBasic4.ch07.sec02;

public class Person { // �θ�Ŭ���� = ����Ŭ���� = ����Ŭ����
	String name;
	int age;
	
	public void eat() {
		System.out.println("�Դ´�.");
	}
	
	private void sleep() {
		System.out.println("�ܴ�.");
		
	}
	
	public Person() {
		// TODO Auto-generated constructor stub
		System.out.println("�θ�Ŭ�����Դϴ�.");
	}

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	
	
	
	
}


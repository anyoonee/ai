package javaBasic4.ch07.sec02;

public class Person { // 부모클래스 = 슈터클래스 = 상위클래스
	String name;
	int age;
	
	public void eat() {
		System.out.println("먹는다.");
	}
	
	private void sleep() {
		System.out.println("잔다.");
		
	}
	
	public Person() {
		// TODO Auto-generated constructor stub
		System.out.println("부모클래스입니다.");
	}

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	
	
	
	
}


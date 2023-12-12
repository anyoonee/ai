package javaBasic4.ch07.sec02;


public class Student extends Person{ // 자식클래스 = 하위클래스

	String dept;

	
	public void study() {
		System.out.println("공부한다.");
	}
	
	public Student() {
		// TODO Auto-generated constructor stub
		super(); // 부모생성자 호출
		System.out.println("부모클래스 아버지 클래스");
	}
	
	public Student(String 이름, int 나이, String dept ) {
		// TODO Auto-generated constructor stub
		this.name = 이름;
		this.age = 나이;
		this.dept = dept;
		
		System.out.println("부모클래스 아버지 클래스 내용이 있는 생성자" + name);
	}
	
	
}

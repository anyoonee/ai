package javaBasic4.ch07.sec02;

public class Teacher extends Student{

	String department;
	
	public void teaching() {
		System.out.println("가르친다.");
	}
	
	public Teacher() {
		super("홍길동",30,"컴퓨터공학");
		// TODO Auto-generated constructor stub
		System.out.println("자식 클래스 나 me");
	}
	
	public Teacher(String name, int age, String dept,String department) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.age = age;
		this.dept = dept;
		this.department = department;
	}
	
}

package javaBasic4.ch07.sec02;

public class Teacher extends Student{

	String department;
	
	public void teaching() {
		System.out.println("����ģ��.");
	}
	
	public Teacher() {
		super("ȫ�浿",30,"��ǻ�Ͱ���");
		// TODO Auto-generated constructor stub
		System.out.println("�ڽ� Ŭ���� �� me");
	}
	
	public Teacher(String name, int age, String dept,String department) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.age = age;
		this.dept = dept;
		this.department = department;
	}
	
}

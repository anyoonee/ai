package javaBasic4.ch07.sec02;


public class Student extends Person{ // �ڽ�Ŭ���� = ����Ŭ����

	String dept;

	
	public void study() {
		System.out.println("�����Ѵ�.");
	}
	
	public Student() {
		// TODO Auto-generated constructor stub
		super(); // �θ������ ȣ��
		System.out.println("�θ�Ŭ���� �ƹ��� Ŭ����");
	}
	
	public Student(String �̸�, int ����, String dept ) {
		// TODO Auto-generated constructor stub
		this.name = �̸�;
		this.age = ����;
		this.dept = dept;
		
		System.out.println("�θ�Ŭ���� �ƹ��� Ŭ���� ������ �ִ� ������" + name);
	}
	
	
}

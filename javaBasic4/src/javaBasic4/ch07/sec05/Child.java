package javaBasic4.ch07.sec05;

public class Child extends Parent{

	/* Ȯ�ι���6��
	public int studentNo;
	public Child(String name, int studentNo) {
		this.name = name;
		this.studentNo = studentNo;

	}
	*/
	
	public String name;
	
	public Child() {
		this("ȫ�浿");
		System.out.println("Child() call");
	}
	
	public Child(String name) {
		this.name = name;
		System.out.println("Child(String name) call");
	}

}

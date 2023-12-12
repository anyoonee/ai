package javaBasic4.ch07.sec05;

public class Child extends Parent{

	/* 확인문제6번
	public int studentNo;
	public Child(String name, int studentNo) {
		this.name = name;
		this.studentNo = studentNo;

	}
	*/
	
	public String name;
	
	public Child() {
		this("홍길동");
		System.out.println("Child() call");
	}
	
	public Child(String name) {
		this.name = name;
		System.out.println("Child(String name) call");
	}

}

package javaBasic4.ch07.sec05;

public class Parent {

	
	/* 확인문제 6번
	//멤버필드
	public String name;
	
	
	//생성자
	public Parent(String name) {
		this.name = name;
		
	}


	public Parent() {
		// TODO Auto-generated constructor stub
	}
	
	*/
	
	// 확인문제 7번 
	public String nation; //필드
	
	public Parent() { //기본 생성자
		this("대한민국"); // 자기 클래스에서 다른생성자 호출
		System.out.println("Parent() call");
	}
	
	public Parent(String nation) { //생성자
		this.nation =nation;
		System.out.println("Parent(String nation) call");
	}
	
}

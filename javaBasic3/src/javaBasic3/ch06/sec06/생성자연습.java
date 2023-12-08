package javaBasic3.ch06.sec06;

public class 생성자연습 {

	String name;
	int score;
	
	public 생성자연습(String string) {
		// TODO Auto-generated constructor stub
		this.name = name;
	}

	//생성자가 1개도 없으면 "생성자연습()" 자바 컴파일러 자동으로 1개 만듬
	
	
	public 생성자연습() {
		name="김유신";
		//this(5,false); // 다른 생성자 호출 (단, 첫줄에서만)
	}
	
	public 생성자연습(int i, boolean b) {
		
	}
	
	public 생성자연습 (boolean b, int i) {
		
	}
	
}

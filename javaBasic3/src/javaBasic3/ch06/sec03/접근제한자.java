package javaBasic3.ch06.sec03;

import javaBasic3.ch06.sec04.AA;
import javaBasic3.ch06.sec05.Singleton;

public class 접근제한자 {

	public static void main(String[] args) {
		
		Singleton o1 = Singleton.getInstance();
		System.out.println(o1);
		// TODO Auto-generated method stub
		A aAdd = new A(); //객체화하기
		
		// System.out.println(aAdd.a); 에러 private 다른 객체에서 못씀
		System.out.println(aAdd.b); // 접근제한자가 default라 같은패키지는 가능하다.(int b=20;)
		System.out.println(aAdd.c); // 접근제한자가 public이라 가능.
		
		// aAdd.a1(); private이라 다른 객체에서 못씀.
		aAdd.b1();
		aAdd.c1();
		
		AA aaAdd = new AA();
		// System.out.println(aaAdd.a); private 다른 객체에서 못씀
		//System.out.println(aaAdd.b); default는 같은 패키지에서만 가능
		System.out.println(aaAdd.c); // public이라 가능
		
		/*
		aaAdd.a1();
		aaAdd.b1();
		*/
		aaAdd.c1();
		
		//실제로 개발할때는 변수는 private하고 
		
		
		
	}

}

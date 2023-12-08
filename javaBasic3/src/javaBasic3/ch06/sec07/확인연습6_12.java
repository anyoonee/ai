package javaBasic3.ch06.sec07;

import java.util.Scanner;

public class 확인연습6_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		System.out.print("id >");
		String id = sc.next();
		
		System.out.print("password >");
		String password = sc.next();
		
		MemberServices memberServices = new MemberServices();
		boolean result = memberServices.login("id","password");
		
		if(result) {
			System.out.println("로그인 되었습니다.");
			memberServices.logout(id);
		}else {
			System.out.println("id 또는 password가 올바르지 않습니다.");
		}
	}

}

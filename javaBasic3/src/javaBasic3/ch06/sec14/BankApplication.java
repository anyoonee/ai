package javaBasic3.ch06.sec14;

import java.util.Scanner;

//Account 클래스 관리
public class BankApplication {
	
	Scanner sc = new Scanner(System.in);
    Account[] accounts = new Account[100];
    int count = 0; //계좌생성 카운트
	
	public void 계좌생성() {
		// TODO Auto-generated method stub
		accounts[count ++] = new Account();
		System.out.println("-------------------");
		System.out.println("      계좌 생성     ");
		System.out.println("-------------------");
		System.out.println("계좌번호 : ");
		accounts[count].계좌번호 = sc.nextLine();
		System.out.println("계좌주 : ");
		accounts[count].계좌주 = sc.nextLine();
		System.out.println("초기입금액 : ");
		accounts[count].초기입금액 = sc.nextInt();
		System.out.println("결과 : 계좌가 생성되었습니다. ");
		count = count + 1;
		
	}

	public void 계좌목록() {
		// TODO Auto-generated method stub
		System.out.println("-------------------");
		System.out.println("      계좌 목록     ");
		System.out.println("-------------------");
		for(int i=0; i<count; i++) {
			System.out.println(accounts[i].get계좌번호() + " "+ accounts[i].get계좌주() + " " + accounts[i].get잔고());
			
		}
		
	}

	public void 예금() {
		// TODO Auto-generated method stub
		System.out.println("-------------------");
		System.out.println("       예  금      ");
		System.out.println("-------------------");
		System.out.println(" 계좌번호");
		String 예금할계좌번호 = sc.next();//홍길동 강자바 계좌인지 확인하기
		System.out.println("예금액 : ");
		int 예금액 = sc.nextInt();
		
		int i;
		boolean flag=false;
		
		for( i =0; i< count; i++) {
			if(예금할계좌번호.equals(accounts[i].get계좌번호())) {
				accounts[i].잔고 = accounts[i].get잔고() + 예금액;//홍길동 잔고에 계금금액을 더해서 홍길동 잔고에 넣어라.
				flag=true;
				break; //반복문 그만두고 i변수값을 기억
			}
		}
		if(!flag) System.out.println("계좌번호가 틀렸습니다. 확인해주세요.");
		
		
	}

	public void 출금() {
		// TODO Auto-generated method stub
		System.out.println("-------------------");
		System.out.println("       출  금      ");
		System.out.println("-------------------");
		System.out.println(" 계좌번호");
		String 출금할계좌번호 = sc.next();//홍길동 강자바 계좌인지 확인하기
		System.out.println("출금액 : ");
		int 출금액 = sc.nextInt();
		
		int i;
		boolean flag=false;
		
		for( i =0; i< count; i++) {
			if(출금할계좌번호.equals(accounts[i].get계좌번호())) {
				flag=true;
				if(accounts[i].잔고< 출금액) System.out.println("잔고가 부족합니다.");
				else accounts[i].잔고 = accounts[i].get잔고() - 출금액;//홍길동 잔고에 계금금액을 더해서 홍길동 잔고에 넣어라.
				break; //반복문 그만두고 i변수값을 기억
			}
		}
		if(!flag) System.out.println("계좌번호가 틀렸습니다. 확인해주세요.");
		
		
	}

	
	//계좌 생성
	
	//계좌 목록
	
	//예금
	
	//출금
	
}

package javaBasic3.ch06.sec01;

import java.text.SimpleDateFormat;
import java.util.Date;



public class 대출현황표_메인 {
	
	int 기간총합=0;
	int total=0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Date now = new Date();               //현재 날짜를 구해주는 객체
		String nowTime = now.toString();     //날짜를 문자열로
		System.out.println(nowTime);         //화면에 인쇄
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜출력 형태를 만들어준다
		System.out.println(sdf.format(now));                       //현재날짜 출력
		
		
		int[] iArr = {1,2,3};	
		//int 기간총합=0;
		//int total=0;
		
		
		대출현황표  d1 = new 대출현황표("J02-38" , "이민주" , new Date(), "주택자금대출", 27000000, 48);
		대출현황표  d2 = new 대출현황표("Y04-15" , "진영태" , new Date(), "예부적금담보대출", 30000000, 36);
		대출현황표  d3 = new 대출현황표("M02-06" , "최철식" , new Date(), "무보증신용대출", 20000000, 36);
		대출현황표  d4 = new 대출현황표("K03-05" , "이민주" , new Date(), "국민주택기금대출", 15000000, 60);
		
		// dArr내 4명의 객체 영입(객체 동일, 내용만 다를때 유용)
		대출현황표[] dArr = { new 대출현황표("J02-38" , "이민주" , new Date(), "주택자금대출", 27000000, 48), 
				           new 대출현황표("Y04-15" , "진영태" , new Date(), "예부적금담보대출", 30000000, 36),
				           new 대출현황표("M02-06" , "최철식" , new Date(), "무보증신용대출", 20000000, 36),
				           new 대출현황표("K03-05" , "이민주" , new Date(), "국민주택기금대출", 15000000, 60)
		                 };
		// dArr 관련 출력 
		for(int i=0; i < dArr.length; i++) {
			
	         System.out.println(dArr[i].get대출번호() + " " + dArr[i].get성명() + " " + dArr[i].get대출일() + " " + dArr[i].get대출종류() + " " + dArr[i].get대출금액() +" "+ dArr[i].get기간());
	             
		
		}

		double average = 기간총합 / (double) dArr.length; 
		System.out.println("대출금액 총합 : "+ total );
		System.out.println("기간의 평균 : "+  average);
		
		/*
		// 정답
		   int 대출금총합=0;
	       int 기간총합=0;
	       for( int i=0; i<dArr.length; i++) {
	          대출금총합 = 대출금총합 + dArr[i].get대출금액();
	          기간총합 = 기간총합 + dArr[i].get기간();
	       }
	       double 기간평균 = 기간총합 / (double) dArr.length;
	       
	       System.out.println("대출금액 총합 " + 대출금총합);
	       System.out.println("기간의 평균 " + 기간평균);
	      */

		
	}

}

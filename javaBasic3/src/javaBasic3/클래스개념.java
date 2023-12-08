package javaBasic3;

public class 클래스개념 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        
		//객체생성하자마자 값을 넣어주기
		Student st1 = new Student ("230101", "홍길동","AI",100,"010-123-1234");
		
		Teacher t1 = new Teacher ("A32", "정현희", "컴퓨터공학부", 100000, "전임", 20);
		
		//학번 출력
		System.out.println(st1.get학번());
		System.out.println(st1.get학과());
		System.out.println(t1.get이름());
		System.out.println(t1.get구분());
		System.out.println(st1.get점수());
		System.out.println(t1.get시수());
		
		// 필요할때마다 넣기
		// 빈 객체 생성하기
		Student st2 = new Student();
		Teacher tc2 = new Teacher();
		
		//값 넣기
		st2.set학번("2201");
		st2.set이름("이순신");
		st2.set학과("경영학과");
		st2.set점수(85);
		st2.set전화번호("010-234-2345");
		
		tc2.set코드("B101");
		tc2.set이름("박희연");
		tc2.set전공("피아노");
		tc2.set급여(2000000);
		tc2.set구분("시간강사");
		tc2.set시수(30);
		
		System.out.println(st2.get학번() + " " + st2.get이름() + " ");
		
		//생성자로 값넣기
		자동차판매현황 car1 = new 자동차판매현황("싼타페", 35000000, 15000000, 20000000, 36,555555);
		
		//빈 객체를 생성하기
		자동차판매현황 car2 = new 자동차판매현황();
		
		//빈객체에 값을 넣어주기
		car2.set차량명("코란도");
		car2.set차량총액(24000000);
		car2.set인도금(5000000);
		car2.set할부원금(19000000);
		car2.set상환기간(24);
		car2.set월납입금(791666);
		
		System.out.println("        자동차판매현황      ");
		System.out.println();
		System.out.println("차량명  차량총액     인도금    할부원금    상환기간  월납입금  ");
		System.out.println(car1.get차량명() + " " + car1.get차량총액() + "  " + car1.get할부원금() + "  " + car1.get할부원금() + "  " + car1.get상환기간() + "  " + car1.월납입금);
		System.out.println(car2.get차량명() + " " + car2.get차량총액() + "  " + car2.get할부원금() + "  " + car2.get할부원금() + "  " + car2.get상환기간() + "  " + car2.월납입금);
		
		
		System.out.println("차량 총액의 합계" + (car1.get차량총액() + car2.get차량총액()));
		System.out.println("월 납입금 총액" + (car1.get월납입금() + car2.get월납입금()));
	}

}

package javaBasic4.ch07.sec13;


//자식 클래스 = 하위클래스 = 세부내용(한국타이어, mysql )
public class HankookTire extends Tire{
	
	@Override
	public void roll() {
		System.out.println("한국 타이어가 굴러갑니다.");
		System.out.println("MySQL 프로그램으로 데이터베이스를 연결합니다.");
	}
	
	
}

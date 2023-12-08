package javaBasic3.ch06.sec09;

public class 확인문제6장18번 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		ShopService obj1 = ShopService.getInstance(); //static이 있는 메소드를 호출함.
		ShopService obj2 = ShopService.getInstance();
		
		if(obj1==obj2) {
			System.out.println("같은 ShopService 객체입니다.");
		}else {
			System.out.println("다른 ShopService 객체입니다.");
		}
		
		
		// 힌트 싱글톤 패턴으로 ShopService 클래스 생성
		//1. 생성자는 private입니다. 2. 필드는 객체화해서 생성자의 주소를 저장하고 private합니다.
		//3. 메소드인 getInstance()에서 리턴값을 생성자의 주소입니다. 접근제한자는 public입니다.
		
		
		
	}

}

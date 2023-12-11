package javaBasic3.ch06.sec09;

public class ShopService {
	
	// 힌트 싱글톤 패턴으로 ShopService 클래스 생성
			//1. 생성자는 private입니다. 2. 필드는 객체화해서 생성자의 주소를 저장하고 private합니다.
			//3. 메소드인 getInstance()에서 리턴값을 생성자의 주소입니다. 접근제한자는 public입니다.

	private static ShopService shopService = new ShopService();
	
	private ShopService() {
		
	}
	public static ShopService getInstance() {
		return shopService;
	}
	
}

package javaBasic3.ch06.sec09;

public class Ȯ�ι���6��18�� {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		ShopService obj1 = ShopService.getInstance(); //static�� �ִ� �޼ҵ带 ȣ����.
		ShopService obj2 = ShopService.getInstance();
		
		if(obj1==obj2) {
			System.out.println("���� ShopService ��ü�Դϴ�.");
		}else {
			System.out.println("�ٸ� ShopService ��ü�Դϴ�.");
		}
		
		
		// ��Ʈ �̱��� �������� ShopService Ŭ���� ����
		//1. �����ڴ� private�Դϴ�. 2. �ʵ�� ��üȭ�ؼ� �������� �ּҸ� �����ϰ� private�մϴ�.
		//3. �޼ҵ��� getInstance()���� ���ϰ��� �������� �ּ��Դϴ�. ���������ڴ� public�Դϴ�.
		
		
		
	}

}

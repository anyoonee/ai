package javaBasic6.ch09.sec01;

public class AExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

class A{
	
	int a = 10;
	void aM() {
		System.out.println(a);
		// b = b+ 100; ����Ŭ������ ���� ����Ҽ� ����.
		// bM(); ����Ŭ������ �޼ҵ带 ����Ҽ� ����.
		
	}
	
	static int sa = 200; //������� �����Ҷ� �̸� ���ø޸𸮿� �ø�
	static void saM() {
		System.out.println(sa);
		//System.out.println(b); //new �ϰ� ����Ѵ�.
		//System.out.println(a); //static �پ��ִ� �޼ҵ�� �̸� �ö󰡱� ������ new �ؼ� ���� ���� ����.
	}
	
	class B{
		// a = a+100; �޼ҵ� �ȿ� ���ض� �ϰ� ����ؾ��ϴµ� Ŭ�������� ����ؼ� �ȵ�
		// aM(); �޼ҵ�ȿ� �޼ҵ�ȣ���̶�� ����ؾ��ϴµ� Ŭ�������� ����ؼ� �ȵ�
		int b=20;
		void bM() {
			a=a+100; //����Ŭ�������� �ܺ�Ŭ���� �ʵ带 ����� �� �ִ�.
			aM();	// ����Ŭ�������� �ܺ�Ŭ������ �޼ҵ带 ȣ���� �� �ִ�.		
			System.out.println(b);
		}
		class C{
			
		}
		
	}
}
package javaBasic5.ch08.sec03;

public class Ȯ�ι���8�� {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// A a = new A(); �������̽��� ��üȭ �� �� ����.
		// �ش� �������̽� ����� ���� �ϴ� Ŭ���� ���� �� �Ʒ��� ���� ��� �����ϴ�.
		AImpl a = new AImpl();
		Driver d = new Driver();
		d.a = new AImpl();
		d.dirve(a);
		A a1 = new AImpl();
		B  b = new BB(); //�ڵ��� ��ȯ
		BB bb22= (BB) b; //������ ��ȯ
		b.aM();
		//b.bM(); ������
		
		BB bb=(BB) b;//��������ȯ
		
	 
		
		
	}

}

interface A{
	//���
	static final int a=10;
	abstract void aM(); //�߻�޼ҵ�
	default void dM(); //default �޼ҵ� �������̵� ����.
	static void sM(); //�����޼ҵ�
	
}

class Driver{
	A a;
	void dirve(A a) {
		a.aM();
	}
}

class B{
	int a =10;
	void aM() {
		
	}
}

class BB extends B{
	int b =20;
	void bM() {
		System.out.println(b);
	}
	
}

class AImpl implements A{//����Ŭ����

	@Override
	public void aM() {
		System.out.println(a);
	}
	
	@Override
	public void dM() {
		System.out.println(b);
	}
	
}
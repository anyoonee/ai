package javaBasic3.ch06.sec10.exam03;

public class ClassName250 {

	//��� const 
	static final int A =10;
	static final double PI = 3.141592;
	static final double RATE = 0.025;
	
	//���� = ���ϴ� ��
	static int a = 10;
	
	//�ν��Ͻ� �����
	int field;
	static void method() {
		a = a+10;
		System.out.println(A + 20);
		// A=1000; ���� ����̱⶧���� ���ٲ�
		};
	
	//���� �����(Ŭ���� �����)
	static int field2;
	static void method2() {};
	
	static {
		//field = 10; ���� �޸𸮿� �ö󰡴� ������ �޶� ���Ұ�.
		//method(); ����
		field2 =20;
		method();
	}
	
	static void method3() {
		//field = 10; ����
		// method(); ����
		field2 =20;
		method();
	}
	
	{
	  field = 10; 
	  method(); 
	  field2 =20;
	  method();
	}
	
	void method4() {
		 field = 10; 
		  method(); 
		  field2 =20;
		  method();
	}
}

package javaBasic3.ch06.sec02;

public class ����Ŭ���� {

	static int st=10;
	int it =100;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//m1();
		//m2();
		����Ŭ���� i1 = new ����Ŭ����(); // static �� �پ��ִ� ������� ���޸𸮿� �ö󰣴�.
		i1.m2();
		System.out.println(st);
		System.out.println(i1.it);
		m1(i1);
	}
	
	static void m1() { //�ڹٰ� ����ܰ迡�� �ڵ����� ���ø޸𸮿� �÷���
		System.out.println("���� �޼ҵ� �Դϴ�.");
		System.out.println(st);
		System.out.println(i1.it);
	}
	
	void m2() {
		System.out.println("�ν��Ͻ� �޼ҵ��Դϴ�.");
		System.out.println(st);
		System.out.println(i1.it);
	}
	
	

}

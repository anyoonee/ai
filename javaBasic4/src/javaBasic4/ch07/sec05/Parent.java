package javaBasic4.ch07.sec05;

public class Parent {

	
	/* Ȯ�ι��� 6��
	//����ʵ�
	public String name;
	
	
	//������
	public Parent(String name) {
		this.name = name;
		
	}


	public Parent() {
		// TODO Auto-generated constructor stub
	}
	
	*/
	
	// Ȯ�ι��� 7�� 
	public String nation; //�ʵ�
	
	public Parent() { //�⺻ ������
		this("���ѹα�"); // �ڱ� Ŭ�������� �ٸ������� ȣ��
		System.out.println("Parent() call");
	}
	
	public Parent(String nation) { //������
		this.nation =nation;
		System.out.println("Parent(String nation) call");
	}
	
}

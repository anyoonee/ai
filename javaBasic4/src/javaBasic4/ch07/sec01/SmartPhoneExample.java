package javaBasic4.ch07.sec01;

public class SmartPhoneExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//���� �︳�ϴ�.
		Phone p = new Phone();
		p.bell();
		p.sendVoice("�����?!");
		p.receiveVoice("�����, �ʵ� �����?");
		
		SmartPhone sp = new SmartPhone();
		sp.sendVoice("���� ���Ұž�?");
		sp.receiveVoice("������ �����Ұž�");
		sp.hangUp();
		
		//��� �ڵ����� �������̰� �˴ϴ�.
		SmartPhone sp2 = new SmartPhone("������","���");
		System.out.println(sp2.model);
		sp2.setWifi(true);
		if(sp2.wifi) {
			System.out.println(sp2.model + "�������̰� �˴ϴ�.");
		}else {
			System.out.println(sp2.model + "�������̰� �ȵ˴ϴ�.");
		}
		
		
		//�������� ����̰� ���� �︳�ϴ�.
		System.out.println(sp2.model +"�� "+sp2.color+"�̰� ");
		sp2.bell(); //������ ������ �ȵǼ� �Ʒ��� ȣ��
		
		System.out.println(sp2.model + "�� �޼����� �Խ��ϴ�.");
		sp2.sendVoice("�ڵ��� ���?");
		
		//�θ�Ŭ�������� �ڽ��� wifi�ʵ�, �޼ҵ� ����ϱ�
		//�θ�Ŭ���������� �ڽ��� ������� ���� ����.
		
	}

}

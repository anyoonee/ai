package javaBasic5.ch08.sec02;

public interface RemoteControl {

	// ��� - ������ �ʴ� �� , ������ �ٲ��� ���ϴ� ��
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;
	
	// �߻�޼ҵ�  ���� abstract ���� ����
	void turnOn();
	void turnOff();
	void setVolume(int volume);
	// void qrRead(); ���� ���� �߻�޼ҵ尡 �־� �ڽĵ��� ������
	
	//�ڹٰ� �������Ǹ鼭 �߰��� �޼ҵ�
	//����Ʈ �޼ҵ�
	default void defaultM() {
		int sum=0;
		System.out.println("QR�ڵ� �Է¹ޱ�");
		for(int i=0; i<10; i++) {
			sum += privateM(i);
		}
		
	}
	//�����޼ҵ�
	static void staticM() {
		System.out.println("īī���� �����ޱ�");
	}
	//private�޼ҵ�
	private int privateM(int i) {
		return i+10;
	}
	//private �޼ҵ�
	
}

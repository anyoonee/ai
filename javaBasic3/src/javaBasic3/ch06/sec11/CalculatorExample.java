package javaBasic3.ch06.sec11;

public class CalculatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Calculator calculator = new Calculator(); // 1�ܰ�. ��üȭ(���޸𸮿��ø�)
		
		calculator.poweron(); //�޼ҵ� ȣ��
		calculator.poweroff();
		
		calculator.poweron();
		int result = calculator.plus(300, 500);
		System.out.println(result);
		
		// ���� -50 ,-100 ���ϱ�
		result = calculator.plus(-50, -100);
		System.out.println(result);
		
		//���� 100,200,300 ���ϱ�
		result = calculator.plus(100, 200);
		result = calculator.plus(result, 300);
		System.out.println(result);
		
		// �޼ҵ��� �谳���� 3��
		result = calculator.plus(100, 200, 300);
		
		
	}

}

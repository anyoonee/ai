package javaApp4.ch16.sec03;

public class LamdaEx04 {

	public static void main(String[] args) {
		// 706
		Person person = new Person();
		
		// ���2. �͸�����ü �ڵ�
//		Calcuable calcuable = new Calcuable() {
//			
//		@Override
//		public double calc(double x, double y) {
//			Computer.staticMethod(x, y);
//			return 0;
//		}
//	};
//	
	// ���3. ���ٽ����� ����
//	Calcuable calcuable = (double x, double y) -> {Computer.staticMethod(x, y);return 0;};
	
	// ���4. �޼ҵ� ����
	Calcuable calcuable = Computer :: staticMethod;
//  �������̽�    ����      = Ŭ������ ::  Ŭ�����ȿ� �ִ� �޼ҵ��
//  �������̽��� �߻�޼ҵ�� �Է��Ͽ� Ŭ�����ȿ� �ִ� �޼ҵ带 ����(���) ���	
	person.action(calcuable);
	
	
	Computer computer = new Computer();
	//���2. �͸� ���� ��ü
//	Calcuable calcuable1 = new Calcuable() {
//		
//		@Override
//		public double calc(double x, double y) {
//			return computer.instanceMethod(x, y);
//	}
//};
	// ���3. ���ٽ�
//	Calcuable calcuable1 = (double x, double y)-> { return computer.instanceMethod(x, y);};
//		person.action(calcuable1);
	}

}

// @ ������̼� �ٷ� �Ʒ��� �ִ� ��ü�� �Ӽ��� ����
@FunctionalInterface
interface Calcuable{
	double calc(double x, double y); //�߻�޼ҵ�
}

class Person{
	public void action(Calcuable calcuable) {
		double result = calcuable.calc(10,4);
		System.out.println("��� : " + result);
	}
}

class Computer{
	public static double staticMethod(double x, double y) {
		return x+y;
	}
	public double instanceMethod(double x, double y) {
		return x*y;
	}
	
}
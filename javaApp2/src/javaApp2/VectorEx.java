package javaApp2;

import java.util.Vector;

public class VectorEx {

	public static void main(String[] args) {
		// ������ �������� CPU�� ����ϸ鼭 ��Ƽ���α׷����ϴ� ��
		// Vector �÷����� �������� �ڷḦ ������� ����
		// �̿�о� : ������� ��Ƽ���α׷����Ҷ� ������ �ְ� �ߺ������� �� �ִ� �ڷᱸ��
		
		Vector<Double> dArr = new Vector<Double>();
		//10.4, 8.8, 9.4, 3.7
		dArr.add(10.4);
		dArr.add(8.8);
		dArr.add(9.4);
		dArr.add(3.7);

		//8.8�ڿ� 7.9�ֱ�
		dArr.add(2, 7.9);
		
		//3.7�� �ֽ��ϱ�?
		if(dArr.contains(3.7)) {
			System.out.println("�ֽ��ϴ�.");
		}else {
			System.out.println("�����ϴ�.");
		}
		
	}

}

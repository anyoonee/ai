package javaApp1.ch12.sec04;

import java.util.Arrays;
import java.util.Random;

public class RandomExample {
	public static void main(String[] args) {
		//���ù�ȣ
		int[] selectNumber = new int[6]; //���ù�ȣ6���� ����� �迭 ����
		Random random = new Random(3); // random ��ü ����
		System.out.println("���ù�ȣ : ");
		for(int i = 0; i<6; i++) { // ���ù�ȣ 6���� ��� �迭�� ����
			selectNumber[i]=random.nextInt(45) + 1;
			System.out.println(selectNumber[i] + " ");
		}
		System.out.println();
		
		
		//��÷��ȣ
		int[] winningNumber = new int[6]; //��÷��ȣ 6���� ����� �迭����
		random = new Random(5); //random ��ü ����
		System.out.println("��÷��ȣ : ");
		for(int i=0;i<6;i++) { // ��÷��ȣ 6���� ��� �ſ��� ����
			winningNumber[i] = random.nextInt(45) + 1;
			System.out.println(winningNumber[i] + " ");
		}
		System.out.println();
		
		//��÷����
		Arrays.sort(selectNumber);   // ������
		Arrays.sort(winningNumber);  // �迭�׸� ����
		boolean result = Arrays.equals(selectNumber, winningNumber);
		System.out.println("��÷����: ");
		if(result) {
			System.out.println("1� ��÷�Ǽ̽��ϴ�.");
		}else {
			System.out.println("��÷���� �ʾҽ��ϴ�.");
		}
	}

}

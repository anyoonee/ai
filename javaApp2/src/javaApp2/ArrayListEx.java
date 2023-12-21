package javaApp2;

import java.util.ArrayList;

public class ArrayListEx {

	public static void main(String[] args) {
		// List Ư¡ ������ �ִ�. �ߺ������� �ִ�.
		int[] iarr = {1,2};
		for (int i : iarr) {
			System.out.println(i);
		}
		for (int i =0; i< iarr.length; i++) {
			System.out.println(iarr[i]);
		}
		//3,4�߰��ϰ� �ʹ�.
		//{1,2,3,4}
		
		//List�� ����Ŭ������ ArrayList�� �̿�
		ArrayList<Integer> arrList = new ArrayList<Integer>();
		//<E> ���׸� �ڷ����� �̸� ����
		arrList.add(1);
		arrList.add(2);
		System.out.println(arrList.size()); //ArrayList�ȿ� ��� ��Ұ� �ִ��� ��ȯ
		//3,4 �߰��ϱ�
		arrList.add(3);
		arrList.add(4);
		//0�� �ε����� -7 �ֱ�
		arrList.add(0,-7);
		//��ü ��� �� �ݺ��� ����Ұ�
		for(int i =0; i < arrList.size(); i++) { // i=0 1 2 3 4
			System.out.println(arrList.get(i)); //�ε�����ȣ�� �ִ� ��Ҹ� ����ϱ�
			
		}
		
		//���ڿ��� ArrayList�ֱ�
		ArrayList<String> sArr = new ArrayList<String>();
		//��� �� �� �ٳ��� �Է�(����)�ϱ�
		sArr.add("���");
		sArr.add("��");
		sArr.add("��");
		sArr.add("�ٳ���");
		
		//�ְ� �ٳ��� ���̿� ���ξ��� �ֱ�
		//����� ����̿� �޷гֱ�
		sArr.add(3,"���ξ���");
		sArr.add(1,"�޷�");
		
		//���� õ�������� �����ϱ�
		sArr.set(3, "õ����");
		
		// �����ϱ�
		sArr.remove(5);
		sArr.remove("���ξ���");
		
		
		//��ü����ϱ�
		for(int i =0;i<sArr.size();i++) {
			System.out.println(sArr.get(i) + " ");
		}
		
		//���ξ����� �ֽ��ϱ�?
		if (sArr.contains("���ξ���")){
			System.out.println("�ֽ��ϴ�.");
		}else {
			System.out.println("�����ϴ�.");
		} 
		
	}

}

package javaApp2;

import java.time.LocalDateTime;
import java.util.LinkedList;

public class LinkedListEx {

	public static void main(String[] args) {
		// 
		
		LinkedList<Board> boardList = new LinkedList<Board>();
		Board b1 = new Board(1,"����1","����1","ȫ�浿",LocalDateTime.now());
		Board b2 = new Board(2,"����2","����2","�̼���",LocalDateTime.now());
		Board b3 = new Board(3,"����3","����3","�ְ��",LocalDateTime.now());
		
		boardList.add(b1);
		boardList.add(b2);
		boardList.add(b3);
		
		System.out.println(boardList.get(0).writer); //b1�� ������������ ���´�. .writer �� ���̸� �ش簪�� ����.
		System.out.println(boardList.get(1).title);
		System.out.println(boardList.get(2).title);
		System.out.println(boardList.get(2).title);
		
		Board b0 = new Board(0,"����0","����0","������",LocalDateTime.now());
		//0�� �ε����� b0�� �����ϼ���.
		boardList.add(0,b0);
		//"�ְ�̰� �ֽ��ϱ�?"
		/*
		if(boardList.contains("�ְ��")) {
			System.out.println("�ֽ��ϴ�.");
		}else {
			System.out.println("�����ϴ�.");
		}*/
		
		Board findAddress = null; //ã�� ����� �ּҸ� ���� ����
		
		for(int i = 0; i<boardList.size(); i++) {
			System.out.println(boardList.get(i).writer);
		if(boardList.get(i).writer.equals("�ְ��")) {
			System.out.println("�ֽ��ϴ�.");
			
			//�ּҸ� ������ ��´�
			findAddress = boardList.get(i);
		}	
	}
		//�ְ�̾��� �Խñ� ������ ã��
		System.out.println("ã�� ��� �ְ�̾��� �ۼ��� �Խñ� ������? " + findAddress.content);
		
		//�Խñ� ��ȣ 2���� �Խñ� �ۼ��ڴ�?
		for(int i = 0; i <boardList.size(); i++) {
			System.out.println(boardList.get(i).no); //��ü �Խñ� ��ȣ
			if(boardList.get(i).no == 2) {
				findAddress = boardList.get(i);
			}
		}
		
		System.out.println(findAddress.writer);
		
		//�̼����� �����ϱ�
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).writer.equals("�̼���")) {
				findAddress = boardList.get(i);
			}
		}
		
		boardList.remove(findAddress);
		
		// ��� �Խ��� ���� ���
		for(int i=0; i<boardList.size(); i++) {
			System.out.println(boardList.get(i).toString());
		}
}
}

//�Խ���
class Board extends Object{
	
	int no; //�Խ��� ��ȣ
	String title; //����
	String content; //����
	String writer; //�ۼ���
	LocalDateTime writeDate; //�ۼ���
	
	public Board(int no, String title, String content, String writer, LocalDateTime writeDate) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "��ȣ" + no + "����" + title + "����" + content + "�ۼ���" + writer + "�ۼ���" + writeDate;
	}
	
}
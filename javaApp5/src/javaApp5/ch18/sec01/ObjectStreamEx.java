package javaApp5.ch18.sec01;

import java.io.*;

public class ObjectStreamEx {

	public static void main(String[] args) {
		// Member Ŭ������ ���¸� ��Ʈ������ ���� �ܺη� ������
		try {
			OutputStream os = new FileOutputStream("D:/ai/study/java_study/data/member.dat");
			BufferedOutputStream bos = new BufferedOutputStream(os);
			ObjectOutputStream oos = new ObjectOutputStream(bos); //��ü�� ��Ʈ������ �����
			
			Member m1 = new Member("fall","��ǳ��",10);
			
			oos.writeObject(m1);
			oos.flush();
			oos.close();
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

class Member {
	
	String id;
	String name;
	int age;
	
	public Member(String id, String name, int age) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return id + " " + name + " " + age;
	}
	
}
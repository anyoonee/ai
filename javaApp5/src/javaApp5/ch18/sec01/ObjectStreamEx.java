package javaApp5.ch18.sec01;

import java.io.*;

public class ObjectStreamEx {

	public static void main(String[] args) {
		// Member Ŭ������ ���¸� ��Ʈ������ ���� �ܺη� ������
		try {
//			OutputStream os = new FileOutputStream("D:/ai/study/java_study/data/member3.dat");
//			BufferedOutputStream bos = new BufferedOutputStream(os);
//			ObjectOutputStream oos = new ObjectOutputStream(bos); //��ü�� ��Ʈ������ �����
//			//ObjectOutputStream�� �Ϸ��� Member��ü�� implements Serializable �ؾ��Ѵ�.
//			
//			Member m1 = new Member("fall","��ǳ��",10);
//			
//			oos.writeObject(m1);
//			oos.flush();
//			oos.close();
			
			//�ܺ� ������ �а�
			InputStream is = new FileInputStream("D:/ai/study/java_study/data/member3.dat");
			BufferedInputStream bis = new BufferedInputStream(is);
			ObjectInputStream ois = new ObjectInputStream(bis); //��ü�� ��Ʈ������ �����
			Member iM = (Member) ois.readObject();
			System.out.println(iM);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

class Member implements Serializable{
	
	private static final long serialVersionUID = -5413711528933648809L;
	
	
	String id;
	String name;
	int age;
	int point;
	
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
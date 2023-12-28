package javaApp5.ch18.sec01;

import java.io.*;

public class ObjectStreamEx {

	public static void main(String[] args) {
		// Member 클래스의 형태를 스트림으로 만들어서 외부로 보내기
		try {
			OutputStream os = new FileOutputStream("D:/ai/study/java_study/data/member.dat");
			BufferedOutputStream bos = new BufferedOutputStream(os);
			ObjectOutputStream oos = new ObjectOutputStream(bos); //객체를 스트림으로 만들기
			
			Member m1 = new Member("fall","단풍이",10);
			
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
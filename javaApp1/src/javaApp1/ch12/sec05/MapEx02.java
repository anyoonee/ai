package javaApp1.ch12.sec05;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class MapEx02 {

	public static void main(String[] args) {
		// Map
		Member m1 = new Member("a100", 123);
		Member m2 = new Member("a200", 234);
		Member m3 = new Member("a300", 345);
		
		
		//Map 키는 1 값은 m1
		HashMap<Integer,Member> hmap = new HashMap<Integer,Member>();
		
		//데이터 입력하기
		hmap.put(1, m1);
		hmap.put(2, m2);
		hmap.put(3, m3);
		
		//
		System.out.println(hmap.get(3));
		
		//키들만 출력하기
		System.out.println(hmap.keySet());
		// 키 + 값 전체 출력
		Set<Integer> keys = hmap.keySet();
		Iterator<Integer> it = keys.iterator();
		while(it.hasNext()) {
			Integer itKey=it.next();
			System.out.println(itKey + " " + hmap.get(itKey));
		}
		
		//Map예제 키 - id값 pwd
		HashMap<String,Integer> hMap2 = new HashMap<String,Integer>();
		hMap2.put(m1.id, m1.pwd);
		hMap2.put(m2.id, m2.pwd);
		hMap2.put(m3.id, m3.pwd);
		
		//a100 일때 비밀번호 ?
		System.out.println(hMap2.get(m1.id));
		
		//추가
		Member m4 = new Member("a300", 456);
		hMap2.put(m4.id, m4.pwd);
		
		Member m5 = new Member("a400", 567);
		hMap2.put(m5.id, m5.pwd);
		
		System.out.println(hMap2.size());
		//동등객체를 id와 pwd같으면 같은 것 코딩
		Set<String> keys2 = hMap2.keySet();
		Iterator<String> k2 = keys2.iterator();
		while(k2.hasNext()) {
			System.out.println(k2.next());
		}
	}

}

class Member{
	String id;
	Integer pwd;
	
	public Member(String id, Integer pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return id + " "+ pwd;
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return id.hashCode() + pwd.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member m =(Member) obj;
			if(id.equals(m.id) && pwd==m.pwd) return true;
		}
		
		return false;
		
	}
	
}
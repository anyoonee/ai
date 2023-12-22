package javaApp2.ch15.sec01;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapEx1 {

	public static void main(String[] args) {
		// 656
		
		Map<Integer, String> m1 = new HashMap<Integer, String>();
		//값 넣기
		m1.put(1, "이순신");
		m1.put(2, "박수연");
		m1.put(3, "홍길동");
		
		//출력하기, 꺼내보기 get
		System.out.println(m1.get(1)); //키를 넣으면 값이 나온다.
		
		Map<String,Double> m2 = new HashMap<String,Double>();
		
		m2.put("a",2.5);
		m2.put("b",3.5);
		m2.put("b",3.5);
		m2.put("b",3.5);
		m2.put("b",13.5);
		
		//3.5 출력하기
		System.out.println(m2.get("b"));
		
		//크기구하기
		System.out.println(m1.size()); // 키가 동일하면 동등객체로 판단하고 새로운 것을 대체한다. 즉,마지막키의 값으로 남는다.
		
		Map<String, String> m3 = new HashMap<String, String>();
		m3.put("홍길동", "과장");
		m3.put("이순신", "부장");
		m3.put("최경미", "사원");
		m3.put("홍길동", "사장");
		
		//크기는?
		System.out.println(m3.size());
		//직책은?
		System.out.println(m3.get("이순신"));
		
		System.out.println(m3.get("최경미"));
		
		System.out.println(m3.get("홍길동"));
		//퇴사
		m3.remove("최경미");
		
		//전체출력하기
		System.out.println(m3.get("홍길동"));
		System.out.println(m3.get("이순신"));
		
		//생각 전체 출력하면 key를 반복해서 넣어주면 된다.
		//keySet() 모든 키를 Set() 담는다
		Set<String> m3Keys = m3.keySet();//키들을 담는다
		
		Iterator<String> it = m3Keys.iterator();
		while(it.hasNext()) {
			System.out.println(m3.get(it.next())+"###"); //키값들이 반복해서 출력
		}
		
		
		}

}

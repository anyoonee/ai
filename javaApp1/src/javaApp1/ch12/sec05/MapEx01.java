package javaApp1.ch12.sec05;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class MapEx01 {

	public static void main(String[] args) {
		HashMap<Integer, String> hm = new HashMap<Integer, String>();
		hm.put(1, "홍길동1");
		hm.put(2, "홍길동2");
		hm.put(3, "홍길동3");
		hm.put(4, "홍길동4");

		//몇개 있나요?
		System.out.println(hm.size());
		
		//키가 3이 있나요?
		System.out.println(hm.containsKey(3));
		
		//홍길동 5가?
		System.out.println(hm.containsValue("홍길동5"));
		
		//키를 넣으면
		System.out.println(hm.get(2));
		
		//삭제
		hm.remove("홍길동4");
		
		// 전체출력
		System.out.println(hm.get(1));
		System.out.println(hm.get(2));
		System.out.println(hm.get(3));
		
		//키값들구해 get()출력
		Set<Integer> keys = hm.keySet();
		Iterator<Integer> it = keys.iterator();
		while(it.hasNext()){
			System.out.println(hm.get(it.next()));
		}
		//entrySet()
		Set<Entry<Integer,String>> e = hm.entrySet();
		Iterator<Entry<Integer,String>> it2 =e.iterator();
		while(it2.hasNext()) {
			Entry<Integer, String> e1 = it2.next(); //1=홍길동1
			Integer keyE1 = e1.getKey(); //키를 얻는다.
			hm.get(keyE1);//값을얻는다
			System.out.println(hm.get(keyE1) + "~"); //값을 얻는다.
			System.out.println(e1.getValue()+"~~");//값을얻는다.
			
		}
		
	}

}

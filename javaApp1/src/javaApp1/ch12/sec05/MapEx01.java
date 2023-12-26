package javaApp1.ch12.sec05;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class MapEx01 {

	public static void main(String[] args) {
		HashMap<Integer, String> hm = new HashMap<Integer, String>();
		hm.put(1, "ȫ�浿1");
		hm.put(2, "ȫ�浿2");
		hm.put(3, "ȫ�浿3");
		hm.put(4, "ȫ�浿4");

		//� �ֳ���?
		System.out.println(hm.size());
		
		//Ű�� 3�� �ֳ���?
		System.out.println(hm.containsKey(3));
		
		//ȫ�浿 5��?
		System.out.println(hm.containsValue("ȫ�浿5"));
		
		//Ű�� ������
		System.out.println(hm.get(2));
		
		//����
		hm.remove("ȫ�浿4");
		
		// ��ü���
		System.out.println(hm.get(1));
		System.out.println(hm.get(2));
		System.out.println(hm.get(3));
		
		//Ű���鱸�� get()���
		Set<Integer> keys = hm.keySet();
		Iterator<Integer> it = keys.iterator();
		while(it.hasNext()){
			System.out.println(hm.get(it.next()));
		}
		//entrySet()
		Set<Entry<Integer,String>> e = hm.entrySet();
		Iterator<Entry<Integer,String>> it2 =e.iterator();
		while(it2.hasNext()) {
			Entry<Integer, String> e1 = it2.next(); //1=ȫ�浿1
			Integer keyE1 = e1.getKey(); //Ű�� ��´�.
			hm.get(keyE1);//������´�
			System.out.println(hm.get(keyE1) + "~"); //���� ��´�.
			System.out.println(e1.getValue()+"~~");//������´�.
			
		}
		
	}

}

package javaApp2.ch15.sec01;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SetEx2 {

	public static void main(String[] args) {
		// String 객체 set 넣기
		// 과일가게 : 사과 배 귤 바나나 사과 배  우리가 팔고 있는 과일 종류?
		// set요소 넣기
		
		Set<String> set = new HashSet<String>(); //shift + ctrl + o -import 자동으로 
		
		set.add("사과");
		set.add("배");
		set.add("귤");
		set.add("바나나");
		set.add("사과");
		set.add("배");
		
		//set안에 요소갯수 구하기 - 우리가 팔고 있는 과일 종류?
		System.out.println(set.size());
		
		//메론팔아?
		System.out.println(set.contains("메론"));
		
		//set안에 있는 모두 출력하기
		Iterator<String> it = set.iterator();
		while(it.hasNext()) {
		System.out.println(it.next());
		}
		
		//set안에 있는 모든 요소 삭제하기
		set.clear();
		System.out.println(set.size());
	}
	
}

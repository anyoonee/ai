package javaApp2;

import java.util.ArrayList;

public class ArrayListEx {

	public static void main(String[] args) {
		// List 특징 순서가 있다. 중복저장이 있다.
		int[] iarr = {1,2};
		for (int i : iarr) {
			System.out.println(i);
		}
		for (int i =0; i< iarr.length; i++) {
			System.out.println(iarr[i]);
		}
		//3,4추가하고 싶다.
		//{1,2,3,4}
		
		//List의 구현클래스인 ArrayList를 이용
		ArrayList<Integer> arrList = new ArrayList<Integer>();
		//<E> 제네릭 자료형을 미리 지정
		arrList.add(1);
		arrList.add(2);
		System.out.println(arrList.size()); //ArrayList안에 몇개의 요소가 있는지 반환
		//3,4 추가하기
		arrList.add(3);
		arrList.add(4);
		//0번 인덱스에 -7 넣기
		arrList.add(0,-7);
		//전체 출력 및 반복문 사용할것
		for(int i =0; i < arrList.size(); i++) { // i=0 1 2 3 4
			System.out.println(arrList.get(i)); //인덱스번호에 있는 요소를 출력하기
			
		}
		
		//문자열을 ArrayList넣기
		ArrayList<String> sArr = new ArrayList<String>();
		//사과 배 귤 바나나 입력(삽입)하기
		sArr.add("사과");
		sArr.add("배");
		sArr.add("귤");
		sArr.add("바나나");
		
		//귤과 바나나 사이에 파인애플 넣기
		//사과와 배사이에 메론넣기
		sArr.add(3,"파인애플");
		sArr.add(1,"메론");
		
		//귤을 천혜향으로 수정하기
		sArr.set(3, "천혜향");
		
		// 삭제하기
		sArr.remove(5);
		sArr.remove("파인애플");
		
		
		//전체출력하기
		for(int i =0;i<sArr.size();i++) {
			System.out.println(sArr.get(i) + " ");
		}
		
		//파인애플이 있습니까?
		if (sArr.contains("파인애플")){
			System.out.println("있습니다.");
		}else {
			System.out.println("없습니다.");
		} 
		
	}

}

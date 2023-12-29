package javaApp5.ch18.sec03;

import java.util.*;

public class StreamEx03 {

	public static void main(String[] args) {
		// 중간 스트림 익히기2 742
		
		List<String> list1 = new ArrayList<>();
		list1.add("this is java");
		list1.add("i am a best developer");
	/*	
		String a = "this is java";
		String[] as = a.split(" "); //String[] 배열이 나온다
		for (String s : as) {
		System.out.println(s);
		}
		*/
		
		
		// " "으로 된 부분 잘라서 단어 출력
		list1.stream()
			 .flatMap(t -> Arrays.stream(t.split(" ")))
			 .forEach(p -> System.out.println(p));
		
		List<String> list2 = Arrays.asList("10,20,30","40,50");
		
		int result =
			 list2.stream()
			  	  .flatMap(t -> { 
				 				String[] ss = t.split(",");
				 				int[] intArr = new int[ss.length];
				 				for(int i=0; i<ss.length; i++) {
				 					intArr[i] = Integer.parseInt(ss[i].trim());
				 				}
					 	  return Arrays.stream(intArr);
			 				})
			  	.sum();
		
		System.out.println(result);
		
		
		
		
	}
}

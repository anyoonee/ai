package javaApp1.ch12.sec02;

import java.util.Arrays;

public class StringEx {

	public static void main(String[] args) {
		// 520
		
		String data = "자바";
		byte[] arr1 = data.getBytes();
		System.out.println(arr1[1]);
		System.out.println(arr1.length); //한글 한글자는 2바트를 차지
		
		String str1 = Arrays.toString(arr1);
		System.out.println(str1);
		
		//StringBuilder클래스
		data = data + "java";
		System.out.println(data);
		StringBuilder sb = new StringBuilder();
		sb.append("자바");
		System.out.println(sb);
		sb.append("java");
		System.out.println(sb);
		sb.insert(0, "a"); // 0번 인덱스에 "a" 삽입
		System.out.println(sb);
		sb.delete(1, 3);
		System.out.println(sb);
		
	}

}

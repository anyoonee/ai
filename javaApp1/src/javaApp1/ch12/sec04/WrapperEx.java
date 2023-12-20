package javaApp1.ch12.sec04;

public class WrapperEx {

	public static void main(String[] args) {
		// 524쪽
		// 자료형 기본형 byte char int long boolean float double 참조형 
		// 기본형은 클래스가 아니므로 미리 만들어진 메소드가 없다. 그래스 기본형 자료형을 클래스 만들어 둔게 있다-포장클래스
		// 박싱 기본형 --> 객체, 언박싱 객체 --> 기본형
		Integer a =10;
		Integer a1 = new Integer(10);
		String as =a.toString(); //10  "10"
		
		
		double da = a.doubleValue();
		System.out.println(da);
		System.out.println(a.MAX_VALUE);
		System.out.println(a.MIN_VALUE);
		
		
		//3.14 "3.14"
		Double b =3.14;
		
		//double형의 최대값은?
		System.out.println(b.MAX_VALUE);
		//double형의 사이즈?
		System.out.println(b.SIZE);
		//10.1, 5.4 최대값 출력하기
		System.out.println(b.max(10.1, 5.4));
	}

}

package javaApp3.ch13.sec01;

public class GenericEx01 {
	//제한된 타입 피라미터를 갖는 제네릭 메소드
	public static <T extends Number> boolean compare(T t1, T t2) {
				 //T대체타입 Number로 제한
		//T의 타입출력
		System.out.println("campare(" + t1.getClass().getSimpleName() + "," + t2.getClass().getSimpleName() + ")");
		
		
		
		
		//Number의 메소드 사용
		double v1 = t1.doubleValue(); //Number타입의 doubleValue()메소드 호출
		double v2 = t2.doubleValue();
		
		return (v1 == v2);
	}
	
	public static void main(String[] args) {
		//제네릭 메소드 호출
		boolean result1 = compare(10,20); //T를 Integer로 대체
		System.out.println(result1);
		System.out.println();
		
		boolean result2 = compare(4.5,4.5); //T를 Double로 대체
		System.out.println(result2);
		System.out.println();
		
		boolean result3 = compare(4.5f,4.5f); 
		System.out.println(result3);
		System.out.println();
		
		boolean result4 = compare(100L,890L); 
		System.out.println(result4);
		System.out.println();
		
//		boolean result5 = compare("A","b"); 
//		System.out.println(result5);
//		System.out.println();
	}
}

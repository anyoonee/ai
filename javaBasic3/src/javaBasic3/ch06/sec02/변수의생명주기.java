package javaBasic3.ch06.sec02;

public class 변수의생명주기 {

	
	int c=10; // 전 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int a=10; // 변수 태어나기 생성 main() 안에서만 사용가능. 생성된 곳의 {} 안에서만 사용가능.
        //System.out.println(c);
        
        for (int i =0; i<10; i++) {
        	int j=8;
        	System.out.println(i);
        }
       // System.out.println(i); // i for문을 벗어남
	}

	void method01() {
		int b=20;
		//System.out.println(a); //변수가 선언되지 않았다(에러)
	}
	void method02() {
		//System.out.println(b);
		System.out.println(c);
	}
	
	
}

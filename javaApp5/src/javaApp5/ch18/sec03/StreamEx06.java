package javaApp5.ch18.sec03;

import java.util.Arrays;

public class StreamEx06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] intArr = {2,4,6};
		
		Arrays.stream(intArr);
			  .allMatch(i->i%2==0)
			  .forEach(n->syso)
		
	}

}

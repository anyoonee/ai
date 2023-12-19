package javaApp1;

import java.lang.module.ModuleDescriptor;
import java.util.Date;
import java.util.Scanner;

public class App1Ex {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		String a = "abcde";
		int aHashCode = a.hashCode();
		System.out.println(aHashCode);
		double pi = Math.PI;
		System.out.println(pi);
		double e = Math.E;
		System.out.println(e);
		double cos45 = Math.cos(45.0);
		System.out.println(cos45);
		
		Date date = new Date();
		int date1 = date.getDate();
		System.out.println(date1);
		
		
		
	//	ModuleDescriptor md = new ModuleDescriptor();
		

	}

}

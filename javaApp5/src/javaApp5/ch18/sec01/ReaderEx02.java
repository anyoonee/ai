package javaApp5.ch18.sec01;

import java.io.*;

public class ReaderEx02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			char[] cArr = new char[100];
			Reader r = new FileReader("D:\\ai\\study\\java_study\\data\\test2.txt");
			while(true) {
				int data = r.read();
				if(data==-1) break;
				for(int i=0; i<data;i++) {
				System.out.println((char) data);
				}
			}
			
			Writer w = new FileWriter("D:\\ai\\study\\java_study\\data\\test4.txt");
			
			w.write("abcdef");
			w.write(65);  //유니코드로 대문자 A = 65
			w.write(cArr);
			w.write(800);
			
			w.flush();
			w.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package javaApp5.ch18.sec01;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class ReaderEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			InputStream is = new FileInputStream("D:\\ai\\study\\java_study\\data\\다운로드.jpg");
			OutputStream os = new FileOutputStream("D:\\ai\\study\\java_study\\data\\다운로드.jpg");
			
			while (true) {
				int data = is.read();
				if(data== -1)break;
					os.write(data);
			}
			os.flush();
			os.close();			
			is.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

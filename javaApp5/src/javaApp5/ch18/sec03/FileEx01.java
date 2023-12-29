package javaApp5.ch18.sec03;

import java.io.File;
import java.io.IOException;

public class FileEx01 {

	public static void main(String[] args) throws IOException {
		// 813
		File dir = new File("D:/ai/study/java_study/data/abc/def");
		File file1 = new File("D:/ai/study/java_study/data/file1.txt");
		File file2 = new File("D:/ai/study/java_study/data/file1.txt");
		File file3 = new File("D:/ai/study/java_study/data/file1.txt");
		
		if(dir.exists() == false) {dir.mkdir();} // 해당 경로에 없는 폴더(디렉터리)를 모두 만들어 준다.
		if(file1.exists() == false) {file1.createNewFile();}
		

	}

}

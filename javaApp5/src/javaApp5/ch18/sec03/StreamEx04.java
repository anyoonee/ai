package javaApp5.ch18.sec03;

import java.util.*;

public class StreamEx04 {

	public static void main(String[] args) {
		// 744 요소 정렬하기
		
		
		List<Student> sList =  new ArrayList<Student>();
		sList.add(new Student("홍길동",30));
		sList.add(new Student("신용권",10));
		sList.add(new Student("유미선",20));
		
		// 요구사항 점수를 기준으로 오름차순으로 정렬한 스트림 얻기
		sList.stream()
			 .sorted(new StudentCom())
			 .forEach(p->System.out.println(p.getName() + " " + p.getScore())); // 정렬이되서 출력
		
		
		
	}

}
class StudentCom implements Comparator<Student>{

	@Override
	public int compare(Student o1, Student o2) {
		// TODO Auto-generated method stub
		Integer o1S = Integer.valueOf(o1.getScore());
		Integer o2S = Integer.valueOf(o2.getScore());
		
		return o1.getScore();
	}
	
}


class Student  {
	private String name;
	private int score;
	
	
	public Student(String name, int score) {
		super();
		this.name = name;
		this.score = score;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	
}

	
	
	
	
	

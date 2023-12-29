package javaApp5.ch17.sec01;

import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamEx02 {

	public static void main(String[] args) throws Exception {
		// 1단계 컬렉션, 배열을 스트림으로 만든 방법
		
		List<Product> list = new ArrayList<Product>();
		
		// 자료넣기
		for(int i=1; i<=5; i++) {
			Product product = new Product(i, "상품" +i,"멋진회사",(int)(10000*Math.random()));
			list.add(product);
		}
		
		//컬렉션 --> 스트림 만들기
		Stream<Product> stream = list.stream();
		stream.forEach(p -> System.out.println(p));
		
		//위에 코드를 줄인것
		list.stream()
			.forEach(p -> System.out.println(p));
		
		//배열을 스트림으로 만들기
		String[] strArr = {"홍길동" , "신용권","김미나"};
		Stream<String> streamStr = Arrays.stream(strArr); //배열이 오리지널 스트림으로 바뀐다.
		
		streamStr.filter(t -> t.startsWith("신"))
				 .forEach(p -> System.out.println(p + "장학금 대상"));
		
		// 숫자범위로 스트림 얻기
		// 요구사항 1~100까지 합을 구하기
		IntStream is = IntStream.range(1, 101); // 1<=   <100
		System.out.println(is.count()); // 최종스트림으로 오리지널 스트림 자료 소멸
			
		is = IntStream.range(1, 101);	// 다시 오리지널 스트림을 만들어주어야한다.
		System.out.println(is.max().toString());
		
		is = IntStream.range(1, 101);
		System.out.println(is.min().toString());
		
		//파일로부터 스트림 얻기
		Path path = Paths.get(StreamEx02.class.getResource("D:/ai/study/java_study/data/123.txt").toURI());
		//해당 경로의 파일을 스트림으로 바꿔줌.
		Stream<String> fileStream = Files.lines(path, Charset.defaultCharset());
		fileStream.forEach(p->System.out.println(p));
		fileStream.close();
	}

}

class Product {
	private int pno;
	private String name;
	private String company;
	private int price;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return pno + " " + name + " " + company + " " + price;
	}

	public Product(int pno, String name, String company, int price) {
		super();
		this.pno = pno;
		this.name = name;
		this.company = company;
		this.price = price;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}

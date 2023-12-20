package javaApp1.ch12.sec04;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.xml.stream.events.StartDocument;

public class DateTimeZoneCompareEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 특정날짜
		LocalDateTime StartDateTime = LocalDateTime.of(2023, 1, 1, 0, 0);
		LocalDateTime StopDateTime = LocalDateTime.of(2023, 12, 31, 0, 0);
		LocalDateTime eventDateTime = LocalDateTime.of(2023, 12, 31, 0, 0);
				
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd a HH:mm:ss");
		System.out.println("시작일 : " + StartDateTime.format(dtf));
		System.out.println("종료일 : " + StopDateTime.format(dtf));
		 
		if(StartDateTime.isAfter(StopDateTime)) {
			System.out.println("이벤트 진행중입니다.");
		}else if(eventDateTime.isEqual(StopDateTime)) {
			System.out.println("이벤트 오늘 마감합니다.");
		}else {
			System.out.println("이벤트 마감했습니다. 다음기회에");
		}
		
		//2023.12.20 12:00 ~ 12.25 11:59
		//이벤트 기간 세일 70%, 이벤트 마감일 세일 85%, 이벤트 종료
		
		LocalDateTime StartEvent = LocalDateTime.of(2023, 12, 20, 12, 0);
		LocalDateTime StopEvent = LocalDateTime.of(2023, 12, 25, 23, 59);
		LocalDateTime currentDate = LocalDateTime.now();
				
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd a HH:mm:ss");
		System.out.println("시작일 : " + StartEvent.format(dtf1));
		System.out.println("종료일 : " + StopEvent.format(dtf1));
		 
		if(currentDate.isBefore(StopEvent)&& currentDate.isAfter(StartEvent)) {
			System.out.println("이벤트 기간으로 70% 세일 중 입니다.");
		}else if(currentDate.isEqual(StopEvent)) {
			System.out.println("이벤트 마감일 85% 세일 중 입니다.");
		}else {
			System.out.println("이벤트 종료했습니다.");
		}
		
	}

}

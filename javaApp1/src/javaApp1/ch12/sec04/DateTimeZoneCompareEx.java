package javaApp1.ch12.sec04;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.xml.stream.events.StartDocument;

public class DateTimeZoneCompareEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Ư����¥
		LocalDateTime StartDateTime = LocalDateTime.of(2023, 1, 1, 0, 0);
		LocalDateTime StopDateTime = LocalDateTime.of(2023, 12, 31, 0, 0);
		LocalDateTime eventDateTime = LocalDateTime.of(2023, 12, 31, 0, 0);
				
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd a HH:mm:ss");
		System.out.println("������ : " + StartDateTime.format(dtf));
		System.out.println("������ : " + StopDateTime.format(dtf));
		 
		if(StartDateTime.isAfter(StopDateTime)) {
			System.out.println("�̺�Ʈ �������Դϴ�.");
		}else if(eventDateTime.isEqual(StopDateTime)) {
			System.out.println("�̺�Ʈ ���� �����մϴ�.");
		}else {
			System.out.println("�̺�Ʈ �����߽��ϴ�. ������ȸ��");
		}
		
		//2023.12.20 12:00 ~ 12.25 11:59
		//�̺�Ʈ �Ⱓ ���� 70%, �̺�Ʈ ������ ���� 85%, �̺�Ʈ ����
		
		LocalDateTime StartEvent = LocalDateTime.of(2023, 12, 20, 12, 0);
		LocalDateTime StopEvent = LocalDateTime.of(2023, 12, 25, 23, 59);
		LocalDateTime currentDate = LocalDateTime.now();
				
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd a HH:mm:ss");
		System.out.println("������ : " + StartEvent.format(dtf1));
		System.out.println("������ : " + StopEvent.format(dtf1));
		 
		if(currentDate.isBefore(StopEvent)&& currentDate.isAfter(StartEvent)) {
			System.out.println("�̺�Ʈ �Ⱓ���� 70% ���� �� �Դϴ�.");
		}else if(currentDate.isEqual(StopEvent)) {
			System.out.println("�̺�Ʈ ������ 85% ���� �� �Դϴ�.");
		}else {
			System.out.println("�̺�Ʈ �����߽��ϴ�.");
		}
		
	}

}

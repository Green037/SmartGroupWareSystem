package com.cafe24.smart.util;

import java.text.SimpleDateFormat;
import java.util.Date;

//날짜 관련 반환하는 클래스
public class UtilDate {
	
	//월급 날짜 리턴
	public String getPaymentDate() {
		
		return (new SimpleDateFormat("yyyy-MM")).format(new Date()) + "-25";
	}
	
	//현재 연도 리턴
	public String getCurrentYear() {
		
		return (new SimpleDateFormat("yyyy")).format(new Date());
	}
	
	//현재 연도 + 월 리턴
	public String getCurrentYearMonth() {
		
		return (new SimpleDateFormat("yyyy-MM")).format(new Date());
	}
	
	//오늘 날짜 리턴
	public String getCurrentDate() {
		
		return (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
	}
	
	//오늘 날짜 + 시간 리턴
	public String getCurrentDateTime() {
			
		return (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date());
	}
	
	//Date 차 리턴
	public long getMinusDate(String beginDate, String endDate) {
		
		System.out.println("UtilDate getMinusDate beginDate : " + beginDate + ", endDate : " + endDate);
		
		long minusDate = 0;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		try {
			Date begin = sdf.parse(beginDate);
			Date end = sdf.parse(endDate);
			
			minusDate = (end.getTime() - begin.getTime()) / (24 * 60 * 60 * 1000);
			
			System.out.println("UtilDate getMinusDate minusDate : " + minusDate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return minusDate;
	}
	
	//Datetime 차 리턴
	public long getMinusDateTime(String beginDate, String endDate) {
		
		System.out.println("UtilDate getMinusDate beginDate : " + beginDate + ", endDate : " + endDate);
		
		long minusDate = 0;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		
		try {
			Date begin = sdf.parse(beginDate);
			Date end = sdf.parse(endDate);
			
			minusDate = (end.getTime() - begin.getTime()) / (24 * 60 * 60 * 1000);
			
			System.out.println("UtilDate getMinusDate minusDate : " + minusDate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return minusDate;
	}
}
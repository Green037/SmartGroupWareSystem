package com.cafe24.smart.util;

public class UtilMember {
//	부서 구하기
	public String getDpName(int dpCode) {
		
		String str = "";
		
		switch (dpCode) {
			case 1 : 
				str = "인사";
				break;
			case 2 : 
				str = "홍보";				
				break;
			case 3 :
				str = "모바일 개발";				
				break;
			case 4 : 
				str = "웹개발";				
				break;
			case 5 : 
				str = "보안";
		}
		
		System.out.println("UtilMember getDpName str : " + str);
		
		return str;
	}
	
//	직급 구하기
	public String getPtName(int ptCode) {
		
		String str = "";
		
		switch (ptCode) {
			case 1 :
				str = "사원";				
				break;
			case 2 :
				str = "대리";				
				break;
			case 3 :
				str = "팀장";				
				break;
			case 4 :
				str = "부장";				
				break;
			case 5 :
				str = "사장";
		}
		
		System.out.println("UtilMember getPtName str : " + str);
		
		return str;
	}
}
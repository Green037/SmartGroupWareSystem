package com.cafe24.smart.util;

public class UtilMember {
	public String getDpName(int dpCode) {
		
		String str = "";
		
		switch (dpCode) {
			case 1 : 
				str = "인사";
			case 2 : 
				str = "홍보";
			case 3 :
				str = "모바일 개발";
			case 4 : 
				str = "웹개발";
			case 5 : 
				str = "보안";
		}
		
		System.out.println("UtilMember getDpName str : " + str);;
		
		return str;
	}
}
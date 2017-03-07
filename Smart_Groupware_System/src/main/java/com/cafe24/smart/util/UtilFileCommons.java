package com.cafe24.smart.util;

import java.util.UUID;

public class UtilFileCommons {
//	서버에 저장된 파일명(최대 32글자)을 랜덤 숫자로 만들어 반환 (보안)
	public static String getRandomString() {
		
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
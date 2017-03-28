package com.cafe24.smart;


import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;

import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.service.MemberService;

@RestController
public class HomeRestController {
	private static final Logger log = LoggerFactory.getLogger(HomeRestController.class);
	
	@Autowired
	MemberService memberService;
	
//	로그인 체크
	@RequestMapping(value = "mm/loginRSA", method = RequestMethod.POST)
	@ResponseBody
//	암호화된 키들을 다시 복호화 하여 DB 값들과 비교 => 있으면 로그인
	public Map<String, Object> mmLoginRSACtrl(HttpServletRequest request, Map<String, Object> map) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String mmCode = request.getParameter("secondMmCode");
		String mmPassword = request.getParameter("secondMmPassword");
		
		HttpSession session = request.getSession();
		
//		로그인 전에 세션에 저장했던 개인키를 getAttribute
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");
		
		System.out.println("HomeRestController mmLoginRSACtrl privateKey : " + privateKey);
		
//		개인키(아이디)가 들어오지 않은 경우
		if (privateKey == null) {
			params.put("state", false);
//		개인키(아이디)가 들어온 경우
		} else {
			try {
//				암호화 처리된 사용자 계정을 복호화 처리
				int _mmCode = Integer.parseInt(decryptRsa(privateKey, mmCode));
				int _mmPassword = Integer.parseInt(decryptRsa(privateKey, mmPassword));
					
				Member member = new Member();
				Department department = new Department();
				member.setMmCode(_mmCode);
				
//				복호화한 사원코드로 값을 가져와서 DB의 사원 패스워드와 같은지 비교
				params = memberService.mmLoginServ(member);
				
				System.out.println("HomeRestController mmLoginRSACtrl _mmCode : " + _mmCode);
				System.out.println("HomeRestController mmLoginRSACtrl _mmPassword : " + _mmPassword);
				
				if(params != null){
					System.out.println("mmLoginRSACtrl params not null");
					
					session.setAttribute("mmCode", _mmCode);
//					session.setAttribute("mmName", params.get("mmName"));
					
					member = memberService.mmContentByMmCodeServ(_mmCode);
					session.setAttribute("mmName", member.getMmName());
					
					//부서정보세팅
					department = memberService.mmDpDetailServ(member.getDpCode());
					session.setAttribute("dpName", department.getDpName());
				}
				
				System.out.println("mmLoginRSACtrl mmCode session : " + session.getAttribute("mmCode"));
				System.out.println("mmLoginRSACtrl mmCode session : " + session.getAttribute("mmName"));
				
				params.put("state", true);
			} catch (Exception e) {
				params.put("state", false);
				
				e.printStackTrace();
			}
		}
		
		System.out.println("HomeRestController mmLoginRSACtrl params : " + params);
		
		return params;
	}
	
	public String decryptRsa(PrivateKey privateKey, String securedValue) {
		
		String decryptedValue = "";
		
		System.out.println("mmLoginRSACtrl decryptRsa privateKey : " + privateKey);
		System.out.println("mmLoginRSACtrl decryptRsa securedValue : " + securedValue);
		 
		 try{
			Cipher cipher = Cipher.getInstance("RSA");
		   
//			 암호화 된 값 : byte 배열
//			 				이를 문자열 form으로 전송하기 위해 16진 문자열(hex)로 변경 
//							서버측에서도 값을 받을 때 hex 문자열을 받아 다시 byte 배열로 바꾼 뒤 복호화 과정을 수행
			byte[] encryptedBytes = hexToByteArray(securedValue);
			
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			
			// 문자 인코딩
			decryptedValue = new String(decryptedBytes, "utf-8");
		 } catch(Exception e) {
			e.printStackTrace();
		 }
		 
		 System.out.println("mmLoginRSACtrl decryptRsa decryptedValue : " + decryptedValue);
		
		 return decryptedValue;
	}
	 
//	 16진 문자열을 byte 배열로 변환
	public static byte[] hexToByteArray(String hex) {
		
		if (hex == null || hex.length() % 2 != 0) {	
			return new byte[]{};
		}
	 
		byte[] bytes = new byte[hex.length() / 2];
		
		System.out.println("mmLoginRSACtrl hexToByteArray bytes : " + bytes);
		
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
			
			bytes[(int) Math.floor(i / 2)] = value;
		}
		
		System.out.println("mmLoginRSACtrl hexToByteArray final bytes : " + bytes);
		
		return bytes;
	}
}
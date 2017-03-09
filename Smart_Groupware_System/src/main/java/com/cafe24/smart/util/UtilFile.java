package com.cafe24.smart.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.reward.domain.Reward;

@Component
public class UtilFile {
//	프로젝트 내 지정된 경로에 파일을 저장하는 메소드
	public String fileUpload(MultipartHttpServletRequest request,
										MultipartFile uploadFile, Object obj) {
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = getSaveLocation(request, obj);
			
			System.out.println("UtilFile fileUpload fileName : " + fileName);
			System.out.println("UtilFile fileUpload uploadPath : " + path);
			
			File file = new File(path);
			
//			파일명이 중복으로 존재할 경우
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
//					파일명 뒤에 업로드 시간 초단위로 붙여서 중복 방지
					fileName = fileName + "_" + System.currentTimeMillis();
					
					file = new File(path + fileName);
				}
			}
			
			System.out.println("UtilFile fileUpload final fileName : " + fileName);
			System.out.println("UtilFile fileUpload file : " + file);
			
			out = new FileOutputStream(file);
			
			System.out.println("UtilFile fileUpload out : " + out);
			
			out.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return path + fileName;
	}
	
//	업로드 파일 저장 경로 얻는 메소드
	private String getSaveLocation(MultipartHttpServletRequest request, Object obj) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/files/";
		
//		Reward인 경우
		if (obj instanceof Reward) {
			attachPath += "reward/";
//		Approval인 경우
		} else {
			attachPath += "approval/";
		}
		
		System.out.println("UtilFile getSaveLocation path : " + uploadPath + attachPath);
		
		return uploadPath + attachPath;
	}
}
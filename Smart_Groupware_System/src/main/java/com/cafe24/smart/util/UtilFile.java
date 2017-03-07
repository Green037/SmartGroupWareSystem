package com.cafe24.smart.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.reward.domain.Reward;

@Component("utilFile")
public class UtilFile {
//	파일 정보 리플랙션 하여 업로드
	public List<Object> parseInsertFileInfo(Object obj, HttpServletRequest request)
																			throws Exception {
		
		System.out.println("UtilFile parseInsertFileInfo object : " + obj);
		
		String filePath = request.getContextPath();
		
		List<Object> list = new ArrayList<Object>();
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		if (obj instanceof Reward) {
			filePath += "";
//		obj 타입이 approval일 때
		} else {
			filePath += "2";
		}
		
//		String fileIdx = obj
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
//		File file = new File(FILEPATH);
		
		
//		if (file.exists() == false) {
//			file.mkdirs();
//		}
		
		while(iterator.hasNext()) {
			multipartHttpServletRequest.getFile(iterator.next());
			
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = UtilFileCommons.getRandomString() + originalFileExtension;
			
				System.out.println("UtilFile parseInsertFileInfo originalFileName : " + originalFileName);
				System.out.println("UtilFile parseInsertFileInfo originalFileExtension : " + originalFileExtension);
				System.out.println("UtilFile parseInsertFileInfo storedFileName : " + storedFileName);
				
//				file = new File(FILEPATH + storedFileName);
//				
//				multipartFile.transferTo(file);
//				
//				listMap.put("BOARD_IDX", value);
//				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
//				listMap.put("STORED_FILE_NAME", storedFileName);
//				listMap.put("FILE_SIZE", multipartFile.getSize());
//				
//				System.out.println("UtilFile parseInsertFileInfo listMap : " + listMap);
//				
//				list.add(listMap);
			}
		}
		
		return list;
	}
}
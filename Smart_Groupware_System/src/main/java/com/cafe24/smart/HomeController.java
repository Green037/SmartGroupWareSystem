package com.cafe24.smart;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	final static Logger log = LoggerFactory.getLogger(HomeController.class);

	/**
	 * @author GREEN GO
	 * @since 2017.03.14
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeCtrl(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception, NoSuchAlgorithmException {

		session = request.getSession();

		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");

		generator.initialize(1024);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		// RSA 개인키
		session.setAttribute("_RSA_WEB_Key_", privateKey);

		log.debug("HomeController _RSA_WEB_Key_ : " + request.getAttribute("setAttribute"));

		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		// 로그인 폼 hidden setting
		request.setAttribute("RSAModulus", publicKeyModulus);
		// 로그인 폼 hidden setting
		request.setAttribute("RSAExponent", publicKeyExponent);

		log.debug("HomeController RSAModulus getAttribute : " + request.getAttribute("RSAModulus"));
		log.debug("HomeController RSAExponent getAttribute : " + request.getAttribute("RSAExponent"));

		return "member/mm_login";
	}

	// 로그인 후 home
	@RequestMapping(value = "/member/mm_login", method = RequestMethod.GET)
	public String mmLoginCtrl() {

		return "main";
	}

	// 메인화면 연결: 윤재호
	@RequestMapping(value = "/main/mainIndex", method = RequestMethod.GET)
	public String mainIndexCtrl() {

		return "mainIndex";
	}

	// 로그 아웃 세션 종료
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String mmLogoutCtrl(HttpSession session) {

		session.invalidate();

		log.debug("-------- 로그아웃  세션 종료 --------");

		return "redirect:/";
	}

	// 페이징
	@RequestMapping(value = "/smart/paging", method = RequestMethod.GET)
	public String PagingCtrl() {

		return "paging";
	}
}
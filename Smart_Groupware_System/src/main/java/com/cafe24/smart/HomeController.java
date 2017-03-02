package com.cafe24.smart;

import java.util.Locale;

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		log.info("home is called ...");
		
<<<<<<< HEAD
		session.setAttribute("id", 2);
		session.setAttribute("password", 123456);
=======
		/*session.setAttribute("id", 8);
		session.setAttribute("password", 123456);*/
>>>>>>> 6b57acdb43c5e6a34de055f1d3b8f510b84f76a6
		
		return "home";
	}	
}																																																																																				
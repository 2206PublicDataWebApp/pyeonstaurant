package com.kh.pyeonstaurant;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pyeonstaurant.member.domain.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale
			, Model model
			,HttpSession session
			,HttpServletRequest request) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		session = request.getSession();
		Boolean adminCheck = (Boolean)session.getAttribute("adminCheck");
		Member loginUser = (Member)session.getAttribute("loginUser");
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("adminCheck", adminCheck);
		return "home";
	}
}
package com.kh.pyeonstaurant.member.controller;


import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.member.service.MemberService;
import com.kh.pyeonstaurant.member.service.logic.MemberServiceImpl;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	// 비로그인 상태일 때 로그인, 회원가입 창으로 이동
	@RequestMapping(value="/member/joinView.kh", method=RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/join";
		// /WEB-INF/views/member/join.jsp
	}
	
	// 로그인 상태일 때 마이페이지 창으로 이동
	@RequestMapping(value="/member/myPageView.kh", method=RequestMethod.GET)
	public String memberMyPageView(Model model) {
		return "member/myPage";
		// /WEB-INF/views/member/join.jsp
	}
	
	// 로그인 기능
	@RequestMapping(value="/member/login.kh", method=RequestMethod.POST)
	public ModelAndView memberLogin(
			@ModelAttribute Member member
			, ModelAndView mv
			, HttpServletRequest request) {
		try {
			Member loginUser = mService.loginMember(member);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}else {
				mv.addObject("msg", "회원정보를 찾을 수 없습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회원가입 기능
	@RequestMapping(value="/member/register.kh", method=RequestMethod.POST)
	public ModelAndView memberJoin(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.registerMember(member);
			if(result > 0) {
				mv.setViewName("member/congratulations");
			}else {
				mv.addObject("msg", "회원가입을 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	@Autowired
	private JavaMailSender mailSender;
	@ResponseBody
	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "cji3604@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
 
	}
	

}
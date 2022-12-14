package com.kh.pyeonstaurant.member.controller;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.member.service.MemberService;
import com.kh.pyeonstaurant.member.service.logic.MemberServiceImpl;
import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	// 비로그인 상태일 때 로그인, 회원가입 창으로 이동
	@RequestMapping(value="/member/joinView.kh", method=RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/join";
	}
	
	// 로그인 상태일 때 마이페이지 창으로 이동
	@RequestMapping(value="/member/myPageView.kh", method=RequestMethod.GET)
	public String memberMyPageView(Model model) {
		
		return "member/myPage";
	}
	
	// 회원 정보 수정 창으로 이동
	@RequestMapping(value="/member/myPageModifyView.kh", method=RequestMethod.GET)
	public String memberMyPageModifyView(Model model) {
		return "redirect:/member/myPage.kh";
	}
	
	
	// 로그인 기능
	   @RequestMapping(value="/member/login.kh", method=RequestMethod.POST)
	   public ModelAndView memberLogin(
	         @ModelAttribute Member member
	         , ModelAndView mv
	         , HttpServletRequest request
	         , HttpSession session) {
	      try {
	         Member loginUser = mService.loginMember(member);   //이메일 저장됨
	         session = request.getSession();
	         session.setAttribute("loginUser", loginUser);            	         
	         if(loginUser != null) {
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
				mv.setViewName("redirect:/");
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
	
	
	// 회원정보 상세 조회
	@RequestMapping(value="/member/myPage.kh", method=RequestMethod.GET)
	public ModelAndView showMyPage(HttpServletRequest request
			, ModelAndView mv, HttpSession session) {
		try {
			Member member = (Member)session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			
			Member mOne = mService.printOneByEmail(memberEmail);
			int recipeCount = mService.countRecipeByEmail(memberEmail);
			int commentCount = mService.countCommentByEmail(memberEmail);
	
			mv.addObject("member", mOne);
			mv.addObject("recipeCount",recipeCount);
			mv.addObject("commentCount",commentCount);
			mv.setViewName("member/myPage");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 닉네임 수정
	@RequestMapping(value="/member/modifyNickname.kh", method=RequestMethod.POST)
	public ModelAndView modifyMemberNickname(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberNickname(member);
			if(result > 0) {
				mv.setViewName("redirect:/");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 비밀번호 수정
	@RequestMapping(value="/member/modifyPwd.kh", method=RequestMethod.POST)
	public ModelAndView modifyMemberPwd(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberPwd(member);
			if(result > 0) {
				mv.setViewName("redirect:/");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 로그아웃
	@RequestMapping(value="/member/logout.kh", method=RequestMethod.GET)
	public ModelAndView memberLogout(
			HttpServletRequest request
			, ModelAndView mv) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	//회원 탈퇴 기능 구현 중
	@RequestMapping(value="/member/remove.kh", method=RequestMethod.GET)
	public ModelAndView removeMember(HttpSession session
//			, Model model
			, ModelAndView mv) {
		try {
			Member member = (Member)session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			int result = mService.removeMember(memberEmail);
			mv.setViewName("redirect:/member/logout.kh");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 내가 쓴 레시피 불러오기
	@RequestMapping(value="/member/callMyRecipe.kh",method = RequestMethod.GET)
	public ModelAndView callBoard(HttpSession session
			, ModelAndView mv) {
		try {
			Member member = (Member)session.getAttribute("loginUser");
			List<Recipe> rList = mService.selectRecipeNumber(member.getMemberEmail());
			mv.addObject("rList",rList);
			mv.setViewName("member/myPage_recipe");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 내가 쓴 댓글 불러오기 
	@RequestMapping(value="/member/callMyComment.kh",method = RequestMethod.GET)
	public ModelAndView callComment(HttpSession session
			, ModelAndView mv) {
		try {
			Member member = (Member)session.getAttribute("loginUser");
			List<RecipeComment> rcList = mService.selectCommentNumber(member.getMemberEmail());
			mv.addObject("rcList",rcList);
			mv.setViewName("member/myPage_comment");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 포인트 내역 불러오기
	@RequestMapping(value="/member/callPoint.kh",method = RequestMethod.GET)
	public ModelAndView callPoint(HttpSession session
			, ModelAndView mv) {
		try {
			Member member = (Member)session.getAttribute("loginUser");
			List<Point> pList = mService.selectPoint(member.getMemberEmail());
			mv.addObject("pList",pList);
			mv.setViewName("member/myPage_point");
			
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	// 비밀 번호 찾기 기능 구현 중
	/*@RequestMapping(value="/member/findPw.kh", method=RequestMethod.GET)
	public ModelAndView modifyMemberPwd(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberPwd(member);
			if(result > 0) {
				mv.setViewName("redirect:/");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}*/
}


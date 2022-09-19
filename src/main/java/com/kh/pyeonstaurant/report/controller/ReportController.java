package com.kh.pyeonstaurant.report.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.report.domain.Report;
import com.kh.pyeonstaurant.report.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;
	
	@RequestMapping(value="/report/reportView", method=RequestMethod.GET)
	public String reportView() {
		return "admin/reportView";
	}
	
	@RequestMapping(value="/report/add", method=RequestMethod.POST)
	public ModelAndView addReportRecipe(ModelAndView mv
			, HttpSession session
			, @RequestParam("recipeNo") int recipeNo
			, @ModelAttribute Report report
			,HttpServletRequest request
			) {
		try {
			session = request.getSession();
			Report email = (Report)session.getAttribute("memberEmail");
			String memberEmail = email.getMemberEmail();	//신고자 이메일
			report.setMemberEmail(memberEmail);
			report.setRecipeNo(recipeNo);
			int result = rService.addReportRecipe(report);
			if(result > 0) {
				mv.setViewName("redirect:/레시피 상세페이지");
			}
		}catch(Exception e) {
			
		}
		return mv;	
	}
	
	@RequestMapping(value="/report/addComment", method=RequestMethod.POST)
	public ModelAndView addReportComment(ModelAndView mv
			, HttpSession session
			, @RequestParam("commentNo") int commentNo
			, @ModelAttribute Report report
			,HttpServletRequest request
			) {
		try {
			session = request.getSession();
			Report email = (Report)session.getAttribute("memberEmail");
			String memberEmail = email.getMemberEmail();	//신고자 이메일
			report.setMemberEmail(memberEmail);
			report.setRecipeNo(commentNo);
			int result = rService.addReportComment(report);
			if(result > 0) {
				mv.setViewName("redirect:/레시피 상세페이지");
			}
		}catch(Exception e) {
			
		}
		return mv;	
	}
	
	@RequestMapping(value="/report/reportRecipe", method=RequestMethod.POST)
	public ModelAndView reportRecipeView(ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required=false) Integer page
			, @RequestParam("recipeNo") int recipeNo
			) {				
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService.getRecipeTotalCount(recipeNo);
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Report> rList = rService.reportRecipeView(currentPage, boardLimit, recipeNo);
		if(!rList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("rList", rList);
		}
		mv.setViewName("report/reportView");
		return mv;
		
	}
	
	@RequestMapping(value="/report/reportComment", method=RequestMethod.POST)
	public ModelAndView reportCommentView(ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required=false) Integer page
			, @RequestParam("commentNo") int commentNo
			) {				
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService.getCommentTotalCount(commentNo);
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Report> cList = rService.reportCommentView(currentPage, boardLimit, commentNo);
		if(!cList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("cList", cList);
		}
		mv.setViewName("report/reportView");
		return mv;
	}
	
	public ModelAndView successReportRecipe(ModelAndView mv
			, HttpSession session
			, @RequestParam("recipeNo") int recipeNo) {
			try {
				int result = rService.processedReportRecipe(recipeNo);
				if(result > 0) {
					mv.setViewName("report/reportView");
				}
			}catch(Exception e) {
				
			}
 				return mv;
		
	}
	
	public ModelAndView successReportComment(ModelAndView mv
			, HttpSession session
			, @RequestParam("commentNo") int commentNo) {
			try {
				int result = rService.processedReportComment(commentNo);
				if(result > 0) {
					mv.setViewName("report/reportView");
				}
			}catch(Exception e) {
				
			}
 				return mv;
		
	}
	
}

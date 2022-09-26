package com.kh.pyeonstaurant.report.controller;

import java.sql.Date;
import java.util.Iterator;
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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.pyeonstaurant.report.domain.Report;
import com.kh.pyeonstaurant.report.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;
	
	@RequestMapping(value="/report/reportAdmin", method=RequestMethod.GET)
	public ModelAndView reportView(
			ModelAndView mv
			, @RequestParam(value="page", required=false) Integer page
			, @RequestParam(value="page2", required=false) Integer page2) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService.getTotalReoprtCount();
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
		List<Report> rList = rService.reportAllView(currentPage, boardLimit);
		if(!rList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("rList", rList);
		}
		
		int currentPage2 = (page2 != null) ? page2 : 1;
		int totalCount2 = rService.getTotalCommentCount();
		int boardLimit2 = 10;
		int naviLimit2 = 5;
		int maxPage2;
		int startNavi2;
		int endNavi2;
		maxPage2 = (int)((double)totalCount2/boardLimit2 + 0.9);
		startNavi2 = ((int)((double)currentPage2/naviLimit2+0.9)-1)*naviLimit2+1;
		endNavi2 = startNavi2 + naviLimit2 - 1;
		if(maxPage2 < endNavi2) {
			endNavi2 = maxPage2;
		}
		List<Report> cList = rService.reportCommentAllView(currentPage2, boardLimit2);
		if(!rList.isEmpty()) {
			mv.addObject("maxPage2", maxPage2);
			mv.addObject("currentPage2", currentPage2);
			mv.addObject("startNavi2", startNavi2);
			mv.addObject("endNavi2", endNavi2);
			mv.addObject("cList", cList);
		}
		mv.setViewName("admin/reportView");
		return mv;
	}
	
	@RequestMapping(value="/report/add", method=RequestMethod.POST)
	public ModelAndView addReportRecipe(ModelAndView mv
			, HttpSession session
			, @ModelAttribute Report report
			,HttpServletRequest request
			) {
		try {
			session = request.getSession();
			Report email = (Report)session.getAttribute("memberEmail");
			String memberEmail = email.getMemberEmail();	//�Ű��� �̸���
			report.setMemberEmail(memberEmail);
			int result = rService.addReportRecipe(report);
			if(result > 0) {
				mv.setViewName("redirect:/������ ��������");
			}
		}catch(Exception e) {
			
		}
		return mv;	
	}
	
	@RequestMapping(value="/report/addComment", method=RequestMethod.POST)
	public ModelAndView addReportComment(ModelAndView mv
			, HttpSession session
			, @ModelAttribute Report report
			,HttpServletRequest request
			) {
		try {
			session = request.getSession();
			Report email = (Report)session.getAttribute("memberEmail");
			String memberEmail = email.getMemberEmail();	//�Ű��� �̸���
			report.setMemberEmail(memberEmail);
			int result = rService.addReportComment(report);
			if(result > 0) {
				mv.setViewName("redirect:/������ ��������");
			}
		}catch(Exception e) {
			
		}
		return mv;	
	}
	@RequestMapping(value="/report/successRecipe", method=RequestMethod.GET)
	public String successReportRecipe(@RequestParam("recipeNo") int recipeNo) {
		int result = rService.processedReportRecipe(recipeNo);
		return "redirect:/report/reportAdmin";

	}
	@RequestMapping(value="/report/successComment", method=RequestMethod.GET)
	public String successReportComment(@RequestParam("commentNo") int commentNo) {
		int result = rService.processedReportComment(commentNo);
		return "redirect:/report/reportAdmin";
	}
	
}

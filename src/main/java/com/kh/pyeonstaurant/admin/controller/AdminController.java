package com.kh.pyeonstaurant.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.admin.service.AdminService;




@Controller
public class AdminController {
	@Autowired
	private AdminService mService;

	
	@RequestMapping(value="/admin/boardList", method=RequestMethod.GET)
	public String listBoardAdmin() {
		return "admin/boardAdminView";
	}	
	
	//나중에 레시피 조회 합칠때 사용
//	@RequestMapping(value= {"/recipe/recipeList.do", "/board/boardList.do"} , method = RequestMethod.GET)
//	public ModelAndView RecipeList(ModelAndView mv) {
//		try {
//		List<Recipe> rList = rService.printRecipeList(0,0);
//		mv.addObject("rList", rList);
//		mv.setViewName("/recipe/recipeList");
//		mv.setViewName("/admin/boardAdminView");
//		}catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/error");
//		}
//		return mv;
//	}
	@RequestMapping(value="/admin/memberAdminList", method=RequestMethod.GET)
	public String listMemberAdmin() {
		return "admin/memberAdminView";
	}
	
	@RequestMapping(value="/admin/memberSearch", method=RequestMethod.POST)
	public ModelAndView searchMember(ModelAndView mv
			, HttpSession session
			, @RequestParam("memberInfo") String memberInfo
			, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = mService.getTotalCount(memberInfo);
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
			List mList = mService.searchMember(currentPage, boardLimit, memberInfo);
			
			if(!mList.isEmpty()) {
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("mList", mList);
			}
			mv.setViewName("admin/memberAdminView");
		return mv;		
	}
	
	@RequestMapping(value="/admin/removeMember")
	public String removeMember(ModelAndView mv
			, HttpSession session
			, @RequestParam("memberEmail") String memberEmail) {		
		int result = mService.removeOneByMember(memberEmail);

		return "redirect:/admin/memberAdminList";
		
	}
	
	@RequestMapping(value="/admin/point", method=RequestMethod.POST)
	public ModelAndView modifyPoint(ModelAndView mv, HttpSession session, @RequestParam("memberEmail") String memberEmail) {
		
		return mv;
		
	}
}

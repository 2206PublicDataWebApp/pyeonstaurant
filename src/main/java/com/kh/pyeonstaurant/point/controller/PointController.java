package com.kh.pyeonstaurant.point.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.point.service.PointService;


@Controller
public class PointController {

	@Autowired
	private PointService pService;
	
	
	// 포인트 내역 조회
	@RequestMapping(value="/point/point.kh", method=RequestMethod.GET)
	public ModelAndView pointListView(HttpServletRequest request,
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberEmail = member.getMemberEmail();
		int currentPage = (page != null) ? page : 1;
		int totalCount = pService.getTotalCount();
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		// 23/5 = 4.8 + 0.9 = 5(.7)
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}

		List<Point> bList = pService.printAllBoard(currentPage, boardLimit);
		if(!bList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("bList", bList);
		}
		mv.setViewName("board/listView");
		return mv;
	}
	
}

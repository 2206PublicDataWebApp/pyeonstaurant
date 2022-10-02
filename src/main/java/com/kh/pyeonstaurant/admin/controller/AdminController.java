package com.kh.pyeonstaurant.admin.controller;

import java.util.HashMap;
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

import com.kh.pyeonstaurant.admin.domain.Admin;
import com.kh.pyeonstaurant.admin.domain.Board;
import com.kh.pyeonstaurant.admin.service.AdminService;
import com.kh.pyeonstaurant.member.domain.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService mService;

	@RequestMapping(value = "/admin/chatBtn", method = RequestMethod.POST)
	public ModelAndView chattingOn(ModelAndView mv) {

		return mv;
	}

	@RequestMapping(value = "/admin/chattingList", method = RequestMethod.GET)
	public String increasePoint() {
		return "admin/chattingList";
	}

	@RequestMapping(value = "/admin/boardList", method = RequestMethod.GET)
	public ModelAndView listBoardAdmin(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			HttpSession session, HttpServletRequest request) {
		try {

			Member loginUser = (Member) session.getAttribute("loginUser");
			
			if (!loginUser.getAdminCheck()) {
				mv.addObject("msg", "관리자 아이디로만 로그인 가능");
				mv.setViewName("common/error");
				return mv;
			}

			int currentPage = (page != null) ? page : 1;
			int totalCount = mService.getAllBoardCount();
			int boardLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			// 23/5 = 4.8 + 0.9 = 5(.7)
			maxPage = (int) ((double) totalCount / boardLimit + 0.9);
			startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
			endNavi = startNavi + naviLimit - 1;
			if (maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Board> aList = mService.printAllBoard(currentPage, boardLimit);
			if (!aList.isEmpty()) {
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("aList", aList);

			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자 아이디로만 로그인 가능");
			mv.setViewName("common/error");
		}
		mv.setViewName("admin/boardAdminView");
		return mv;

	}

	@RequestMapping(value = "/admin/memberAdminList", method = RequestMethod.GET)
	public ModelAndView listMemberAdmin(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			HttpSession session, HttpServletRequest request) {

		Member loginUser = (Member) session.getAttribute("loginUser");
	
	
		if (!loginUser.getAdminCheck()) {
			mv.addObject("msg", "관리자 아이디로만 로그인 가능");
			mv.setViewName("common/error");
			return mv;
		}

		int currentPage = (page != null) ? page : 1;
		int totalCount = mService.getAllMemberCount();
		int memberLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		// 23/5 = 4.8 + 0.9 = 5(.7)
		maxPage = (int) ((double) totalCount / memberLimit + 0.9);
		startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (maxPage < endNavi) {
			endNavi = maxPage;
		}
		
		List<Admin> aList = mService.printAllMember(currentPage, memberLimit);
				if (!aList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("aList", aList);

		}
		mv.setViewName("admin/memberAdminView");
		return mv;
	}

	@RequestMapping(value = "/admin/memberSearch", method = RequestMethod.POST)
	public ModelAndView searchMember(ModelAndView mv, HttpSession session,
			@RequestParam("memberInfo") String memberInfo,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = mService.getTotalCount(memberInfo);
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int) ((double) totalCount / boardLimit + 0.9);
		startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (maxPage < endNavi) {
			endNavi = maxPage;
		}
		List mList = mService.searchMember(currentPage, boardLimit, memberInfo);

		if (!mList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("mList", mList);
		}
		mv.setViewName("admin/memberAdminView");
		return mv;
	}

	@RequestMapping(value = "/admin/removeMember")
	public String removeMember(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.removeOneByMember(memberEmail);

		return "redirect:/admin/memberAdminList";

	}

//	@RequestMapping(value="/admin/point", method=RequestMethod.POST)
//	public ModelAndView modifyPoint(ModelAndView mv, HttpSession session, @RequestParam("memberEmail") String memberEmail) {
//		
//		return mv;
//		
//	}

	@RequestMapping(value = "/admin/boardSearch", method = RequestMethod.GET)
	public ModelAndView searchBoard(ModelAndView mv, HttpSession session, @RequestParam("boardInfo") String boardInfo,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = mService.getTotalBoardCount(boardInfo);
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int) ((double) totalCount / boardLimit + 0.9);
		startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (maxPage < endNavi) {
			endNavi = maxPage;
		}
		List bList = mService.searchBoard(currentPage, boardLimit, boardInfo);

		if (!bList.isEmpty()) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("bList", bList);
		}
		mv.setViewName("admin/boardAdminView");
		return mv;
	}

	// ����Ʈ �κ�
	@RequestMapping(value = "/point/pointList", method = RequestMethod.GET)
	public ModelAndView pointList(ModelAndView mv, @ModelAttribute Admin admin,
			@RequestParam("memberEmail") String memberEmail) {
		List pList = mService.selectAllPoint(memberEmail);

		if (!pList.isEmpty()) {
			mv.addObject("pList", pList);
		}
		mv.setViewName("admin/point");
		return mv;

	}

	@RequestMapping(value = "/admin/increasePoint", method = RequestMethod.GET)
	public String increasePoint(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.addPoint(memberEmail);

		return "redirect:/point/pointList?memberEmail=" + memberEmail;

	}

	@RequestMapping(value = "/admin/decreasePoint", method = RequestMethod.GET)
	public String decreasePoint(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.decreasePoint(memberEmail);

		return "redirect:/point/pointList?memberEmail=" + memberEmail;

	}

	@RequestMapping(value = "/admin/resetPoint", method = RequestMethod.GET)
	public String resetPoint(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.resetPoint(memberEmail);

		return "redirect:/point/pointList?memberEmail=" + memberEmail;

	}

}

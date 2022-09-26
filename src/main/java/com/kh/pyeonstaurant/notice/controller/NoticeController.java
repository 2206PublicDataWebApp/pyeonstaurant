package com.kh.pyeonstaurant.notice.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.notice.domain.Notice;
import com.kh.pyeonstaurant.notice.service.NoticeService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value="/notice/writeView", method=RequestMethod.GET)
	public String shownoticeWrite() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/notice/regist", method=RequestMethod.POST)
	public ModelAndView registNotice(
			ModelAndView mv
			, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			//, @RequestParam("noticetitle") String noticeTitle
			//, @RequestParam("noticeContent") String noticeContent
			,HttpServletRequest request) {
		
		try {
			if(uploadFile!= null) {
				String noticeFilename = uploadFile.getOriginalFilename();
				///////////////////////////////////////////////////////////////////////////
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\buploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String noticeFileRename 
				= sdf.format(new Date(System.currentTimeMillis()))+"."
						+noticeFilename.substring(noticeFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}

				/////////////////////////////////////////////////////////////////////////////
				uploadFile.transferTo(new File(savePath+"\\"+noticeFileRename)); 

				String noticeFilepath = savePath+"\\"+noticeFileRename;
				notice.setNoticeFilename(noticeFilename);
				notice.setNoticeFileRename(noticeFileRename);
				notice.setNoticeFilepath(noticeFilepath);
				//notice.setNoticeTitle(noticeTitle);
				//notice.setNoticeContent(noticeContent);
			}
			int result = nService.registerNotice(notice);
			mv.setViewName("redirect:/notice/list");
		} catch (Exception e) {
			e.printStackTrace();
//			mv.addObject("msg", e.toString());
//			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/notice/list", method=RequestMethod.GET)
	public ModelAndView noticeListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page
			,HttpSession session
			,HttpServletRequest request) {
		/////////////////////////////////////////////////////////////////////////
		try {
			session = request.getSession();
			Boolean adminCheck = (Boolean)session.getAttribute("adminCheck");
			session.setAttribute("adminCheck", adminCheck);
			mv.addObject("adminCheck", adminCheck);
			int currentPage = (page != null) ? page : 1;
			int totalCount = nService.getTotalCount("","");
			int noticeLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			// 23/5 = 4.8 + 0.9 = 5(.7)
			maxPage = (int)((double)totalCount/noticeLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Notice> nList = nService.printAllNotice(currentPage, noticeLimit);
			if(!nList.isEmpty()) {
				mv.addObject("urlVal", "list");
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("nList", nList);
			}
		}catch(Exception e) {
			
		}
		
		
		//////////////////////////////////////////////////////////////////////////
		// /notice/list.kh?page=${currentPage }
		
		mv.setViewName("notice/listView");
		return mv;
	}
	
	@RequestMapping(value="/notice/search", method=RequestMethod.GET)
	public ModelAndView noticeSearchList(
			ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
				try {
					int currentPage = (page != null) ? page : 1;
					int totalCount = nService.getTotalCount(searchCondition, searchValue);
					int noticeLimit = 10;
					int naviLimit = 5;
					int maxPage;
					int startNavi;
					int endNavi;
					maxPage = (int)((double)totalCount/noticeLimit + 0.9);
					startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
					endNavi = startNavi + naviLimit - 1;
					if(maxPage < endNavi) {
						endNavi = maxPage;
					}
					List<Notice> nList = nService.printAllByValue(
							searchCondition, searchValue, currentPage, noticeLimit);
					if(!nList.isEmpty()) {
						mv.addObject("nList", nList);
					}else {
						mv.addObject("nList", null);
					}
					mv.addObject("urlVal", "search");
					mv.addObject("searchCondition", searchCondition);
					mv.addObject("searchValue", searchValue);
					mv.addObject("maxPage", maxPage);
					mv.addObject("currentPage", currentPage);
					mv.addObject("startNavi", startNavi);
					mv.addObject("endNavi", endNavi);
					mv.setViewName("notice/listView");
				}catch(Exception e) {
					e.printStackTrace();
				}
		return mv;
		
	}
	
	@ RequestMapping(value="/notice/remove", method=RequestMethod.GET)
	public String noticeRemove(
			HttpSession session
			, Model model
			, @RequestParam("page") Integer page) {
		try {
			int noticeNo = (int)session.getAttribute("noticeNo");
			int result = nService.removeOneByNo(noticeNo);
			if(result > 0) {
				session.removeAttribute("noticeNo");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/notice/list?page="+page;
	}

	
	@RequestMapping(value="/notice/detail", method=RequestMethod.GET)
	public ModelAndView detailNotice(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo
			, @RequestParam("page") Integer page
			, HttpSession session
			, HttpServletRequest request) {
		try {
			session = request.getSession();
			Boolean adminCheck = (Boolean)session.getAttribute("adminCheck");
			session.setAttribute("adminCheck", adminCheck);
			Notice notice = nService.printOneByNo(noticeNo);
			session.setAttribute("noticeNo", notice.getNoticeNo());
			mv.addObject("notice", notice);
			mv.addObject("adminCheck", adminCheck);
			mv.addObject("page", page);
			mv.setViewName("notice/detailView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
	}
	
	@RequestMapping(value="/notice/modifyView", method=RequestMethod.GET)
	public ModelAndView noticeModifyView(
			ModelAndView mv
			,@RequestParam("noticeNo") Integer noticeNo
			,@RequestParam("page") int page) {
		try {
			Notice notice = nService.printOneByNo(noticeNo);
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			mv.setViewName("notice/modifyView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="/notice/modify", method=RequestMethod.POST)
	public ModelAndView modifyNotice(
			@ModelAttribute Notice notice
			, ModelAndView mv
			,@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			,@RequestParam("page") Integer page
			,HttpServletRequest request) {
		try {
		
		if(reloadFile != null) {
			String noticeFilename = reloadFile.getOriginalFilename();
			// ����, 1. ��ü(replace) / 2. ���� �� ����
			// ���ϻ���
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savedPath = root + "\\buploadFiles";
			//notice bOne = bService.printOneByNo(notice.getnoticeNo());
			File file = new File(savedPath + "\\" + notice.getNoticeFileRename());
			if(file.exists()) {
				file.delete();
			}
			// ���� �ٽ� ����
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String noticeFileRename = sdf.format(new Date(System.currentTimeMillis()))
					+ "." + noticeFilename.substring(noticeFilename.lastIndexOf(".")+1);
			String noticeFilepath = savedPath + "\\" + noticeFileRename;
			reloadFile.transferTo(new File(noticeFilepath));
			notice.setNoticeFilename(noticeFilename);
			notice.setNoticeFileRename(noticeFileRename);
			notice.setNoticeFilepath(noticeFilepath);
		}
		int result = nService.modifynotice(notice);
		mv.setViewName("redirect:/notice/list?page="+page);
	}catch(Exception e) {
		e.printStackTrace();
	}
	return mv;
		
	}
}

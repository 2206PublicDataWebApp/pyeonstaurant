package com.kh.pyeonstaurant.notice.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
			,@RequestParam(value="page", required=false) Integer page) {
		/////////////////////////////////////////////////////////////////////////
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
		//////////////////////////////////////////////////////////////////////////
		// /notice/list.kh?page=${currentPage }
		List<Notice> nList = nService.printAllNotice(currentPage, noticeLimit);
		if(!nList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("nList", nList);
		}
		mv.setViewName("notice/listView");
		return mv;
	}
}

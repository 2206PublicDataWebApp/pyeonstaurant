
package com.kh.pyeonstaurant.qanda.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.qanda.domain.QAComment;
import com.kh.pyeonstaurant.qanda.service.QACommentService;


@Controller
public class QAComemnetController {

	@Autowired
	private QACommentService qcService;

	/**
	 * 댓글입력
	 * 
	 * @param mv
	 * @param qAComment
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/commentWrite.do", method = RequestMethod.POST)
	public ModelAndView registQAComment(ModelAndView mv, @ModelAttribute QAComment qAComment, HttpSession session) {
		// 나중에 세션으로 반드시 로그인 체크할것! 로그안 안되어있으면 오류메세지 로그인해주세요로 연결
		try {
			
//			로그인 유저용
//			if(session.getAttribute("loginUser")==null) {
//				mv.addObject("msg", "로그인한 유저만 작성가능합니다");
//				mv.setViewName("common/error");
//				return mv;
//				
//			}
			
			

			qAComment.setQaCommentNo(0);
			int result = qcService.registQAComment(qAComment);
			mv.setViewName("redirect:/qna/detail.do?qaNo=" + qAComment.getQaNo() + "#reply-area");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}

		return mv;

	}

	/**
	 * 댓글수정
	 * 
	 * @param mv
	 * @param qAComment
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/commentModify.do", method = RequestMethod.POST)
	public ModelAndView modifyQAComment(ModelAndView mv, @ModelAttribute QAComment qAComment, HttpSession session) {

		try {
			
			
			

			int result = qcService.modifyQAComment(qAComment);

			mv.setViewName("redirect:/qna/detail.do?qaNo=" + qAComment.getQaNo() + "#reply-area");
			
			
			//작성자 아니면 수정금지
//			if(!session.getAttribute("loginUser.memberEmail").equals(qAComment.getMemberEmail())||session.getAttribute("loginUser.adminCheck")==false) {
//				
//				mv.addObject("msg", "작성자만 수정할 수 있습니다");
//				mv.setViewName("common/error");
//				return mv;
//			}
			

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	/**
	 * 댓글삭제
	 * 
	 * @param session
	 * @param mv
	 * @param qaCommentNo
	 * @param memberEmail
	 * @return
	 */
	@RequestMapping(value = "/qna/removeComment.do", method = RequestMethod.GET)
	public ModelAndView removeQAComment(HttpSession session, ModelAndView mv,
			@RequestParam("qaCommentNo") Integer qaCommentNo,@RequestParam("qaNo") Integer qaNo,
			@RequestParam(value = "memberEmail", required = false) String memberEmail) {

		try {
			int result = qcService.reomoveOneQACommentNo(qaCommentNo);
			
			
			//작성자 아니면 삭제금지
//			if(!session.getAttribute("loginUser.memberEmail").equals(memberEmail)||session.getAttribute("loginUser.adminCheck")==false) {
//				
//				mv.addObject("msg", "작성자만 삭제할 수 있습니다");
//				mv.setViewName("common/error");
//				return mv;
//			}
			
			

			mv.setViewName("redirect:/qna/detail.do?qaNo=" + qaNo + "#reply-area");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}

		return mv;
	}
}


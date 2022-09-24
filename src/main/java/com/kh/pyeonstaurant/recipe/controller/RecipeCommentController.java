
package com.kh.pyeonstaurant.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.service.RecipeCommentService;


@Controller
public class RecipeCommentController {
	@Autowired
	RecipeCommentService rcService ;
/**
 * 코멘트 등록
 * @param mv
 * @param rComment
 * @param session
 * @return
 */
	@RequestMapping(value="/recipe/commentWrite.do", method=RequestMethod.POST)
	public ModelAndView registRecipeComment(ModelAndView mv,@ModelAttribute RecipeComment rComment,HttpSession session ) {
		//나중에 세션으로 반드시 로그인 체크할것! 로그안 안되어있으면 오류메세지 로그인해주세요로 연결
		try {
			
//			로그인 유저용
//			if(session.getAttribute("loginUser")==null) {
//				mv.addObject("msg", "로그인한 유저만 가능합니다");
//				mv.setViewName("common/error");
//				return mv;
//				
//			}
			
			
		
		int result = rcService.registRecipeComment(rComment);
		mv.setViewName("redirect:/recipe/detail.do?recipeNo="+rComment.getRecipeNo()+"#reply-area");
		
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 코멘트 수정
	 * @param mv
	 * @param rComment
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/recipe/commentModify.do")
	public ModelAndView modifyRecipeComment(ModelAndView mv,@ModelAttribute RecipeComment rComment,HttpSession  session) {
		
		try {
			
			
			//작성자 아니면 수정금지
//			if(!session.getAttribute("loginUser.memberEmail").equals(rComment.getMemberEmail())||session.getAttribute("loginUser.adminCheck")==false) {
//				
//				mv.addObject("msg", "작성자만 수정할 수 있습니다");
//				mv.setViewName("common/error");
//				return mv;
//			}
			
			
			
			int result = rcService.modifyOneRecipeComment(rComment);
			mv.setViewName("redirect:/recipe/detail.do?recipeNo="+rComment.getRecipeNo()+"#reply-area");
			
			}catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/error");
			}
			return mv;	
	}
	
	/**
	 * 코멘트 삭제
	 * @param session
	 * @param mv
	 * @param commentNo
	 * @param recipeNo
	 * @param memberEmail
	 * @return
	 */
	@RequestMapping(value="/recipe/removeComment.do", method=RequestMethod.GET)
	public ModelAndView removeRecipeComment( HttpSession session ,ModelAndView mv,@RequestParam("commentNo")Integer commentNo,@RequestParam("recipeNo")Integer recipeNo,
			@RequestParam(value="memberEmail", required = false)String memberEmail) {
		
		try {
			
			//작성자 아니면 삭제금지
//			if(!session.getAttribute("loginUser.memberEmail").equals(recipe.getMemberEmail())||session.getAttribute("loginUser.adminCheck")==false) {
//				
//				mv.addObject("msg", "작성자만 삭제할 수 있습니다");
//				mv.setViewName("common/error");
//				return mv;
//			}
			
			
			
		int result = rcService.removeOneRecipeComment(commentNo);
		mv.setViewName("redirect:/recipe/detail.do?recipeNo="+recipeNo+"#reply-area");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		
		return mv;
	}

}


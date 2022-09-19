package com.kh.pyeonstaurant.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.board.service.BoardService;
import com.kh.pyeonstaurant.recipe.domain.Recipe;


@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/admin/boardList", method=RequestMethod.GET)
	public String listBoardAdmin() {
		return "admin/boardAdminView";
	}	

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
}

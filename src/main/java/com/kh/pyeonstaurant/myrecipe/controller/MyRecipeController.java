package com.kh.pyeonstaurant.myrecipe.controller;

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

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.myrecipe.service.MyRecipeService;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

@Controller
public class MyRecipeController {
	@Autowired
	private MyRecipeService mService;

//	@RequestMapping(value="/myRecipe/remove", method=RequestMethod.GET)
//	public String removeMyRecipe(Model model, HttpSession session, HttpServletRequest request) {
//
//		try {
//			session = request.getSession();
//			MyRecipe member = (MyRecipe)session.getAttribute("memberEmail");
//			String memberEmail = member.getMemberId();
//			int result = mService.removeMyRecipe(recipeNo);
//			
//			if(result > 0) {
//				session.removeAttribute("recipeNo");
//			}
//			
//		}catch(Exception e) {
//			//			model.addAttribute("msg", e.toString());
//			//			return "common/errorPage";
//
//		}
//		return "redirect:/myrecipe/list";
//	}

	@RequestMapping(value="/myRecipe/add", method=RequestMethod.GET)
	public String addMyRecipe(
			 HttpSession session
			, @ModelAttribute MyRecipe myRecipe
			, @RequestParam("recipeNo") int recipeNo
			, @RequestParam("memberEmail") String memberEmail
			, @RequestParam("recipeName") String recipeName
			,HttpServletRequest request) {
		try {
//			session = request.getSession();
//			MyRecipe email = (MyRecipe)session.getAttribute("memberEmail");
//			String memberEmail = email.getMemberEmail();
			myRecipe.setMemberEmail(memberEmail);
			myRecipe.setRecipeNo(recipeNo);
			myRecipe.setRecipeName(recipeName);
			int result = mService.addMyRecipe(myRecipe);
			if(result > 0) {
				System.out.println("삽입 성공");
			}else {
				System.out.println("실패");
			}
		}catch(Exception e) {
			
		}
		return "redirect:/myRecipe/list";	
	}
	
	@RequestMapping(value="/myRecipe/list", method=RequestMethod.GET)
	public ModelAndView selectAllMyRecipe(ModelAndView mv
			, HttpSession session
			,HttpServletRequest request) {	
//		session = request.getSession();
//		MyRecipe myRecipe = (MyRecipe)session.getAttribute("memberEmail");
		String memberEmail = "user01@user.com";
		// 23/5 = 4.8 + 0.9 = 5(.7)
		List<Recipe> mList = mService.printMyRecipeList(memberEmail);
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
		}
		mv.setViewName("myrecipe/myRecipeList");
		return mv;
	}
	

	
}

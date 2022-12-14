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

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.myrecipe.service.MyRecipeService;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

@Controller
public class MyRecipeController {
	@Autowired
	private MyRecipeService mService;

	@RequestMapping(value="/myRecipe/remove", method=RequestMethod.GET)
	public String removeMyRecipe(HttpSession session, 
			HttpServletRequest request
			,@RequestParam("recipeNo") int recipeNo
			,@ModelAttribute MyRecipe myRecipe) {
			
		try {
			session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			myRecipe.setMemberEmail(memberEmail);
			myRecipe.setRecipeNo(recipeNo);
			int result = mService.removeMyRecipe(myRecipe);			
			if(result > 0) {
				System.out.println("삭제 성공");
			}
		}catch(Exception e) {
			//			model.addAttribute("msg", e.toString());
			//			return "common/errorPage";

		}
		return "redirect:/myRecipe/list";
	}

	@RequestMapping(value="/myRecipe/add", method=RequestMethod.GET)
	public String addMyRecipe(
			 HttpSession session
			, @ModelAttribute MyRecipe myRecipe
			, @RequestParam("recipeNo") int recipeNo
			, @RequestParam("recipeName") String recipeName
			, HttpServletRequest request) {
		try {
			session = request.getSession();
			Member email = (Member)session.getAttribute("loginUser");
			System.out.println(email);
			String memberEmail = email.getMemberEmail();
			System.out.println(memberEmail);
			myRecipe.setMemberEmail(memberEmail);
			myRecipe.setRecipeNo(recipeNo);
			myRecipe.setRecipeName(recipeName);
			System.out.println(myRecipe.toString());
			int result = mService.addMyRecipe(myRecipe);
			if(result > 0) {
				System.out.println("추가 성공");
			}

		}catch(Exception e) {
			
		}
		return "redirect:/myRecipe/list";	
	}
	
	@RequestMapping(value="/myRecipe/list", method=RequestMethod.GET)
	public ModelAndView selectAllMyRecipe(ModelAndView mv
			,HttpSession session
			,HttpServletRequest request) {	
		session = request.getSession();
		Member email = (Member)session.getAttribute("loginUser");
		String memberEmail = email.getMemberEmail();
//		String memberEmail = "user01@user.com";
		// 23/5 = 4.8 + 0.9 = 5(.7)
		try {
			List<Recipe> mList = mService.printMyRecipeList(memberEmail);
			if(!mList.isEmpty()) {
				mv.addObject("mList", mList);
			}
			mv.setViewName("myrecipe/myRecipeList");
		}catch(Exception e) {
			mv.addObject("msg", "장바구니가 비었습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	

	
}

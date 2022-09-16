package com.kh.pyeonstaurant.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeMaterial;
import com.kh.pyeonstaurant.recipe.domain.RecipeStep;
import com.kh.pyeonstaurant.recipe.domain.RecipeTag;
import com.kh.pyeonstaurant.recipe.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService rService;

	/**
	 * 레시피 등록 창 연결
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/recipe/writeView.do", method = RequestMethod.GET)
	public ModelAndView showRecipeWrite(ModelAndView mv, HttpSession session) {
		mv.setViewName("/recipe/recipeWirteForm");
		return mv;

	}

	/**
	 * 레시피 등록 컨트롤러
	 * @param recipe
	 * @param rStep
	 * @param rMaterial
	 * @param rTag
	 * @param mv
	 * @param mainPic
	 * @param detailPic1
	 * @param detailPic2
	 * @param detailPic3
	 * @param detailPic4
	 * @param detailPic5
	 * @param detailPic6
	 * @param detailPic7
	 * @param detailPic8
	 * @param detailPic9
	 * @param detailPic10
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/recipe/regist.do", method = RequestMethod.POST)
	public ModelAndView registRecipe(@ModelAttribute Recipe recipe, @ModelAttribute RecipeStep rStep,
			@ModelAttribute RecipeMaterial rMaterial, @ModelAttribute RecipeTag rTag, ModelAndView mv,
			@RequestParam(value = "mainPicture", required = false) MultipartFile mainPic,
			@RequestParam(value = "recipePicture1", required = false) MultipartFile detailPic1,
			@RequestParam(value = "recipePicture2", required = false) MultipartFile detailPic2,
			@RequestParam(value = "recipePicture3", required = false) MultipartFile detailPic3,
			@RequestParam(value = "recipePicture4", required = false) MultipartFile detailPic4,
			@RequestParam(value = "recipePicture5", required = false) MultipartFile detailPic5,
			@RequestParam(value = "recipePicture6", required = false) MultipartFile detailPic6,
			@RequestParam(value = "recipePicture7", required = false) MultipartFile detailPic7,
			@RequestParam(value = "recipePicture8", required = false) MultipartFile detailPic8,
			@RequestParam(value = "recipePicture9", required = false) MultipartFile detailPic9,
			@RequestParam(value = "recipePicture10", required = false) MultipartFile detailPic10, HttpSession session) {
		try {
		// 레시피 전달
		int result = rService.registRecipe(recipe);
		

		
		
		// 레시피 재료 리스트 만들어서 전달하기
		ArrayList<RecipeMaterial> rmList = new ArrayList<RecipeMaterial>();
		String amount[] = rMaterial.getAmount().split(",");
		String material[] = rMaterial.getMaterial().split(",");
		for (int i = 0; i < material.length; i++) {

			// 재료나 수량이 비어있지 않을때만 List에 저장
			if (!amount[i].equals("") && !material[i].equals("")) {
				RecipeMaterial rMaterialOne = new RecipeMaterial();
				rMaterialOne.setAmount(amount[i]);
				rMaterialOne.setMaterial(material[i]);
				rMaterialOne.setMaterialOrder(i+1);
				rmList.add(rMaterialOne);
			}

		}
		int result1 = rService.registMaterial(rmList);
		System.out.println(result1);

		// 레시피 순서 리스트 만들어서 전달하기
		ArrayList<RecipeStep> rsList = new ArrayList<RecipeStep>();
		String arrDescription[] = rStep.getRecipeDescription().split(",");
		for (int i = 0; i < arrDescription.length; i++) {
			// 레시피 설명이 비어있지 않을때만 저장
			if (!arrDescription[i].equals("")) {
				RecipeStep rStepOne = new RecipeStep();
				rStepOne.setRecipeDescription(arrDescription[i]);
				rStepOne.setRecipeOrder(i+1);
				rsList.add(rStepOne);
			}
		}
		int result2 = rService.registStep(rsList);

		// 레시피 태그 true false로 받음
		int result3 = rService.registTag(rTag);
		
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	public ModelAndView RecipeList(ModelAndView mv, int page) {
		return mv;
	}

	public ModelAndView viewRecipeStep(int recipeNo, HttpSession session, ModelAndView mv) {
		return mv;
	}

	public ModelAndView recipeModifyView(ModelAndView mv, Integer recipeNo) {
		return mv;
	}

	public ModelAndView modifyRecipe(Recipe recipe, RecipeStep rStep, RecipeTag rTag, MultipartFile mainPic,
			MultipartFile detailPic1, MultipartFile detailPic2, MultipartFile detailPic3, MultipartFile detailPic4,
			MultipartFile detailPic5, MultipartFile detailPic6, MultipartFile detailPic7, MultipartFile detailPic8,
			MultipartFile detailPic9, MultipartFile detailPic10, HttpSession session, ModelAndView mv) {
		return mv;

	}

	public ModelAndView setRecommand(int recipeNo, HttpSession session, ModelAndView mv) {
		return mv;

	}

	public ModelAndView removeRecommand(int recipeNo, HttpSession session, ModelAndView mv) {
		return mv;

	}

	public ModelAndView removeRecipe(HttpSession session, ModelAndView mv, int recipyNo, String memberEmail) {
		return mv;

	}

}

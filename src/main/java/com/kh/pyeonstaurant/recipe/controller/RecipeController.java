package com.kh.pyeonstaurant.recipe.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	 * 
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
	 * @param mainPicture
	 * @param recipePicture
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/recipe/regist.do", method = RequestMethod.POST)
	public ModelAndView registRecipe(@ModelAttribute Recipe recipe, @ModelAttribute RecipeStep rStep,
			@ModelAttribute RecipeMaterial rMaterial, @ModelAttribute RecipeTag rTag, ModelAndView mv,
			@RequestParam(value = "mainPicture", required = false) MultipartFile mainPicture,
			@RequestParam(value = "recipePicture", required = false) List<MultipartFile> recipePicture,
			HttpSession session, HttpServletRequest request) {
		try {
			// 레시피 전달

			// 사진 저장코드
			String mainPic = mainPicture.getOriginalFilename();
			if (!mainPic.equals("")) {

				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\recipeImg"; // 내가 저장할 폴더
				File file = new File(savePath); // 파일 객체 만들기

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String mainPicRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ mainPic.substring(mainPic.lastIndexOf(".") + 1);

				if (!file.exists()) { // 경로에 savePath가 없을땐
					file.mkdir(); // 경로 만들기
				}

				mainPicture.transferTo(new File(savePath + "\\" + mainPicRename));// 파일을 buploadFile경로에 저장
				recipe.setMainPic(mainPic);
				recipe.setMainPicRename(mainPicRename);

			}
			// 사진 저장 코드 종료

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
					rMaterialOne.setMaterialOrder(i + 1);
					rmList.add(rMaterialOne);
				}

			}
			int result1 = rService.registMaterial(rmList);

			// 레시피 순서 리스트 만들어서 전달하기
			ArrayList<RecipeStep> rsList = new ArrayList<RecipeStep>();
			rStep.getRecipeDescription();
			String arrDescription[] = rStep.getRecipeDescription().split(",ab22bb,");
			//더미 value까지 배열을 나누는것으로 인식해서 사용자가 ,를 입력했을때 정상적으로 table에 저장되게 한다
			arrDescription[arrDescription.length-1] = arrDescription[arrDescription.length-1].replace(",ab22bb", "");
			//배열의 마지막은 ,가 안들어가기때문에 더미vlaue 배열값으로 인식한다, ,가 없는 더미value를 삭제 해주는 코드

			///// 레시피 순서 사진 저장코드


			for (int i = 0; i < recipePicture.size(); i++) {
				String recipePic = recipePicture.get(i).getOriginalFilename();
				String recipePicRename = "";
				if (!recipePic.equals("")) {

					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\recipeImg"; // 내가 저장할 폴더
					File file = new File(savePath); // 파일 객체 만들기

					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					recipePicRename = sdf.format(new Date(System.currentTimeMillis())) + "stepImg" + i + "."
							+ recipePic.substring(recipePic.lastIndexOf(".") + 1);// 동시에여러사진이올라가기에 이름에 순서추가해줌

					if (!file.exists()) { // 경로에 savePath가 없을땐
						file.mkdir(); // 경로 만들기
					}
					recipePicture.get(i).transferTo(new File(savePath + "\\" + recipePicRename));// 파일을 buploadFile경로에 저장
					///// 여기까지 사진 저장코드/////

				}
				// 여기서부터 레시피 step 테이블에 저장할 값 List화 시키는 코드
				RecipeStep rStepOne = new RecipeStep();
				if (i < arrDescription.length) {
					if (!arrDescription[i].equals("")) {
						rStepOne.setRecipeDescription(arrDescription[i]);
					}
				}
				rStepOne.setRecipePic(recipePic);
				rStepOne.setRecipePicRename(recipePicRename);
				rStepOne.setRecipeOrder(i + 1);

				
					rsList.add(rStepOne);
					System.out.println(rStepOne);

			}

			int result2 = rService.registStep(rsList); // 레시피 순서저장 코드 종료

			// 레시피 태그 true false로 받음
			int result3 = rService.registTag(rTag);
			mv.setViewName("redirect:/recipe/recipeList.do");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	/**
	 * 레시피 리스트 전체 불러오기(임시) 
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/recipe/recipeList.do", method = RequestMethod.GET)
	public ModelAndView RecipeList(ModelAndView mv) {
		try {
		List<Recipe> rList = rService.printRecipeList(0,0);
		mv.addObject("rList", rList);
		mv.setViewName("/recipe/recipeList");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
/**
 * 디테일 레시피 보기
 * @param recipeNo
 * @param session
 * @param mv
 * @return
 */
	@RequestMapping(value="/recipe/detail.do", method = RequestMethod.GET)
	public ModelAndView viewRecipeStep(int recipeNo, HttpSession session, ModelAndView mv) {
		
		try {
		Recipe recipe = rService.printOneRecipe(recipeNo);
		List<RecipeMaterial> rmList = rService.printOneRecipeMaterial(recipeNo);
		List<RecipeStep> rsList = rService.printOneRecipeStep(recipeNo);
		RecipeTag rTag = rService.printOneRecipeTag(recipeNo);
		
		mv.addObject("recipe", recipe);
		mv.addObject("rmList", rmList);
		mv.addObject("rsList", rsList);
		mv.addObject("rTag", rTag);
		mv.setViewName("/recipe/recipeDetail");
		
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping(value="/recipe/modifyForm.do", method = RequestMethod.GET)
	public ModelAndView recipeModifyView(ModelAndView mv, @RequestParam("recipeNo") Integer recipeNo, HttpSession session) {
		
		try {
		Recipe recipe = rService.printOneRecipe(recipeNo);
		RecipeTag rTag = rService.printOneRecipeTag(recipeNo);
		List<RecipeMaterial> rmList = rService.printOneRecipeMaterial(recipeNo);
		List<RecipeStep> rsList = rService.printOneRecipeStep(recipeNo);
		
		mv.addObject("recipe", recipe);
		mv.addObject("rTag", rTag);
		mv.addObject("rmList", rmList);
		mv.addObject("rmListSize",rmList.size());
		mv.addObject("rsList", rsList);
		mv.setViewName("/recipe/recipeModifyForm");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	public ModelAndView modifyRecipe(@ModelAttribute Recipe recipe, @ModelAttribute RecipeStep rStep,
			@ModelAttribute RecipeMaterial rMaterial, @ModelAttribute RecipeTag rTag, ModelAndView mv,
			@RequestParam(value = "mainPicture", required = false) MultipartFile mainPicture,
			@RequestParam(value = "recipePicture", required = false) List<MultipartFile> recipePicture,
			HttpSession session, HttpServletRequest request) {
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

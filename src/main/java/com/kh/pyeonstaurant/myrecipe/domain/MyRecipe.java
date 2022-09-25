package com.kh.pyeonstaurant.myrecipe.domain;

public class MyRecipe {
	private String memberEmail;
	private int recipeNo;
	private int myRecipeNo;
	private String recipeName;
	
	public MyRecipe() {}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getMyRecipeNo() {
		return myRecipeNo;
	}

	public void setMyRecipeNo(int myRecipeNo) {
		this.myRecipeNo = myRecipeNo;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public MyRecipe(String memberEmail, int recipeNo, int myRecipeNo, String recipePicRename, String recipeName) {
		this.memberEmail = memberEmail;
		this.recipeNo = recipeNo;
		this.myRecipeNo = myRecipeNo;
		this.recipeName = recipeName;
	}


	
	

	

}

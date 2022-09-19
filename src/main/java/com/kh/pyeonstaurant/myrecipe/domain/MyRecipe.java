package com.kh.pyeonstaurant.myrecipe.domain;

public class MyRecipe {
	private String memberEmail;
	private int recipeNo;
	private int myRecipeNo;
	
	public MyRecipe() {}
	

	public MyRecipe(String memberEmail, int recipeNo, int myRecipeNo) {
		this.memberEmail = memberEmail;
		this.recipeNo = recipeNo;
		this.myRecipeNo = myRecipeNo;
	}

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
	
	@Override
	public String toString() {
		return "MyRecipe [memberEmail=" + memberEmail + ", recipeNo=" + recipeNo + ", myRecipeNo=" + myRecipeNo + "]";
	}

}

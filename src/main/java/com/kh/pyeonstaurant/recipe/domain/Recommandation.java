
package com.kh.pyeonstaurant.recipe.domain;

public class Recommandation {
	private int recipeNo;
	private String memberEmail;
	
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	@Override
	public String toString() {
		return "Recommandation [recipeNo=" + recipeNo + ", memberEmail=" + memberEmail + "]";
	}
	


}


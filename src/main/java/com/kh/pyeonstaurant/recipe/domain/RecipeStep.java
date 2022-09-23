
package com.kh.pyeonstaurant.recipe.domain;


public class RecipeStep {
	
	private int recipeOrder;
	private int recipeNo;
	private String recipeDescription;
	private String recipePic;
	private String recipePicRename;
	
	public RecipeStep() {
		
	}

	public RecipeStep(int recipeOrder, int recipeNo, String recipeDescription, String recipePic, String recipePicRename) {
		super();
		this.recipeOrder = recipeOrder;
		this.recipeNo = recipeNo;
		this.recipeDescription = recipeDescription;
		this.recipePic = recipePic;
		this.recipePicRename = recipePicRename;
	}

	@Override
	public String toString() {
		return "RecipeStep [recipeOrder=" + recipeOrder + ", recipeNo=" + recipeNo + ", recipeDescription="
				+ recipeDescription + ", recipePic=" + recipePic + ", recipePicRename ="+recipePicRename+"]";
	}

	
	
	
	public String getRecipePicRename() {
		return recipePicRename;
	}

	public void setRecipePicRename(String recipePicRename) {
		this.recipePicRename = recipePicRename;
	}

	public int getRecipeOrder() {
		return recipeOrder;
	}

	public void setRecipeOrder(int recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getRecipeDescription() {
		return recipeDescription;
	}

	public void setRecipeDescription(String recipeDescription) {
		this.recipeDescription = recipeDescription;
	}

	public String getRecipePic() {
		return recipePic;
	}

	public void setRecipePic(String recipePic) {
		this.recipePic = recipePic;
	}
	
	

}


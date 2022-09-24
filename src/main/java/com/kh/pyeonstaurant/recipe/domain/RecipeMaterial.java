
package com.kh.pyeonstaurant.recipe.domain;


public class RecipeMaterial {
	
	
	private int recipeNo;
	private int materialOrder;
	private String material;
	private String amount;
	
	
	public RecipeMaterial() {
		
	}


	public RecipeMaterial(int recipeNo, int materialOrder, String material, String amount) {
		super();
		this.recipeNo = recipeNo;
		this.materialOrder = materialOrder;
		this.material = material;
		this.amount = amount;
	}


	@Override
	public String toString() {
		return "RecipeMaterial [recipeNo=" + recipeNo + ", materialOrder=" + materialOrder + ", material=" + material
				+ ", amount=" + amount + "]";
	}


	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public int getMaterialOrder() {
		return materialOrder;
	}


	public void setMaterialOrder(int materialOrder) {
		this.materialOrder = materialOrder;
	}


	public String getMaterial() {
		return material;
	}


	public void setMaterial(String material) {
		this.material = material;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	

}


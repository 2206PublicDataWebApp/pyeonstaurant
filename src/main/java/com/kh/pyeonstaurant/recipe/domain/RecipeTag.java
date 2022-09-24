
package com.kh.pyeonstaurant.recipe.domain;


public class RecipeTag {
	
	private int recipeNo ;
	private boolean jmt;
	private boolean healthy;
	private boolean goodSpicy;
	private boolean full;
	private boolean soSpicy;
	private boolean sweet;
	private boolean easy;
	private boolean party;
	
	public RecipeTag() {
		
	}

	public RecipeTag(int recipeNo, boolean jmt, boolean healthy, boolean goodSpicy, boolean full, boolean soSpicy,
			boolean sweet, boolean easy, boolean party) {
		super();
		this.recipeNo = recipeNo;
		this.jmt = jmt;
		this.healthy = healthy;
		this.goodSpicy = goodSpicy;
		this.full = full;
		this.soSpicy = soSpicy;
		this.sweet = sweet;
		this.easy = easy;
		this.party = party;
	}

	@Override
	public String toString() {
		return "RecipeTag [recipeNo=" + recipeNo + ", jmt=" + jmt + ", healthy=" + healthy + ", goodSpicy=" + goodSpicy
				+ ", full=" + full + ", soSpicy=" + soSpicy + ", sweet=" + sweet + ", easy=" + easy + ", party=" + party
				+ "]";
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public boolean isJmt() {
		return jmt;
	}

	public void setJmt(boolean jmt) {
		this.jmt = jmt;
	}

	public boolean isHealthy() {
		return healthy;
	}

	public void setHealthy(boolean healthy) {
		this.healthy = healthy;
	}

	public boolean isGoodSpicy() {
		return goodSpicy;
	}

	public void setGoodSpicy(boolean goodSpicy) {
		this.goodSpicy = goodSpicy;
	}

	public boolean isFull() {
		return full;
	}

	public void setFull(boolean full) {
		this.full = full;
	}

	public boolean isSoSpicy() {
		return soSpicy;
	}

	public void setSoSpicy(boolean soSpicy) {
		this.soSpicy = soSpicy;
	}

	public boolean isSweet() {
		return sweet;
	}

	public void setSweet(boolean sweet) {
		this.sweet = sweet;
	}

	public boolean isEasy() {
		return easy;
	}

	public void setEasy(boolean easy) {
		this.easy = easy;
	}

	public boolean isParty() {
		return party;
	}

	public void setParty(boolean party) {
		this.party = party;
	}
	
	

}


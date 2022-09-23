
package com.kh.pyeonstaurant.recipe.domain;

import java.sql.Date;

public class RecipeComment {
	


	private int commentNo;
	private int recipeNo;
	private Date commentDate;
	private String commentContents;
	private String memberEmail;
	private String memberName;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "RecipeComment [commentNo=" + commentNo + ", recipeNo=" + recipeNo + ", commentDate=" + commentDate
				+ ", commentContents=" + commentContents + ", memberEmail=" + memberEmail + ", memberName=" + memberName
				+ "]";
	}
	
	
	

}


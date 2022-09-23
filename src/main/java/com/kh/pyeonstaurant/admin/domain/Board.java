package com.kh.pyeonstaurant.admin.domain;

import java.sql.Date;
import java.time.LocalDate;

public class Board {
	String memberEmail;
	String boardTitle;
	Date incertDate;
	String recipeInfo;
	int recipeNo;
	
	public Board() {
		
	}
	
	public Board(String memberEmail, String boardTitle, Date incertDate, String recipeInfo, int recipeNo) {
		this.memberEmail = memberEmail;
		this.boardTitle = boardTitle;
		this.incertDate = incertDate;
		this.recipeInfo = recipeInfo;
		this.recipeNo = recipeNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public Date getIncertDate() {
		return incertDate;
	}

	public void setIncertDate(Date incertDate) {
		this.incertDate = incertDate;
	}

	public String getRecipeInfo() {
		return recipeInfo;
	}

	public void setRecipeInfo(String recipeInfo) {
		this.recipeInfo = recipeInfo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	@Override
	public String toString() {
		return "Board [memberEmail=" + memberEmail + ", boardTitle=" + boardTitle + ", incertDate=" + incertDate
				+ ", recipeInfo=" + recipeInfo + ", recipeNo=" + recipeNo + "]";
	}
	
	
	
}


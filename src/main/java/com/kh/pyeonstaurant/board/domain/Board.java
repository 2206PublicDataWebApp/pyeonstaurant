package com.kh.pyeonstaurant.board.domain;

import java.sql.Date;
import java.time.LocalDate;

public class Board {
	String memberEmail;
	String boardTitle;
	
	public Board() {
		
	}
	
	
	public Board(String memberEmail, String boardTitle) {
		this.memberEmail = memberEmail;
		this.boardTitle = boardTitle;
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

	@Override
	public String toString() {
		return "BoardAdmin [memberEmail=" + memberEmail + ", boardTitle=" + boardTitle + "]";
	}
	
	
	

}

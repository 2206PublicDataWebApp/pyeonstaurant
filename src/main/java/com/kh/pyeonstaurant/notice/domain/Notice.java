package com.kh.pyeonstaurant.notice.domain;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFilename;
	private String noticeFileRename;
	private String noticeFilepath;
	private Date noticeDate;
	private int adminCheck;
	
	public Notice() {
		
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeFilename,
			String noticeFileRename, String noticeFilepath, Date noticeDate, int adminCheck) {
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFilename = noticeFilename;
		this.noticeFileRename = noticeFileRename;
		this.noticeFilepath = noticeFilepath;
		this.noticeDate = noticeDate;
		this.adminCheck = adminCheck;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeFilename() {
		return noticeFilename;
	}

	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}

	public String getNoticeFileRename() {
		return noticeFileRename;
	}

	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}

	public String getNoticeFilepath() {
		return noticeFilepath;
	}

	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeFilename=" + noticeFilename + ", noticeFileRename=" + noticeFileRename + ", noticeFilepath="
				+ noticeFilepath + ", noticeDate=" + noticeDate + ", adminCheck=" + adminCheck + "]";
	}
	

}

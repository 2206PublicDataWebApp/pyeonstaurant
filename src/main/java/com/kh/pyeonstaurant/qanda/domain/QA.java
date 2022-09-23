
package com.kh.pyeonstaurant.qanda.domain;

import java.sql.Date;

public class QA {
	
	private int qaNo; 
	
	
	private String qaTitle ;
	private String qaContents ;
	private String qaFile1;
	private String qaFile2;
	private String qaFile3;
	private String qaFile4;
	private String qaFile5;
	private String qaFile1Rename;
	private String qaFile2Rename;
	private String qaFile3Rename;
	private String qaFile4Rename;
	private String qaFile5Rename;
	private String qaCategory;
	private boolean qaSecret;
	private String memberEmail;
	private Date qaInsertDate;
	private Date qaUpdateDate;
	private String qaStatus;
	private String name;
	
	
	
	public QA() {}



	public int getQaNo() {
		return qaNo;
	}



	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}



	public String getQaTitle() {
		return qaTitle;
	}



	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}



	public String getQaContents() {
		return qaContents;
	}



	public void setQaContents(String qaContents) {
		this.qaContents = qaContents;
	}



	public String getQaFile1() {
		return qaFile1;
	}



	public void setQaFile1(String qaFile1) {
		this.qaFile1 = qaFile1;
	}



	public String getQaFile2() {
		return qaFile2;
	}



	public void setQaFile2(String qaFile2) {
		this.qaFile2 = qaFile2;
	}



	public String getQaFile3() {
		return qaFile3;
	}



	public void setQaFile3(String qaFile3) {
		this.qaFile3 = qaFile3;
	}



	public String getQaFile4() {
		return qaFile4;
	}



	public void setQaFile4(String qaFile4) {
		this.qaFile4 = qaFile4;
	}



	public String getQaFile5() {
		return qaFile5;
	}



	public void setQaFile5(String qaFile5) {
		this.qaFile5 = qaFile5;
	}



	public String getQaFile1Rename() {
		return qaFile1Rename;
	}



	public void setQaFile1Rename(String qaFile1Rename) {
		this.qaFile1Rename = qaFile1Rename;
	}



	public String getQaFile2Rename() {
		return qaFile2Rename;
	}



	public void setQaFile2Rename(String qaFile2Rename) {
		this.qaFile2Rename = qaFile2Rename;
	}



	public String getQaFile3Rename() {
		return qaFile3Rename;
	}



	public void setQaFile3Rename(String qaFile3Rename) {
		this.qaFile3Rename = qaFile3Rename;
	}



	public String getQaFile4Rename() {
		return qaFile4Rename;
	}



	public void setQaFile4Rename(String qaFile4Rename) {
		this.qaFile4Rename = qaFile4Rename;
	}



	public String getQaFile5Rename() {
		return qaFile5Rename;
	}



	public void setQaFile5Rename(String qaFile5Rename) {
		this.qaFile5Rename = qaFile5Rename;
	}



	public String getQaCategory() {
		return qaCategory;
	}



	public void setQaCategory(String qaCategory) {
		this.qaCategory = qaCategory;
	}



	public boolean isQaSecret() {
		return qaSecret;
	}



	public void setQaSecret(boolean qaSecret) {
		this.qaSecret = qaSecret;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public Date getQaInsertDate() {
		return qaInsertDate;
	}



	public void setQaInsertDate(Date qaInsertDate) {
		this.qaInsertDate = qaInsertDate;
	}



	public Date getQaUpdateDate() {
		return qaUpdateDate;
	}



	public void setQaUpdateDate(Date qaUpdateDate) {
		this.qaUpdateDate = qaUpdateDate;
	}



	public String getQaStatus() {
		return qaStatus;
	}



	public void setQaStatus(String qaStatus) {
		this.qaStatus = qaStatus;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	@Override
	public String toString() {
		return "QA [qaNo=" + qaNo + ", qaTitle=" + qaTitle + ", qaContents=" + qaContents + ", qaFile1=" + qaFile1
				+ ", qaFile2=" + qaFile2 + ", qaFile3=" + qaFile3 + ", qaFile4=" + qaFile4 + ", qaFile5=" + qaFile5
				+ ", qaFile1Rename=" + qaFile1Rename + ", qaFile2Rename=" + qaFile2Rename + ", qaFile3Rename="
				+ qaFile3Rename + ", qaFile4Rename=" + qaFile4Rename + ", qaFile5Rename=" + qaFile5Rename
				+ ", qaCategory=" + qaCategory + ", qaSecret=" + qaSecret + ", memberEmail=" + memberEmail
				+ ", qaInsertDate=" + qaInsertDate + ", qaUpdateDate=" + qaUpdateDate + ", qaStatus=" + qaStatus
				+ ", name=" + name + "]";
	}
	




}


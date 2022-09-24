package com.kh.pyeonstaurant.report.service;

import java.sql.Date;
import java.util.List;

import com.kh.pyeonstaurant.report.domain.Report;

public interface ReportService {

	public int addReportRecipe(Report report);

	public int addReportComment(Report report);

	public int processedReportRecipe(int recipeNo);

	public int processedReportComment(int commentNo);

	public int getTotalReoprtCount();

	public List<Report> reportAllView(int currentPage, int boardLimit);

	public int getTotalCommentCount();

	public List<Report> reportCommentAllView(int currentPage2, int boardLimit2);

}

package com.kh.pyeonstaurant.report.service;

import java.util.List;

import com.kh.pyeonstaurant.report.domain.Report;

public interface ReportService {

	public int addReportRecipe(Report report);

	public int addReportComment(Report report);


	public List<Report> reportRecipeView(int currentPage, int boardLimit, int recipeNo);

	public List<Report> reportCommentView(int currentPage, int boardLimit, int commentNo);

	public int processedReportRecipe(int recipeNo);

	public int processedReportComment(int commentNo);

	public int getRecipeTotalCount(int recipeNo);

	public int getCommentTotalCount(int commentNo);
}

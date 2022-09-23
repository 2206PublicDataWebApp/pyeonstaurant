package com.kh.pyeonstaurant.report.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.report.domain.Report;

public interface ReportStore {

	public int insertReportRecipeNo(SqlSession session, Report report);

	public int insertReportCommentNo(SqlSession session, Report report);

	public int updateReportRecipe(SqlSession session, int recipeNo);

	public int updateReportComment(SqlSession session, int commentNo);

	public int selectTotalReportCount(SqlSession session);

	public List<Report> selectAllReport(SqlSession session, int currentPage, int boardLimit);

	public int selectTotalCommentCount(SqlSession session);

	public List<Report> selectAllComment(SqlSession session, int currentPage2, int boardLimit2);

}

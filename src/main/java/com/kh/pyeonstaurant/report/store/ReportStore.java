package com.kh.pyeonstaurant.report.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.report.domain.Report;

public interface ReportStore {

	public int insertReportRecipeNo(SqlSession session, Report report);

	public int insertReportCommentNo(SqlSession session, Report report);

	public List<Report> selectAllByValue(SqlSession session, int currentPage, int boardLimit, int recipeNo);

	public List<Report> selectAllByCommentValue(SqlSession session, int currentPage, int boardLimit, int commentNo);

	public int updateReportRecipe(SqlSession session, int recipeNo);

	public int updateReportComment(SqlSession session, int commentNo);

	public int selectRecipeTotalCount(SqlSession session, int recipeNo);

	public int selectCommentNoTotalCount(SqlSession session, int commentNo);

}

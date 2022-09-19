package com.kh.pyeonstaurant.report.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.report.domain.Report;
import com.kh.pyeonstaurant.report.store.ReportStore;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private SqlSession session;
	@Autowired
	private ReportStore rStore;
	
	@Override
	public int addReportRecipe(Report report) {
		int result = rStore.insertReportRecipeNo(session, report);
		return result;
	}

	@Override
	public int addReportComment(Report report) {
		int result = rStore.insertReportCommentNo(session, report);
		return result;
	}


	@Override
	public List<Report> reportRecipeView(int currentPage, int boardLimit, int recipeNo) {
		List<Report> rList 
		= rStore.selectAllByValue(
				session
				, currentPage
				, boardLimit
				, recipeNo
				);
		return rList;
	}

	@Override
	public List<Report> reportCommentView(int currentPage, int boardLimit, int commentNo) {
		List<Report> rList 
		= rStore.selectAllByCommentValue(
				session
				, currentPage
				, boardLimit
				, commentNo
				);
		return rList;
	}

	@Override
	public int processedReportRecipe(int recipeNo) {
		int result = rStore.updateReportRecipe(session, recipeNo);
		return result;
	}

	@Override
	public int processedReportComment(int commentNo) {
		int result = rStore.updateReportComment(session, commentNo);
		return result;
	}


	@Override
	public int getRecipeTotalCount(int recipeNo) {
		int totalCount = rStore.selectRecipeTotalCount(session, recipeNo);
		return totalCount;
	}

	@Override
	public int getCommentTotalCount(int commentNo) {
		int totalCount = rStore.selectCommentNoTotalCount(session, commentNo);
		return totalCount;
	}

	
	
}

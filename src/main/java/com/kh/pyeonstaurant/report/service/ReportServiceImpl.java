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
	public int getTotalReoprtCount() {
		int result = rStore.selectTotalReportCount(session);
		return result;
	}

	@Override
	public List<Report> reportAllView(int currentPage, int boardLimit) {
		List<Report> rList 
		= rStore.selectAllReport(
				session
				, currentPage
				, boardLimit
				);
		return rList;
	}

	@Override
	public int getTotalCommentCount() {
		int result = rStore.selectTotalCommentCount(session);
		return result;
	}

	@Override
	public List<Report> reportCommentAllView(int currentPage2, int boardLimit2) {
		List<Report> cList 
		= rStore.selectAllComment(
				session
				, currentPage2
				, boardLimit2
				);
		return cList;
	}


	
	
}

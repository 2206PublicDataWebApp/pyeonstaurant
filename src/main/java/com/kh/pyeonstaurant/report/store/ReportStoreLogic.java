package com.kh.pyeonstaurant.report.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.report.domain.Report;

@Repository
public class ReportStoreLogic implements ReportStore{

	@Override
	public int insertReportRecipeNo(SqlSession session, Report report) {
		int result = session.insert("reportMapper.insertReportRecipe", report );
		return result;
	}

	@Override
	public int insertReportCommentNo(SqlSession session, Report report) {
		int result = session.insert("reportMapper.insertReportComment", report );
		return result;
	}

	@Override
	public int updateReportRecipe(SqlSession session, int recipeNo) {
		int result = session.update("reportMapper.updateRecipeStatus", recipeNo);
		return result;
	}

	@Override
	public int updateReportComment(SqlSession session, int commentNo) {
		int result = session.update("reportMapper.updateCommentStatus", commentNo);
		return result;
	}

	@Override
	public int selectTotalReportCount(SqlSession session) {
		int result = session.selectOne("reportMapper.selectReportCount");
		return result;
	}

	@Override
	public List<Report> selectAllReport(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List<Report> rList 
		= session.selectList("reportMapper.selectAllReport"
				, rowBounds);
		return rList;
	}

	@Override
	public int selectTotalCommentCount(SqlSession session) {
		int result = session.selectOne("reportMapper.selectCommentCount");
		return result;
	}

	@Override
	public List<Report> selectAllComment(SqlSession session, int currentPage2, int boardLimit2) {
		int offset = (currentPage2-1)*boardLimit2;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit2);
		List<Report> cList 
		= session.selectList("reportMapper.selectAllComment"
				, rowBounds);
		return cList;
	}


}

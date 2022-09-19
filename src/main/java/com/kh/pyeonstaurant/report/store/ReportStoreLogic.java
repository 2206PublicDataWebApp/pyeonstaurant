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
	public List<Report> selectAllByValue(SqlSession session, int currentPage, int boardLimit, int recipeNo) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List<Report> rList 
		= session.selectList("reportMapper.selectReportRecipe"
				,recipeNo, rowBounds);
		return rList;
	}

	@Override
	public List<Report> selectAllByCommentValue(SqlSession session, int currentPage, int boardLimit, int commentNo) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List<Report> rList 
		= session.selectList("reportMapper.selectReportComment"
				,commentNo, rowBounds);
		return rList;
	}

	@Override
	public int updateReportRecipe(SqlSession session, int recipeNo) {
		int result = session.update("reportMapper.updateResult", recipeNo);
		return result;
	}

	@Override
	public int updateReportComment(SqlSession session, int commentNo) {
		int result = session.update("reportMapper.updateResultComment", commentNo);
		return result;
	}

	@Override
	public int selectRecipeTotalCount(SqlSession session, int recipeNo) {
		int totalCount = session.selectOne("MyRecipeMapper.selectRecipeTotalCount", recipeNo);
		return totalCount;
	}

	@Override
	public int selectCommentNoTotalCount(SqlSession session, int commentNo) {
		int totalCount = session.selectOne("MyRecipeMapper.selectCommentTotalCount", commentNo);
		return totalCount;
	}

}

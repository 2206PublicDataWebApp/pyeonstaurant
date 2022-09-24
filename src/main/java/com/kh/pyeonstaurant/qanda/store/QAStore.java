
package com.kh.pyeonstaurant.qanda.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.domain.QAComment;

public interface QAStore {
	public int insertQandA(QA qa,SqlSessionTemplate session);

	public int updateQandA(QA qa,SqlSessionTemplate session);

	public int deleteOneQandANo(int qaNo, SqlSessionTemplate session);

	public QA selectOneQANo(int qaNo, SqlSessionTemplate session);

	public List<QA> selectallQAList(int currentPage, int limit, SqlSessionTemplate session);

	public List<QAComment> selectallQACommentList(int currentPage,int limit,int qaNo, SqlSessionTemplate session);

	public int selectTotalCount(SqlSessionTemplate session, String searchCondition, String searchValue);

	public List<QA> selectAllByValue(SqlSessionTemplate session, String searchCondition, String searchValue,
			int currentPage, int boardLimit);

	public String selectMemberName(String memberEmail, SqlSessionTemplate session);

	public String selectMeberEmail(Integer qaNo,SqlSessionTemplate session);

}


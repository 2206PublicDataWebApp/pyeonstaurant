
package com.kh.pyeonstaurant.qanda.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.domain.QAComment;
import com.kh.pyeonstaurant.qanda.store.QAStore;

@Repository
public class QAStoreLogic implements QAStore {


	@Override
	public int insertQandA(QA qA, SqlSessionTemplate session) {
		int result = session.insert("QnAMapper.insertQnA", qA);
		return result;
	}

	@Override
	public int updateQandA(QA qa, SqlSessionTemplate session) {
		int result = session.update("QnAMapper.updateOneQnA", qa);
		return result;
	}

	@Override
	public int deleteOneQandANo(int qaNo, SqlSessionTemplate session) {

		int result = session.update("QnAMapper.deleteOneQaNo", qaNo);
		return result;
	}

	@Override
	public QA selectOneQANo(int qaNo, SqlSessionTemplate session) {
		QA qa = session.selectOne("QnAMapper.SelectOneQnA", qaNo);
		return qa;
	}

	@Override
	public List<QA> selectallQAList(int currentPage, int limit, SqlSessionTemplate session) {

		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<QA> qList = session.selectList("QnAMapper.SelectAllQnA", null, rowBounds);
		return qList;
	}

	public List<QAComment> selectallQACommentList(int currentPage, int limit, int qaNo, SqlSessionTemplate session) {
		List<QAComment> qcList = session.selectList("QnAMapper.SelectAllQnAComment", qaNo);
		System.out.println(qcList);

		return qcList;

	}

	@Override
	public int selectTotalCount(SqlSessionTemplate session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("serchValue", searchValue);
		int count = session.selectOne("QnAMapper.selectBoardCount", paramMap);
		return count;
	}

	@Override
	public List<QA> selectAllByValue(SqlSessionTemplate session, String searchCondition, String searchValue,
			int currentPage, int boardLimit) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("serchValue", searchValue);
		int offset = (currentPage - 1) * boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<QA> qList = session.selectList("QnAMapper.selectAllByValue", paramMap, rowBounds);

		return qList;
	}
}


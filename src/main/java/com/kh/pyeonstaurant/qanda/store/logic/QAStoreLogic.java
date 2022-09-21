package com.kh.pyeonstaurant.qanda.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.store.QAStore;

@Repository
public class QAStoreLogic implements QAStore {

	@Override
	public int insertQandA(QA qA, SqlSessionTemplate session) {
		int result= session.insert("QnAMapper.insertQnA",qA);
		return result;
	}

	@Override
	public int updateQandA(QA qa, SqlSessionTemplate session) {
		int result= session.update("QnAMapper.updateOneQnA",qa);
		return result;
	}

	@Override
	public int deleteOneQandANo(int qaNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QA selectOneQANo(int qaNo, SqlSessionTemplate session) {
		QA qa = session.selectOne("QnAMapper.SelectOneQnA",qaNo);
		return qa;
	}

	@Override
	public List<QA> selectallQAList(int currentPage, int limit, SqlSessionTemplate session) {
		List<QA> qList = session.selectList("QnAMapper.SelectAllQnA");
		return qList;
	}

}

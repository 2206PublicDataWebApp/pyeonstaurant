package com.kh.pyeonstaurant.admin.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public int selectTotalCount(SqlSession session, String memberInfo) {
		int totalCount = session.selectOne("AdminMapper.selectTotalCount", memberInfo);
		return totalCount;
	}

	@Override
	public int removeMember(SqlSession session, String memberEmail) {
		int result = session.delete("AdminMapper.deleteMember", memberEmail);
		return result;
	}

	@Override
	public List selectAllMember(SqlSession session, int currentPage, int boardLimit, String memberInfo) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List mList = null;
		if(memberInfo.contains("@")) {
			mList = session.selectList("AdminMapper.selectAllEmail",memberInfo, rowBounds);
		}else {
			mList = session.selectList("AdminMapper.selectAllNickName",memberInfo, rowBounds);
		}
		return mList;
	}

}

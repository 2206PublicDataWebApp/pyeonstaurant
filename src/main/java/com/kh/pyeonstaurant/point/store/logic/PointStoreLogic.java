package com.kh.pyeonstaurant.point.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.point.store.PointStore;


@Repository
public class PointStoreLogic implements PointStore {

	
	@Override
	public List<Point> selectAllBoard(SqlSession session, int currentPage, int limit) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Point> pList 
		= session.selectList("PointMapper.selectAllBoard"
				, null, rowBounds);
		return pList;
	}
	
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("PointMapper.selectTotalCount");
		return totalCount;
	}
}

package com.kh.pyeonstaurant.point.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.pyeonstaurant.point.domain.Point;

public interface PointStore {
	public List<Point> selectAllBoard(SqlSession session, int currentPage, int limit);
	public int selectTotalCount(SqlSession session);
}

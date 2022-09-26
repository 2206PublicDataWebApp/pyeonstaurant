package com.kh.pyeonstaurant.point.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.point.store.PointStore;

@Repository
public class PointStoreLogic implements PointStore {

	
	@Override
	public List<Point> selectAllPoint(String pointMemberEmail, SqlSessionTemplate session) {
		List<Point> pList = session.selectList("PointMapper.selectAllPoint");
		return pList;
	}
}

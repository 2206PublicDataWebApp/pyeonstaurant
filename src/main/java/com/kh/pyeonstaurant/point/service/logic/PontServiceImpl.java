package com.kh.pyeonstaurant.point.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.point.service.PointService;
import com.kh.pyeonstaurant.point.store.PointStore;

@Service
public class PontServiceImpl implements PointService{
	@Autowired
	PointStore pStore;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Point> printAllBoard(int currentPage, int limit) {
		List<Point> pList = pStore.selectAllBoard(session, currentPage, limit);
		return pList;
	}
	
	@Override
	public int getTotalCount() {
		int totalCount = pStore.selectTotalCount(session);
		return totalCount;
	}
}

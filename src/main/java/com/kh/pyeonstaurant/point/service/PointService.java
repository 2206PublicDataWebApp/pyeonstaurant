package com.kh.pyeonstaurant.point.service;

import java.util.List;

import com.kh.pyeonstaurant.point.domain.Point;

public interface PointService {

	public List<Point> printAllBoard(int currentPage, int limit);
	public int getTotalCount();
}

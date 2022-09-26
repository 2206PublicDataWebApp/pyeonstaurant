package com.kh.pyeonstaurant.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.point.service.PointService;


@Controller
public class PointController {

	@Autowired
	private PointService pService;
	
	
}

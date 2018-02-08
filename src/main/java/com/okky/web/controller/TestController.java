package com.okky.web.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.okky.web.dao.TestDAO;
import com.okky.web.domain.TestVO;

@Controller
public class TestController {

	@Inject
	private TestDAO dao;
	
	@RequestMapping(value = "/testDAO", method = RequestMethod.GET)
	public void testDAO() {
		TestVO vo = new TestVO();
		vo.setTt("TEST");
		dao.insertTest(vo);
	}
	
}

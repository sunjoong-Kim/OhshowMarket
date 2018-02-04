package com.okky.test.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.okky.test.dao.TestDAO;
import com.okky.test.domain.TestVO;

@Controller
public class TestController {

	@Inject
	private TestDAO dao;
	
	@RequestMapping(value = "/testDAO", method = RequestMethod.GET)
	public void testDAO() {
		TestVO vo = new TestVO();
		vo.setTt("TEST");
		dao.insertTest(vo);
		
		
		
		System.out.println("Ä¿¹Ô ½ÇÇè¿ë");//asdfasdfasdfasdfasdfasdfa
	}
	
}

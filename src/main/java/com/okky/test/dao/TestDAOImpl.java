package com.okky.test.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.okky.test.domain.TestVO;

@Repository
public class TestDAOImpl implements TestDAO {

	@Inject
	private SqlSession session;
	
	private static final String NAMESPACE = "com.okky.mapper.testMapper";
	@Override
	public void insertTest(TestVO vo) {
		session.insert(NAMESPACE + ".insertTest", vo);
	}

}

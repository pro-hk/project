package com.simmons.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AsDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int AsWrite(AsDto asDto) {
		int result = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("AsWrite", asDto);
		System.out.println("result=="+result);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}

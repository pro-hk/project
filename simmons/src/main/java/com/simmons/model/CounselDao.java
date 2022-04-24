package com.simmons.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CounselDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int CounselWrite(CounselDto counselDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("CounselWrite", counselDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
}

package com.simmons.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CsDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int FaqWrite(FaqDto faqDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("FaqWrite", faqDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public List<FaqDto> FaqList(String faqCategory) {
		List<FaqDto> faqList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		faqList = sqlSession.selectList("FaqList", faqCategory);
		sqlSession.close();
		
		return faqList;
	}
	
}

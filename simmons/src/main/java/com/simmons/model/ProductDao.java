package com.simmons.model;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProductDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int productInsert(ProductDto productDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("productInsert", productDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public int sizesInsert(Map<String, String> sizesMap) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("sizesInsert", sizesMap);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}

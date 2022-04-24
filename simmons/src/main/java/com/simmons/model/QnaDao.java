package com.simmons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QnaDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	
	public int QnaWrite(QnaDto qnaDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("QnaWrite", qnaDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}


	public List<QnaDto> QnaAllList(String id) {
		List<QnaDto> qnaList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		qnaList = sqlSession.selectList("QnaAllList", id);
		sqlSession.close();
		
		return qnaList;
	}


	public QnaDto QnaView(String id, int no) {
		QnaDto qnaDto = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("no", no);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		qnaDto = sqlSession.selectOne("QnaView", map);
		sqlSession.close();
		
		return qnaDto;
	}

}

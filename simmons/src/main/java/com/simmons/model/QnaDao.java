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


	public QnaDto QnaView(int no) {
		QnaDto qnaDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		qnaDto = sqlSession.selectOne("QnaView", no);
		sqlSession.close();
		
		return qnaDto;
	}


	public int QnaTotal() {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("QnaTotal");
		sqlSession.close();
		
		return result;
	}


	public int QnaSearchTotal(String category, String txt) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("QnaSearchTotal", map);
		sqlSession.close();
		
		return result;
	}


	public List<QnaDto> QnaSearchList(String category, String txt, int startNum, int endNum) {
		List<QnaDto> qnaList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		qnaList = sqlSession.selectList("QnaSearchList", map);
		sqlSession.close();
		
		return qnaList;
	}

	public List<QnaDto> QnaList(int startNum, int endNum) {
		List<QnaDto> qnaList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		qnaList = sqlSession.selectList("QnaList", map);
		sqlSession.close();
		
		return qnaList;
	}

	public int QnaReply(String answer, int no) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("answer", answer);
		map.put("no", no);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("QnaReply", map);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int QnaDelete(int no) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("QnaDelete", no);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int QnaNoReply() {
		int result = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("QnaNoReply");
		sqlSession.close();
		
		return result;
	}
}

package com.simmons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int CounselTotal() {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("CounselTotal");
		sqlSession.close();
		
		return result;
	}

	public int CounselSearchTotal(String category, String txt) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("CounselSearchTotal", map);
		sqlSession.close();
		
		return result;
	}

	public List<CounselDto> CounselSearchList(String category, String txt, int startNum, int endNum) {
		List<CounselDto> counselList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		counselList = sqlSession.selectList("CounselSearchList", map);
		sqlSession.close();
		
		return counselList;
	}

	public List<CounselDto> CounselList(int startNum, int endNum) {
		List<CounselDto> counselList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		counselList = sqlSession.selectList("CounselList", map);
		sqlSession.close();
		
		return counselList;
	}

	public CounselDto CounselView(int no) {
		CounselDto counselDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		counselDto = sqlSession.selectOne("CounselView", no);
		sqlSession.close();
		
		return counselDto;
	}

	public int CounselReply(String answer, int no) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("answer", answer);
		map.put("no", no);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("CounselReply", map);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int CounselDelete(int no) {
		int result = 0;
		
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("CounselDelete", no);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int CounselNoReply() {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("CounselNoReply");
		sqlSession.close();
		
		return result;
	}
	
}

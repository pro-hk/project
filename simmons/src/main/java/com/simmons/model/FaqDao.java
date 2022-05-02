package com.simmons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FaqDao {
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
	
	public List<FaqDto> FaqListAll(int startNum, int endNum) {
		List<FaqDto> faqList = null;
		
		Map<String, Object> faqMap = new HashMap<>();
		faqMap.put("startNum", startNum);
		faqMap.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		faqList = sqlSession.selectList("FaqListAll", faqMap);
		sqlSession.close();
		
		return faqList;
	}
	
	public FaqDto FaqSelectOne(int no) {
		FaqDto faqDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		faqDto = sqlSession.selectOne("FaqSelectOne", no);
		sqlSession.close();
		
		return faqDto;
	}
	
	public int FaqTotal() {
		int total = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("FaqTotal");
		sqlSession.close();
		
		return total;
	}
	
	public int FaqTotal(String txt) {
		int total = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("FaqTxtTotal", txt);
		sqlSession.close();
		
		return total;
	}
	
	public int FaqTotal(String txt, String category) {
		int total = 0;
		
		Map<String, String> map = new HashMap<>();
		map.put("txt", txt);
		map.put("category", category);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("FaqSearchTotal", map);
		sqlSession.close();
		
		return total;
	}
	
	public int FaqUpdate(FaqDto faqDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("FaqUpdate", faqDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public int FaqDelete(int no) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("FaqDelete", no);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public List<FaqDto> FaqSearch(String txt, String category) {
		List<FaqDto> searchList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("txt", txt);
		map.put("category", category);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		searchList = sqlSession.selectList("FaqSearch", map);
		sqlSession.close();
		
		return searchList;
	}
	
	public List<FaqDto> FaqListSearch(String txt, String category, int startNum, int endNum) {
		List<FaqDto> searchList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("txt", txt);
		map.put("category", category);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		searchList = sqlSession.selectList("FaqListSearch", map);
		sqlSession.close();
		
		return searchList;
	}
	
	public List<FaqDto> FaqListTxtSearch(String txt, int startNum, int endNum) {
		List<FaqDto> searchList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("txt", txt);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		searchList = sqlSession.selectList("FaqListTxtSearch", map);
		sqlSession.close();
		
		return searchList;
	}
}

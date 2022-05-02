package com.simmons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int AsTotal() {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("AsTotal");
		sqlSession.close();
		
		return result;
	}

	public int AsSearchTotal(String category, String txt) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("AsSearchTotal", map);
		sqlSession.close();
		
		return result;
	}

	public List<AsDto> AsSearchList(String category, String txt, int startNum, int endNum) {
		List<AsDto> counselList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("txt", txt);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		counselList = sqlSession.selectList("AsSearchList", map);
		sqlSession.close();
		
		return counselList;
	}

	public List<AsDto> AsList(int startNum, int endNum) {
		List<AsDto> counselList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		counselList = sqlSession.selectList("AsList", map);
		sqlSession.close();
		
		return counselList;
	}

	public int AsNoReply() {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("AsNoReply");
		sqlSession.close();
		
		return result;
	}

	public AsDto AsView(int no) {
		AsDto asDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		asDto = sqlSession.selectOne("AsView", no);
		sqlSession.close();
		
		return asDto;
	}

	public int AsReply(String answer, int no) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("answer", answer);
		map.put("no", no);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("AsReply", map);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int AsDelete(int no) {
		int result = 0;
		
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("AsDelete", no);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}

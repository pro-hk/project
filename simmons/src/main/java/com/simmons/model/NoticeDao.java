package com.simmons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int NoticeWrite(NoticeDto noticeDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("NoticeWrite", noticeDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public List<NoticeDto> NoticeAllList() {
		List<NoticeDto> noticeList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeList = sqlSession.selectList("NoticeAllList");
		sqlSession.close();
		
		return noticeList;
	}
	

	public List<NoticeDto> NoticeList(int startNum, int endNum) {
		List<NoticeDto> noticeList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeList = sqlSession.selectList("NoticeList", map);
		sqlSession.close();
		
		return noticeList;
	}

	public NoticeDto NoticeSelectOne(int no) {
		NoticeDto noticeDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeDto = sqlSession.selectOne("NoticeSelectOne", no);
		sqlSession.close();
		
		return noticeDto;
	}

	public NoticeDto NoticePrevSelect(int num) {
		NoticeDto noticeDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeDto = sqlSession.selectOne("NoticePrevSelect", num);
		sqlSession.close();
		
		return noticeDto;
	}
	
	public NoticeDto NoticeNextSelect(int num) {
		NoticeDto noticeDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeDto = sqlSession.selectOne("NoticeNextSelect", num);
		sqlSession.close();
		
		return noticeDto;
	}

	public List<NoticeDto> NoticeSearchList(String option, String txt, int startNum, int endNum) {
		List<NoticeDto> noticeList = null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("txt", txt);
		map.put("option", option);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		noticeList = sqlSession.selectList("NoticeSearchList", map);
		sqlSession.close();
		
		return noticeList;
	}

	public int NoticeNum(int no) {
		int num = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		num = sqlSession.selectOne("NoticeNum", no);
		sqlSession.close();
		
		return num;
	}

	public int NoticeTotal() {
		int total = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("NoticeTotal");
		sqlSession.close();
		
		return total;
	}
	
	public int NoticeSearchTotal(String option, String txt) {
		int total = 0;
		
		Map<String, String> map = new HashMap<>();
		map.put("txt", txt);
		map.put("option", option);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("NoticeSearchTotal", map);
		sqlSession.close();
		
		return total;
	}
}

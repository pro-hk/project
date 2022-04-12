package com.simmons.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int insert(MemberDto memberDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insert", memberDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public MemberDto getLoggedMember(MemberDto memberDto){
		MemberDto loggedMember = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		loggedMember = sqlSession.selectOne("getLoggedMember", memberDto);
		sqlSession.close();
		
		return loggedMember;
	}
}

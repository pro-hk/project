package com.simmons.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	MemberDto memberDto;
	
	public int insertMember(MemberDto memberDto) {	// < ---------- memberDto
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMember",memberDto);
		sqlSession.commit();
		sqlSession.close();
		return result;	
	}
	
	
	public MemberDto loginMember(MemberDto pMemberDto) {	// < ---------- pMemberDto
		MemberDto memberDto = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDto = sqlSession.selectOne("loginMember",pMemberDto);
		sqlSession.close();
		return memberDto;		
	}
	
	public MemberDto deliveryCheck (MemberDto pMemberDto) {		//배송조회
		MemberDto memberDto = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDto = sqlSession.selectOne("DeliveryCheck",pMemberDto);
		sqlSession.close();
		return memberDto;					
		
	}
	
	public List<MemberDto> showInfo (MemberDto memberDto){
		List<MemberDto> memberInfo = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberInfo = sqlSession.selectList("showInfo",memberDto);
		sqlSession.close();
		return memberInfo;
	}
	
//	회원정보 수정 전 아디 비번 확인
	public MemberDto pwConfirm(MemberDto pMemberDto) {
		memberDto = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDto = sqlSession.selectOne("pwConfirm",pMemberDto);
		sqlSession.close();
		return memberDto;
	}
	
	public int updatePw(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updatePw",memberDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	
	
//	회원정보 수정
	public int updateMember(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateMember",memberDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
//	계정삭제
	public int deleteMember(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteMember",memberDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
//	회원등급 변경
	public int changeGrade(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("changeGrade",memberDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}


	public int IdCheck(String id) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("IdCheck", id);
		sqlSession.close();
		return result;
	}
}

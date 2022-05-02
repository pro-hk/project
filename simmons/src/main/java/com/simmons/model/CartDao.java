package com.simmons.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CartDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public int CartInsert(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("CartInsert", cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public int CartUpdate(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("CartUpdate",cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public List<CartDto> CartSelectList(String id) {
		List<CartDto> cartList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		cartList = sqlSession.selectList("CartSelectList", id);
		sqlSession.close();
		
		return cartList;
	}

	public int CartDelete(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("CartDelete",cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
		
	}

	public List<CartDto> RecentSelectList(String id) {
		List<CartDto> recentList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		recentList = sqlSession.selectList("RecentSelectList", id);
		sqlSession.close();
		
		return recentList;
	}

	public int RecentInsert(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("RecentInsert", cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public int RecentDelete(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("RecentDelete",cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
		
	}

	public int WishInsert(CartDto cartDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("WishInsert",cartDto);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public List<CartDto> WishSelectList(String id) {
		List<CartDto> recentList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		recentList = sqlSession.selectList("WishSelectList", id);
		sqlSession.close();
		
		return recentList;
	}

	public int WishDelete(String pname) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("WishDelete",pname);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}

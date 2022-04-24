package com.simmons.model;

import java.util.HashMap;
import java.util.List;
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

	public int colorInsert(Map<String, String> colorMap) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("colorInsert", colorMap);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}

	public ProductDto SelectOne(int no) {
		ProductDto productDto = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		productDto = sqlSession.selectOne("SelectOne", no);
		sqlSession.close();
		
		return productDto;
	}

	public String getHContents(String hardness) {
		String Hcontents = "";
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Hcontents = sqlSession.selectOne("getHContents", hardness);
		sqlSession.close();
		
		return Hcontents;
	}

	public List<ProductSizeDto> getSizes(String pname) {
		List<ProductSizeDto> sizeList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sizeList = sqlSession.selectList("getSizes", pname);
		sqlSession.close();
		
		return sizeList;
	}

	public List<ProductDto> getProductAllList() {
		List<ProductDto> productList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		productList = sqlSession.selectList("getProductAllList");
		sqlSession.close();
		
		return productList;
	}

	public int getPrice(String sizes, String pname) {
		int result = 0;
		Map<String, String> map = new HashMap<>();
		
		map.put("sizes", sizes);
		map.put("pname", pname);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("getPrice", map);
		sqlSession.close();
		
		return result;
	}

	public List<ProductDto> getProductSList(String sizes) {
		List<ProductDto> productList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		productList = sqlSession.selectList("getProductSList", sizes);
		sqlSession.close();
		
		return productList;
	}

	public List<ProductDto> getProductHList(String hardness) {
		List<ProductDto> productList = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		productList = sqlSession.selectList("getProductHList", hardness);
		sqlSession.close();
		
		return productList;
	}

	public List<ProductDto> getProductSHList(String sizes, String hardness) {
		List<ProductDto> productList = null;
		
		Map<String, String> map = new HashMap<>();
		
		map.put("sizes", sizes);
		map.put("hardness", hardness);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		productList = sqlSession.selectList("getProductSHList", map);
		sqlSession.close();
		
		return productList;
	}

	public String GetPname(int no) {
		String pname = "";
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		pname = sqlSession.selectOne("GetPname", no);
		sqlSession.close();
		
		return pname;
	}
}

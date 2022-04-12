package com.simmons.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.ProductDao;
import com.simmons.model.ProductDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductDto productDto;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/Mattress")
	public String mattress() {
		return "product/mattress";
	}
	@RequestMapping("/Detail")
	public String detail() {
		return "product/detail";
	}
	
	
	@RequestMapping("/Insert")
	public String insert(HttpServletResponse response) throws Exception{
		return "product/insert";
	}
	
	@RequestMapping("/InsertProcess")
	public void insertProcess(ProductDto productDto, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// sizes 입력
		Map<String, String> sizesMap = new HashMap<>();		
		int count = 0;
		for(int i=1; true; i++) {
			String sizes0i = request.getParameter("sizes0"+i);
			if(sizes0i.equals("")||sizes0i==null) {
				System.out.println("입력종료");
				ScriptWriter.alert(response, "총 "+count+"개 사이즈 입력 완료");
				break;
			}
			String spec0i = request.getParameter("spec0"+i);
			String price0i = request.getParameter("price0"+i);
			sizesMap.put("pname", productDto.getPname());
			sizesMap.put("sizes", sizes0i);
			sizesMap.put("spec", spec0i);
			sizesMap.put("price", price0i);
			int sizesResult = productDao.sizesInsert(sizesMap);
			if(sizesResult > 0) {
				count++;
			}
		}

		// product 입력
		//int result = productDao.productInsert(productDto);
		int result = 0;
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "제품 입력 완료", "Insert");
			
		} else {
			ScriptWriter.alertAndBack(response, "제품 입력 오류");
		}
		
		
	}
	
	@RequestMapping("/List")
	public String list(HttpServletResponse response) {
		return "product/list";
	}
	
	@RequestMapping("/Order")
	public String order() {
		return "product/order";
	}
}
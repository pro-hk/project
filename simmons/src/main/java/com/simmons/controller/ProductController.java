package com.simmons.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simmons.model.CartDao;
import com.simmons.model.CartDto;
import com.simmons.model.ProductDao;
import com.simmons.model.ProductDto;
import com.simmons.model.ProductSizeDto;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductDto productDto;
	
	@Autowired
	ProductDao productDao;

	@Autowired
	CartDao cartDao;
	
	@RequestMapping("/Mattress")
	public String mattress(Model model) {
		List<ProductDto> productList = productDao.getProductAllList();
		if(productList!=null) {
			model.addAttribute("productList", productList);
		}
		return "product/mattress";
	}
	
	@RequestMapping("/MattressList")
	@ResponseBody
	public List<ProductDto> mattressList(HttpServletRequest request) {
		List<ProductDto> productList = null;
		String sizes = request.getParameter("sizes");
		String hardness = request.getParameter("hardness");
		if(sizes == "" && hardness == "") {
			productList = productDao.getProductAllList();
		} else if(sizes != "" && hardness == "") {
			productList = productDao.getProductSList(sizes);
		} else if(sizes == "" && hardness != "") {
			productList = productDao.getProductHList(hardness);
		} else {
			productList = productDao.getProductSHList(sizes, hardness);
		}
		return productList;
	}
	
	@RequestMapping("/Detail")
	public String detail(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		productDto = productDao.SelectOne(no);
		if(productDto!=null) {
			String hardnessContents = productDao.getHContents(productDto.getHardness());
			List<ProductSizeDto> sizeList = productDao.getSizes(productDto.getPname());
			model.addAttribute("productDto", productDto);
			model.addAttribute("hardnessContents", hardnessContents);
			model.addAttribute("sizeList", sizeList);
		}
		
		return "product/detail";
	}
	
	@RequestMapping("/Size")
	@ResponseBody
	public int size(HttpServletRequest request) {
		String sizes = request.getParameter("size").split(" ")[0];
		String pname = request.getParameter("pname");
		int price = productDao.getPrice(sizes, pname);
		
		return price;
	}
	
	@RequestMapping("/Order")
	public String order() {
		return "product/order";
	}
	
	@RequestMapping("/OrderInfo")
	public String orderInfo() {
		return "product/orderInfo";
	}
	
	// 카트
	@RequestMapping("/CartAdd")
	@ResponseBody
	public List<CartDto> CartAdd(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String pname = request.getParameter("pname");
		String img = request.getParameter("img");
		String sizes = request.getParameter("sizes");
		int count = Integer.parseInt(request.getParameter("count"));
		String tempPrice = request.getParameter("price").split(" ")[1];
		String price = "";
		String[] priceList = tempPrice.split(",");
		for(int i=0; i< priceList.length; i++) {
			price += priceList[i];
		}
		String id = " ";
		if(session.getAttribute("loggedID")!=null) {
			id = (String)session.getAttribute("loggedID");
		}
		String value = no+"&"+pname+"&"+img+"&"+count+"&"+price+"&"+sizes+"&"+id;
		
		int cookieMax = 1;
		
		boolean cookieCheck = false;
		List<CartDto> cartList = new ArrayList<>();
		if(session.getAttribute("loggedMember")==null) {
			Cookie[] cookieList = request.getCookies();
			for(int i = 0; i < cookieList.length; i++) {
				CartDto cartDto = new CartDto();
				String cookieName = cookieList[i].getName();
				if(cookieName.contains("cartNo")) {
					// 쿠키 이름(max+1)
					int num = Integer.parseInt(cookieName.split("o")[1]);
					if(cookieMax <= num) cookieMax = num + 1;
					
					// 쿠키 value 분해
					String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
					int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
					String cookiePname = cookieValue.split("&")[1];
					String cookieImg = cookieValue.split("&")[2];
					int cookieCount = Integer.parseInt(cookieValue.split("&")[3]);
					String cookiePrice = cookieValue.split("&")[4];
					String cookieSizes = cookieValue.split("&")[5];
					String cookieId = cookieValue.split("&")[6];
					
					// 중복 확인
					if(cookieNo == no && cookieSizes.equals(sizes)) {
						cookieCount = count+cookieCount;
						cookiePrice = Integer.toString(Integer.parseInt(price)*cookieCount);
						cookieValue = cookieNo+"&"+cookiePname+"&"+cookieImg+"&"+cookieCount+"&"+cookiePrice+"&"+cookieSizes+"&"+cookieId;
						cookieCheck = true;
						Cookie addCookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
						addCookie.setMaxAge(60*60*24*30);
						addCookie.setPath("/");
						response.addCookie(addCookie);
					}
					// Session용 DTO 추가
					cartDto.setNo(cookieNo);
					cartDto.setPname(cookiePname);
					cartDto.setImg(cookieImg);
					cartDto.setCount(cookieCount);
					cartDto.setPrice(cookiePrice);
					cartDto.setSizes(cookieSizes);
					cartDto.setId(cookieId);
					cartList.add(cartDto);
				}
			}
		} else {
			cartList = cartDao.CartSelectList(id);
			for(int i = 0; i< cartList.size(); i++) {
				CartDto cartDto = cartList.get(i);
				if(cartDto.getNo() == no && cartDto.getSizes().equals(sizes)) {
					int getCount = cartDto.getCount() + count;
					int getPrice = Integer.parseInt(cartDto.getPrice());
					cartDto.setCount(getCount);
					cartDto.setPrice(Integer.toString(getPrice * getCount));
					cartDao.CartUpdate(cartDto);
					cookieCheck = true;
					System.out.println("업데이트 성공");
				}
			}
		}
		if(!cookieCheck) {
			// Session 추가용 DTO
			CartDto cartDto = new CartDto();
			cartDto.setNo(no);
			cartDto.setPname(pname);
			cartDto.setImg(img);
			cartDto.setCount(count);
			cartDto.setPrice(price);
			cartDto.setSizes(sizes);
			cartDto.setId(id);
			cartList.add(cartDto);
			// 쿠키 입력
			if(session.getAttribute("loggedMember")==null) {
				Cookie addCart = new Cookie("cartNo" + cookieMax, URLEncoder.encode(value, "UTF-8"));
				addCart.setMaxAge(60*60*24*30);
				addCart.setPath("/");
				response.addCookie(addCart);
			} else {
				// 회원이면 DB저장
				int result = cartDao.CartInsert(cartDto);
				if(result > 0) {
					System.out.println("입력 성공");
				}
			}
		}
		session.setAttribute("cartList", cartList);
		session.setAttribute("cartCount", cartList.size());
		
		return cartList;
	}
	
	@RequestMapping("/CartDelete")
	@ResponseBody
	public List<CartDto> CartDelete(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {
		String pname = request.getParameter("pname");
		String sizes = request.getParameter("sizes");
		List<CartDto> cartList = new ArrayList<>();
		
		if(session.getAttribute("loggedID")==null) {
			Cookie[] cookieList = request.getCookies();
			for(int i = 0; i < cookieList.length; i++) {
				String cookieName = cookieList[i].getName();
				if(cookieName.contains("cartNo")) {
					CartDto cartDto = new CartDto();
					String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
					int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
					String cookiePname = cookieValue.split("&")[1];
					String cookieImg = cookieValue.split("&")[2];
					int cookieCount = Integer.parseInt(cookieValue.split("&")[3]);
					String cookiePrice = cookieValue.split("&")[4];
					String cookieSizes = cookieValue.split("&")[5];
					String cookieId = cookieValue.split("&")[6];
					if(cookiePname.equals(pname) && cookieSizes.equals(sizes)) {
						Cookie addCart = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
						addCart.setMaxAge(0);
						addCart.setPath("/");
						response.addCookie(addCart);
						continue;
					}
					cartDto.setNo(cookieNo);
					cartDto.setPname(cookiePname);
					cartDto.setImg(cookieImg);
					cartDto.setCount(cookieCount);
					cartDto.setPrice(cookiePrice);
					cartDto.setSizes(cookieSizes);
					cartDto.setId(cookieId);
					cartList.add(cartDto);
				}
			}
		} else {
			String id = (String)session.getAttribute("loggedID");
			cartList = cartDao.CartSelectList(id);
			for(int i = 0; i< cartList.size(); i++) {
				CartDto cartDto = new CartDto();
				cartDto = cartList.get(i);
				if(cartDto.getPname().equals(pname) && cartDto.getSizes().equals(sizes)) {
					int result = cartDao.CartDelete(cartDto);
					if(result > 0) {
						System.out.println("카트 삭제");
						cartList = cartDao.CartSelectList(id);
					}
				}
			}
		}
		session.setAttribute("cartList", cartList);
		session.setAttribute("cartCount", cartList.size());
		return cartList;
	}
	
	// Recent
	@RequestMapping("/RecentAdd")
	@ResponseBody
	public List<CartDto> RecentAdd(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String pname = productDao.GetPname(no).split(" ")[1];
		String img = request.getParameter("img");
		String id = " ";
		if(session.getAttribute("loggedID")!=null) {
			id = (String)session.getAttribute("loggedID");
		}
		String value = no+"&"+pname+"&"+img+"&"+id;
		
		int cookieMax = 1;
//			
		boolean cookieCheck = false;
		List<CartDto> recentList = new ArrayList<>();
		if(session.getAttribute("loggedMember")==null) {
			Cookie[] cookieList = request.getCookies();
			for(int i = 0; i < cookieList.length; i++) {
				CartDto cartDto = new CartDto();
				String cookieName = cookieList[i].getName();
				if(cookieName.contains("recentNo")) {
					// 쿠키 이름(max+1)
					int num = Integer.parseInt(cookieName.split("o")[1]);
					if(cookieMax <= num) cookieMax = num + 1;
					
					// 쿠키 value 분해
					String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
					int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
					String cookiePname = cookieValue.split("&")[1];
					String cookieImg = cookieValue.split("&")[2];
					String cookieId = cookieValue.split("&")[3];
					
					// 중복 확인
					if(cookieNo == no) {
						cookieCheck = true;
					}
					// Session용 DTO 추가
					cartDto.setNo(cookieNo);
					cartDto.setPname(cookiePname);
					cartDto.setImg(cookieImg);
					cartDto.setId(cookieId);
					recentList.add(cartDto);
				}
			}
		} else {
			recentList = cartDao.RecentSelectList(id);
			for(int i = 0; i< recentList.size(); i++) {
				CartDto cartDto = recentList.get(i);
				if(cartDto.getNo() == no) {
					cookieCheck = true;
					System.out.println("업데이트 성공");
				}
			}
		}
		if(!cookieCheck) {
			// Session 추가용 DTO
			CartDto cartDto = new CartDto();
			cartDto.setNo(no);
			cartDto.setPname(pname);
			cartDto.setImg(img);
			cartDto.setId(id);
			recentList.add(cartDto);
			// 쿠키 입력
			if(session.getAttribute("loggedMember")==null) {
				Cookie addRecent = new Cookie("recentNo" + cookieMax, URLEncoder.encode(value, "UTF-8"));
				addRecent.setMaxAge(60*60*24*30);
				addRecent.setPath("/");
				response.addCookie(addRecent);
			} else {
				// 회원이면 DB저장
				int result = cartDao.RecentInsert(cartDto);
				if(result > 0) {
					System.out.println("입력 성공");
				}
			}
		}
		session.setAttribute("recentList", recentList);
		session.setAttribute("recentCount", recentList.size());
		
		return recentList;
	}
	
	@RequestMapping("/RecentDelete")
	@ResponseBody
	public List<CartDto> RecentDelete(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {
		String pname = request.getParameter("pname");
		List<CartDto> recentList = new ArrayList<>();
		
		if(session.getAttribute("loggedID")==null) {
			Cookie[] cookieList = request.getCookies();
			for(int i = 0; i < cookieList.length; i++) {
				String cookieName = cookieList[i].getName();
				if(cookieName.contains("recentNo")) {
					CartDto cartDto = new CartDto();
					String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
					int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
					String cookiePname = cookieValue.split("&")[1];
					String cookieImg = cookieValue.split("&")[2];
					String cookieId = cookieValue.split("&")[3];
					if(cookiePname.equals(pname)) {
						Cookie addCart = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
						addCart.setMaxAge(0);
						addCart.setPath("/");
						response.addCookie(addCart);
						continue;
					}
					cartDto.setNo(cookieNo);
					cartDto.setPname(cookiePname);
					cartDto.setImg(cookieImg);
					cartDto.setId(cookieId);
					recentList.add(cartDto);
				}
			}
		} else {
			String id = (String)session.getAttribute("loggedID");
			recentList = cartDao.RecentSelectList(id);
			for(int i = 0; i< recentList.size(); i++) {
				CartDto cartDto = new CartDto();
				cartDto = recentList.get(i);
				if(cartDto.getPname().equals(pname)) {
					int result = cartDao.RecentDelete(cartDto);
					if(result > 0) {
						System.out.println("recent 삭제");
						recentList = cartDao.RecentSelectList(id);
					}
				}
			}
		}
		session.setAttribute("recentList", recentList);
		session.setAttribute("recentCount", recentList.size());
		return recentList;
	}
}
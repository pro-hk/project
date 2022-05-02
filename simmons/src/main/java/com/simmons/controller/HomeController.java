package com.simmons.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simmons.model.CartDto;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String Home(HttpSession session, HttpServletRequest request) throws Exception {
		if(session.getAttribute("loggedId")==null) {
			List<CartDto> cartList = new ArrayList<>();
			List<CartDto> recentList = new ArrayList<>();
			Cookie[] cookieList = request.getCookies();
			if(cookieList!=null) {
				for(int i = 0; i < cookieList.length; i++) {
					CartDto cartDto = new CartDto();
					String cookieName = cookieList[i].getName();
					if(cookieName.contains("popupOff")) {
						session.setAttribute("popupOff", cookieName);
					} else {
						session.removeAttribute("popupOff");
					}
					if(cookieName.contains("recentNo")) {
						String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
						int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
						String cookiePname = cookieValue.split("&")[1];
						String cookieImg = cookieValue.split("&")[2];
						cartDto.setNo(cookieNo);
						cartDto.setPname(cookiePname);
						cartDto.setImg(cookieImg);
						recentList.add(cartDto);
					}
					if(cookieName.contains("cartNo")) {
						String cookieValue = URLDecoder.decode(cookieList[i].getValue(), "UTF-8");
						int cookieNo = Integer.parseInt(cookieValue.split("&")[0]);
						String cookiePname = cookieValue.split("&")[1];
						String cookieImg = cookieValue.split("&")[2];
						int cookieCount = Integer.parseInt(cookieValue.split("&")[3]);
						String cookiePrice = cookieValue.split("&")[4];
						String cookieSizes = cookieValue.split("&")[5];
						cartDto.setNo(cookieNo);
						cartDto.setPname(cookiePname);
						cartDto.setImg(cookieImg);
						cartDto.setCount(cookieCount);
						cartDto.setPrice(cookiePrice);
						cartDto.setSizes(cookieSizes);
						cartList.add(cartDto);
					}
				}
			}
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartCount", cartList.size());
			session.setAttribute("recentList", recentList);
			session.setAttribute("recentCount", recentList.size());
		}
		return "index";
	}
}

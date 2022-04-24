package com.simmons.controller;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.simmons.model.FaqDao;
import com.simmons.model.FaqDto;
import com.simmons.model.NoticeDao;
import com.simmons.model.NoticeDto;
import com.simmons.model.ProductDao;
import com.simmons.model.ProductDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	FaqDao faqDao;
	
	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/")
	public String index() {
		return "manager/index";
	}
	@RequestMapping("/MemberList")
	public String memberList() {
		return "manager/memberList";
	}
	@RequestMapping("/ProductList")
	public String productList() {
		return "manager/productList";
	}
	
	@RequestMapping("/ProductInsert")
	public String insert(HttpServletResponse response) throws Exception{
		return "manager/productInsert";
	}
	
	@RequestMapping("/ProductInsertProcess")
	public void insertProcess(ProductDto productDto, 
							  HttpServletResponse response, HttpServletRequest request, 
							  MultipartFile[] multipartFile) throws Exception {
		// sizes 입력
		Map<String, String> sizesMap = new HashMap<>();
		Map<String, String> colorMap = new HashMap<>();
		int countSize = 0;
		for(int i=1; i<6; i++) {
			String sizes = request.getParameter("sizes0"+i);
			if(sizes.equals("")||sizes==null) {
				break;
			}
			countSize++;
		}
		int countColor = 0;
		for(int i=1; i<6; i++) {
			String color = request.getParameter("color0"+i);
			if(color.equals("")||color==null) {
				break;
			}
			countColor++;
		}
		
		for(int i=1; i < countSize+1; i++) {
			String sizes = request.getParameter("sizes0"+i);
			String spec = request.getParameter("spec0"+i);
			String price = request.getParameter("price0"+i);
			if(countColor>1) {
				for(int j=1; j < countColor+1; j++) {
					String color = request.getParameter("color0"+j);
					colorMap.put("pname", productDto.getPname());
					colorMap.put("sizes", sizes);
					colorMap.put("color", color);
					int colorResult = productDao.colorInsert(colorMap);
				}
			}
			sizesMap.put("pname", productDto.getPname());
			sizesMap.put("sizes", sizes);
			sizesMap.put("spec", spec);
			sizesMap.put("price", price);
			int sizesResult = productDao.sizesInsert(sizesMap);
		}
		
		
		
		// product 입력
		String context = request.getContextPath(); // 경로따기..(http://localhost:8090/simmons)
		String imgFolder = "C:\\simmons\\productImage\\"; // 파일 저장 경로 
		String originalFileName = "";
		String dbFileName = "";
		for(int i=0; i<multipartFile.length; i++) {
			String originalName = multipartFile[i].getOriginalFilename(); // 원파일 이름
			String extention = FilenameUtils.getExtension(originalFileName); // 원파일 확장자
			String savedFileName = UUID.randomUUID() + "." + extention; // 저장 파일 이름(16자리 랜덤 + 확장자) 
			File targetFile = new File(imgFolder+savedFileName); // 파일 저장			
			multipartFile[i].transferTo(targetFile);
			if(i==0) { 
				dbFileName += context + "/productImage/" + savedFileName; 
				originalFileName += originalName;
			} else { 
				dbFileName += "," + context + "/productImage/" + savedFileName;
				originalFileName += "," + originalName;
			}
		}
		productDto.setImg(dbFileName);
		productDto.setRealImg(originalFileName);
		
		int result = productDao.productInsert(productDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "제품 입력 완료", "ProductList");
		} else {
			ScriptWriter.alertAndBack(response, "제품 입력 오류");
		}
	}
	
	@ResponseBody
	@RequestMapping("/SummerNoteFileUpload")
	public Map<String, Object> summerNoteFileUpload(MultipartFile summerNoteImage, HttpServletRequest request){
		Map<String, Object> summerNoteMap = new HashMap<>();
		
		// 경로 추가시 ServletAppContext에 파일 경로 추가
		String context = request.getContextPath(); // 경로따기..(http://localhost:8090/simmons)
		String imgFolder = "C:\\simmons\\contents\\"; // 파일 저장 경로 
		String originalFileName = summerNoteImage.getOriginalFilename(); // 원파일 이름
		String extention = FilenameUtils.getExtension(originalFileName); // 원파일 확장자
		String savedFileName = UUID.randomUUID() + "." + extention; // 저장 파일 이름(16자리 랜덤 + 확장자) 
		File targetFile = new File(imgFolder+savedFileName); // 파일 저장
		String dbFileName = context + "/contents/" + savedFileName; // DB 파일 이름
		
		InputStream fileStream;
		try {
			fileStream = summerNoteImage.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			summerNoteMap.put("url",dbFileName);
		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		
		return summerNoteMap;
	}
	
	@RequestMapping("/FaqList")
	public String faqList(Model model, HttpServletRequest request) {
		int page;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println(page);
		int total = faqDao.FaqTotal();
		int listPerPage = 10;
		int lastPage = total / listPerPage + 1;
		
		int startNum = (page - 1) * listPerPage + 1;
		int endNum = page * listPerPage;
		
		List<FaqDto> faqList = faqDao.FaqAllList(startNum, endNum);
		model.addAttribute("faqList", faqList);
		model.addAttribute("lastPage", lastPage);
		
		return "manager/faqList";
	}
	
	@RequestMapping("/FaqWrite")
	public String faqWrite() {
		return "/manager/faqWrite";
	}
	
	@RequestMapping("/FaqWriteProcess")
	public void faqWriteProcess(FaqDto faqDto, HttpServletResponse response) {
		int result = faqDao.FaqWrite(faqDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다.", "FaqList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/FaqView")
	public String faqView(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		FaqDto faqDto = faqDao.FaqSelectOne(no);
		if(faqDto!=null) {
			model.addAttribute("faqDto", faqDto);
		}
		
		return "manager/faqView";
	}
	
	@RequestMapping("/NoticeList")
	public String noticeList(Model model) {
		List<NoticeDto> noticeList = noticeDao.NoticeAllList();
		if(noticeList!=null) {
			model.addAttribute("noticeList", noticeList);
		}
		return "manager/noticeList";
	}
	
	@RequestMapping("/NoticeWrite")
	public String noticeWrite() {
		return "/manager/noticeWrite";
	}
	
	@RequestMapping("/NoticeView")
	public String noticeView(HttpServletRequest request, Model model) {
		int no =  Integer.parseInt(request.getParameter("no"));
		NoticeDto noticeDto = noticeDao.NoticeSelectOne(no);
		if(noticeDto!=null) {
			model.addAttribute("noticeDto", noticeDto);
		}
		
		return "/manager/noticeView";
	}
	
	@RequestMapping("/NoticeWriteProcess")
	public void noticeWriteProcess(NoticeDto noticeDto, HttpServletResponse response) {
		int result = noticeDao.NoticeWrite(noticeDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다", "NoticeList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 수정되지 않았습니다");
		}
	}
	
	@RequestMapping("/FaqUpdate")
	public String faqUpdate(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		FaqDto faqDto = faqDao.FaqSelectOne(no);
		if(faqDto!=null) {
			model.addAttribute("faqDto", faqDto);
		}
		
		return "manager/faqUpdate";
	}
	
	@RequestMapping("/FaqUpdateProcess")
	public void faqUpdateProcess(FaqDto faqDto, HttpServletResponse response) {
		int result = faqDao.FaqUpdate(faqDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 수정되었습니다", "FaqView?no="+faqDto.getNo());
		} else {
			ScriptWriter.alertAndBack(response, "글이 수정되지 않았습니다");
		}
	}
	
	@RequestMapping("/FaqDelete")
	public void faqDelete(HttpServletResponse response, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = faqDao.FaqDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 삭제되었습니다", "FaqList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 삭제되지 않았습니다");
		}
	}
	
	
}

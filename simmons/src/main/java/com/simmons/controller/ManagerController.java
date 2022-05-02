package com.simmons.controller;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.simmons.model.AsDao;
import com.simmons.model.AsDto;
import com.simmons.model.CounselDao;
import com.simmons.model.CounselDto;
import com.simmons.model.FaqDao;
import com.simmons.model.FaqDto;
import com.simmons.model.NoticeDao;
import com.simmons.model.NoticeDto;
import com.simmons.model.ProductDao;
import com.simmons.model.ProductDto;
import com.simmons.model.QnaDao;
import com.simmons.model.QnaDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	FaqDao faqDao;
	
	@Autowired
	QnaDao qnaDao;

	@Autowired
	CounselDao counselDao;

	@Autowired
	AsDao asDao;
	
	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/")
	public String index() {
		return "manager/index";
	}
	
	// ----------------------------------------- cs ----------------------------------------------------
	// FAQ
	@RequestMapping("/FaqList")
	public String faqList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String txt = request.getParameter("txt");
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int total = faqDao.FaqTotal();
		int listPerPage = 10;
		
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		List<FaqDto> faqList = null;
		if(txt == "" || txt == null) {
			faqList = faqDao.FaqListAll(startNum,endNum);
		} else if(category==""){
			faqList = faqDao.FaqListTxtSearch(txt, startNum, endNum);
			total = faqDao.FaqTotal(txt);
		} else {
			faqList = faqDao.FaqListSearch(txt, category, startNum, endNum);
			total = faqDao.FaqTotal(txt, category);
		}
		
		int lastPage;
		if(total % listPerPage == 0) {
			lastPage = total / listPerPage;
		} else {
			lastPage = total / listPerPage + 1;
		}
		
		List<Integer> pageList = new ArrayList<>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("pageList", pageList);
		model.addAttribute("clickPage",clickPage);
		
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
	
		
	@RequestMapping("/FaqEdit")
	public String faqUpdate(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		FaqDto faqDto = faqDao.FaqSelectOne(no);
		if(faqDto!=null) {
			model.addAttribute("faqDto", faqDto);
		}
		
		return "manager/faqEdit";
	}
	
	@RequestMapping("/FaqEditProcess")
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
	
	// QNA
	@RequestMapping("/QnaList")
	public String qnaList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String txt = request.getParameter("txt");
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int total = qnaDao.QnaTotal();
		int listPerPage = 10;
		
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		List<QnaDto> qnaList = null;
		if(category!=null && category!="" && txt!=null && txt.trim()!="") {
			total = qnaDao.QnaSearchTotal(category, txt);
			qnaList = qnaDao.QnaSearchList(category, txt, startNum, endNum);
		} else {
			qnaList = qnaDao.QnaList(startNum, endNum);
		}
		
		int lastPage;
		if(total % listPerPage == 0) {
			lastPage = total / listPerPage;
		} else {
			lastPage = total / listPerPage + 1;
		}
		List<Integer> pageList = new ArrayList<>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
		
		int noReply = qnaDao.QnaNoReply();
		
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("pageList",pageList);
		model.addAttribute("clickPage",clickPage);
		model.addAttribute("noReply",noReply);
		
		return "manager/qnaList";
	}
	
	@RequestMapping("/QnaView")
	public String qnaView(HttpServletRequest request, Model model) {
		int no =  Integer.parseInt(request.getParameter("no"));
		QnaDto qnaDto = qnaDao.QnaView(no);
		if(qnaDto!=null) {
			model.addAttribute("qnaDto", qnaDto);
		}
		
		return "/manager/qnaView";
	}
	
	@RequestMapping("/QnaReply")
	public void qnaReply(HttpServletRequest request, HttpServletResponse response) {
		String answer = request.getParameter("answer");
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = qnaDao.QnaReply(answer, no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "답변이 등록되었습니다", "QnaView?no="+no);
		} else {
			ScriptWriter.alertAndBack(response, "답변이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/QnaDelete")
	public void qnaDelete(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = qnaDao.QnaDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "답변이 삭제되었습니다", "QnaList");
		} else {
			ScriptWriter.alertAndBack(response, "답변이 삭제되지 않았습니다");
		}
	}
	
//	@RequestMapping("/QnaNoReply")
//	public List<QnaDto> QnaNoReply(HttpServletRequest request){
//		String category = request.getParameter("category");
//		String txt = request.getParameter("txt");
//		int clickPage;
//		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
//			clickPage = 1;
//		} else {
//			clickPage = Integer.parseInt(request.getParameter("page"));
//		}
//		int total = faqDao.FaqTotal();
//		int listPerPage = 10;
//		
//		int startNum = (clickPage - 1) * listPerPage + 1;
//		int endNum = clickPage * listPerPage;
//		
//		List<FaqDto> faqList = null;
//		if(txt == "" || txt == null) {
//			faqList = faqDao.FaqListAll(startNum,endNum);
//		} else if(category==""){
//			faqList = faqDao.FaqListTxtSearch(txt, startNum, endNum);
//			total = faqDao.FaqTotal(txt);
//		} else {
//			faqList = faqDao.FaqListSearch(txt, category, startNum, endNum);
//			total = faqDao.FaqTotal(txt, category);
//		}
//		
//		int lastPage;
//		if(total % listPerPage == 0) {
//			lastPage = total / listPerPage;
//		} else {
//			lastPage = total / listPerPage + 1;
//		}
//		
//		List<Integer> pageList = new ArrayList<>();
//		for(int i = 1; i <= lastPage; i++) {
//			pageList.add(i);
//		}
//		
//		model.addAttribute("faqList", faqList);
//		model.addAttribute("pageList", pageList);
//		model.addAttribute("clickPage",clickPage);
// 	}
	
	//Counsel
	@RequestMapping("/CounselList")
	public String counselList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String txt = request.getParameter("txt");
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int total = counselDao.CounselTotal();
		int listPerPage = 10;
		
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		List<CounselDto> counselList = null;
		if(category!=null && category!="" && txt!=null && txt.trim()!="") {
			total = counselDao.CounselSearchTotal(category, txt);
			counselList = counselDao.CounselSearchList(category, txt, startNum, endNum);
		} else {
			counselList = counselDao.CounselList(startNum, endNum);
		}
		
		int lastPage;
		if(total % listPerPage == 0) {
			lastPage = total / listPerPage;
		} else {
			lastPage = total / listPerPage + 1;
		}
		List<Integer> pageList = new ArrayList<>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
		
		int noReply = counselDao.CounselNoReply();
		
		model.addAttribute("counselList",counselList);
		model.addAttribute("pageList",pageList);
		model.addAttribute("clickPage",clickPage);
		model.addAttribute("noReply",noReply);
		
		return "manager/counselList";
	}
	
	@RequestMapping("/CounselView")
	public String counselView(HttpServletRequest request, Model model) {
		int no =  Integer.parseInt(request.getParameter("no"));
		CounselDto counselDto = counselDao.CounselView(no);
		if(counselDto!=null) {
			model.addAttribute("counselDto", counselDto);
		}
		
		return "/manager/counselView";
	}
	
	@RequestMapping("/CounselReply")
	public void counselReply(HttpServletRequest request, HttpServletResponse response) {
		String answer = request.getParameter("answer");
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = counselDao.CounselReply(answer, no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "답변이 등록되었습니다", "CounselView?no="+no);
		} else {
			ScriptWriter.alertAndBack(response, "답변이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("CounselDelete")
	public void counselDelete(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = counselDao.CounselDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "통화내용이 삭제되었습니다", "CounselList");
		} else {
			ScriptWriter.alertAndBack(response, "통화내용이 삭제되지 않았습니다");
		}
	}
	
	//AS
	@RequestMapping("/AsList")
	public String asList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String txt = request.getParameter("txt");
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int total = asDao.AsTotal();
		int listPerPage = 10;
		
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		List<AsDto> asList = null;
		if(category!=null && category!="" && txt!=null && txt.trim()!="") {
			total = asDao.AsSearchTotal(category, txt);
			asList = asDao.AsSearchList(category, txt, startNum, endNum);
		} else {
			asList = asDao.AsList(startNum, endNum);
		}
		
		int lastPage;
		if(total % listPerPage == 0) {
			lastPage = total / listPerPage;
		} else {
			lastPage = total / listPerPage + 1;
		}
		List<Integer> pageList = new ArrayList<>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
		
		int noReply = asDao.AsNoReply();
		
		model.addAttribute("asList",asList);
		model.addAttribute("pageList",pageList);
		model.addAttribute("clickPage",clickPage);
		model.addAttribute("noReply",noReply);
		
		return "manager/asList";
	}
	
	@RequestMapping("/AsView")
	public String asView(HttpServletRequest request, Model model) {
		int no =  Integer.parseInt(request.getParameter("no"));
		AsDto asDto = asDao.AsView(no);
		if(asDto!=null) {
			model.addAttribute("asDto", asDto);
		}
		
		return "/manager/asView";
	}
	
	@RequestMapping("/AsReply")
	public void asReply(HttpServletRequest request, HttpServletResponse response) {
		String answer = request.getParameter("answer");
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = asDao.AsReply(answer, no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "AS처리내용이 등록되었습니다", "AsView?no="+no);
		} else {
			ScriptWriter.alertAndBack(response, "AS처리내용이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("AsDelete")
	public void asDelete(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = asDao.AsDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "AS처리내용이 삭제되었습니다", "AsList");
		} else {
			ScriptWriter.alertAndBack(response, "AS처리내용이 삭제되지 않았습니다");
		}
	}
	
	// NOTICE
	@RequestMapping("/NoticeList")
	public String noticeList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String txt = request.getParameter("txt");
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int total = noticeDao.NoticeTotal();
		int listPerPage = 10;
		
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		List<NoticeDto> noticeList = null;
		if(category!=null && category!="" && txt!=null && txt.trim()!="") {
			total = noticeDao.NoticeSearchTotal(category, txt);
			noticeList = noticeDao.NoticeSearchList(category, txt, startNum, endNum);
		} else {
			noticeList = noticeDao.NoticeList(startNum, endNum);
		}
		
		int lastPage;
		if(total % listPerPage == 0) {
			lastPage = total / listPerPage;
		} else {
			lastPage = total / listPerPage + 1;
		}
		List<Integer> pageList = new ArrayList<>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pageList",pageList);
		model.addAttribute("clickPage",clickPage);
		
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
	
	@RequestMapping("/NoticeEdit")
	public String noticeEdit(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeDto noticeDto = noticeDao.NoticeSelectOne(no);
		if(noticeDto!=null) {
			model.addAttribute("noticeDto", noticeDto);
		}
		
		return "/manager/noticeEdit";
	}
	
	@RequestMapping("/NoticeEditProcess")
	public void noticeEditProcess(NoticeDto noticeDto, HttpServletResponse response) {
		int result = noticeDao.NoticeUpdate(noticeDto);
		if(result > 0) {
			if(result > 0) {
				ScriptWriter.alertAndNext(response, "글이 등록되었습니다", "NoticeList");
			} else {
				ScriptWriter.alertAndBack(response, "글이 수정되지 않았습니다");
			}
		}
	}
	
	@RequestMapping("NoticeDelete")
	public void noticeDelete(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = noticeDao.NoticeDelete(no);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 삭제되었습니다", "NoticeList");
		} else {
			ScriptWriter.alertAndBack(response, "글이 삭제되지 않았습니다");
		}
	}
	
	// -------------------------------------------- product --------------------------------------------------
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
					if(colorResult > 0) {
						System.out.println("color 입력완료");
					}
				}
			}
			sizesMap.put("pname", productDto.getPname());
			sizesMap.put("sizes", sizes);
			sizesMap.put("spec", spec);
			sizesMap.put("price", price);
			int sizesResult = productDao.sizesInsert(sizesMap);
			if(sizesResult > 0) {
				System.out.println("size 입력완료");
			}
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
	
	// ------------------------------------------------- member ----------------------------------------------
	@RequestMapping("/MemberList")
	public String memberList() {
		return "manager/memberList";
	}
}

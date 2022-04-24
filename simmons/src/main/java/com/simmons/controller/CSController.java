package com.simmons.controller;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.simmons.model.QnaDao;
import com.simmons.model.QnaDto;
import com.simmons.util.ScriptWriter;

@Controller
@RequestMapping("/cs")
public class CSController {
	@Autowired
	FaqDao faqDao;
	
	@Autowired
	CounselDao counselDao;
	
	@Autowired
	QnaDao qnaDao;

	@Autowired
	AsDao asDao;
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping("/Faq")
	public String faq(Model model) {
		List<FaqDto> faqList01 = faqDao.FaqList("회원");
		model.addAttribute("faqList01",faqList01);
		return "/cs/faq";
	}
	
	@RequestMapping("/FaqSearch")
	@ResponseBody
	public List<FaqDto> faqSearch(HttpServletRequest request){
		String txt = request.getParameter("txt");
		int category = Integer.parseInt(request.getParameter("category")) - 1;
		String[] faqCategory = {"회원","상품문의","교환/환불/반품","AS/품질보증","주문/배송","기타"};
		List<FaqDto> faqList = null;
		if(txt==""||txt==null) {
			faqList = faqDao.FaqList(faqCategory[category]);
		} else {
			faqList = faqDao.FaqSearchList(txt, faqCategory[category]);
		}
		return faqList;
	}
	
	@RequestMapping("/Qna")
	public String qna(Model model, HttpSession session) {
		String id = (String)session.getAttribute("loggedID");
		List<QnaDto> qnaList = qnaDao.QnaAllList(id);
		model.addAttribute("qnaList", qnaList);
		
		return "/cs/qna";
	}
	
	@RequestMapping("/QnaWrite")
	public String qnaWrite() {
		return "/cs/qnaWrite";
	}
	
	@RequestMapping("/QnaWriteProcess")
	public void qnaWriteProcess(QnaDto qnaDto, HttpServletResponse response, HttpSession session) {
		qnaDto.setId((String)session.getAttribute("loggedID"));
		int result = qnaDao.QnaWrite(qnaDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다.", "Qna");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 이유로 글이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/QnaView")
	public String qnaView(QnaDto qnaDto, HttpSession session, Model model) {
		int no = qnaDto.getNo();
		String id = (String)session.getAttribute("loggedID");
		qnaDto = qnaDao.QnaView(id, no);
		model.addAttribute("qnaDto", qnaDto);
		
		return "cs/qnaView";
	}
	
	@RequestMapping("/Counsel")
	public String counsel() {
		return "/cs/counsel";
	}
	
	@RequestMapping("/CounselWriteProcess")
	public void counselWriteProcess(CounselDto counselDto, HttpServletResponse response) {
		if(counselDto.getMarketing()==null) counselDto.setMarketing("비동의");
		int result = counselDao.CounselWrite(counselDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다", "../");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 이유로 글이 등록되지 않았습니다.");
		}
		
	}
	
	@RequestMapping("/As")
	public String as() {
		return "/cs/as";
	}
	
	@RequestMapping("/AsWrite")
	public void asWriteProcess(HttpServletRequest request, HttpServletResponse response, AsDto asDto,
							   MultipartFile multipartFile) {
		String dbFileName = "";
		String originalFileName = "";
		if(multipartFile.getSize() > 0) {
		// 경로 추가시 ServletAppContext에 파일 경로 추가
		String context = request.getContextPath(); // 경로따기..(http://localhost:8090/simmons)
		String imgFolder = "C:\\simmons\\as\\"; // 파일 저장 경로 
		originalFileName = multipartFile.getOriginalFilename(); // 원파일 이름
		String extention = FilenameUtils.getExtension(originalFileName); // 원파일 확장자
		String savedFileName = UUID.randomUUID() + "." + extention; // 저장 파일 이름(16자리 랜덤 + 확장자) 
		File targetFile = new File(imgFolder+savedFileName); // 파일 저장
		dbFileName = context + "/as/" + savedFileName; // DB 파일 이름
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		asDto.setFileName(dbFileName);
		asDto.setRealFileName(originalFileName);
		if(asDto.getMarketing()==null) asDto.setMarketing("비동의");
		int result = asDao.AsWrite(asDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "글이 등록되었습니다", "../");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 이유로 글이 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("/Notice")
	public String notice(Model model, HttpServletRequest request) {
		String option = request.getParameter("option");
		String txt = request.getParameter("txt");
		
		int clickPage;
		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
			clickPage = 1;
		} else {
			clickPage = Integer.parseInt(request.getParameter("page"));
		}
		int listPerPage = 2;
		
		int total = noticeDao.NoticeTotal();
		int startNum = (clickPage - 1) * listPerPage + 1;
		int endNum = clickPage * listPerPage;
		
		
		List<NoticeDto> noticeList = null;
		if(option!=null && option!="" && option!=null && txt.trim()!="") {
			total = noticeDao.NoticeSearchTotal(option, txt);
			noticeList = noticeDao.NoticeSearchList(option, txt, startNum, endNum);
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
		
		return "/cs/notice";
	}
	
	@RequestMapping("/NoticeView")
	public String noticeView(HttpServletRequest request, Model model, NoticeDto _noticeDto) {
		int no = Integer.parseInt(request.getParameter("no"));
		NoticeDto noticeDto = noticeDao.NoticeSelectOne(_noticeDto.getNo());
		int num = noticeDao.NoticeNum(no);
		NoticeDto prevNoticeDto = noticeDao.NoticePrevSelect(num);
		NoticeDto nextNoticeDto = noticeDao.NoticeNextSelect(num);
		if(noticeDto!=null) {
			model.addAttribute("noticeDto", noticeDto);
			model.addAttribute("prevNoticeDto", prevNoticeDto);
			model.addAttribute("nextNoticeDto", nextNoticeDto);
		}
		return "/cs/noticeView";
	}
	
//	@RequestMapping("/NoticeSearch")
//	@ResponseBody
//	public List<NoticeDto> noticeSearch(HttpServletRequest request) {
//		String option = request.getParameter("option");
//		System.out.println(option);
//		String txt = request.getParameter("txt");
//		System.out.println(txt);
//		
//		int clickPage;
//		if(request.getParameter("page")=="" || request.getParameter("page")==null) {
//			clickPage = 1;
//		} else {
//			clickPage = Integer.parseInt(request.getParameter("page"));
//		}
//		int total = noticeDao.NoticeTotal();
//		int listPerPage = 2;
//		
//		int startNum = (clickPage - 1) * listPerPage + 1;
//		int endNum = clickPage * listPerPage;
//		
//		List<NoticeDto> noticeList = null;
//		if(option!="" && txt!="") {
//			total = noticeDao.NoticeSearchTotal(option, txt);
//			noticeList = noticeDao.NoticeSearchList(option, txt, startNum, endNum);
//		} else {
//			noticeList = noticeDao.NoticeAllList(startNum, endNum);
//		}
//		System.out.println(noticeList);
//		System.out.println("size=="+noticeList.size());
//		
//		int lastPage;
//		if(total % listPerPage == 0) {
//			lastPage = total / listPerPage;
//		} else {
//			lastPage = total / listPerPage + 1;
//		}
//		List<Integer> pageList = new ArrayList<>();
//		for(int i = 1; i <= lastPage; i++) {
//			pageList.add(i);
//		}
//		System.out.println(total+"total");
//		
//		return noticeList;
//	}
}

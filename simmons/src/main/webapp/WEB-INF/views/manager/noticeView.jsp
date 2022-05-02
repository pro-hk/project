<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<!-- main -->
    <main id="main">
      <div class="container">
        <!-- lnb -->
        <ul class="lnb">
          <li><a href="">HOME</a></li>
          <li><a href="">고객센터</a></li>
          <li><a href="">NOTICE VIEW</a></li>
        </ul>

		<div class="txtBox lineOff">
		    <h1>NOTICE VIEW</h1>
		</div>
		
		 <!-- 상단 5개 선택 -->
    <ul class="customerList managerList">
      <li><a href="FaqList">FAQ</a></li>
      <li><a href="QnaList">Q&A</a></li>
      <li><a href="CounselList">1:1 전화상담 신청</a></li>
      <li><a href="AsList">A/S 신청</a></li>
      <li class="on"><a href="NoticeList">공지사항</a></li>
    </ul>
		

		<div class="view">
			<table>
			  <colgroup>
			    <col style="width: 20%" />
				<col style="width: 80%" />
			  </colgroup>
			  <tbody>
			      <tr class="top">
			      <th>제목</th>
			      <td class="left">${noticeDto.title }</td>
			    </tr>
			    <tr class="bottom">
			      <th>내용</th>
			      <td class="left">${noticeDto.contents }</td>
			    </tr>              
			  </tbody>
			</table>
			<div class="btns">
			  <a href="NoticeEdit?no=${noticeDto.no }" class="confirm">수정</a>
			  <a href="NoticeDelete?no=${noticeDto.no }" class="delete">삭제</a>
			  <a href="NoticeList" class="cancel btn">목록</a>
			</div>
		</div>
      </div>
    </main>
    <!-- main end -->
    <script>
    	$(".delete").on("click",()=>{
    		if(confirm('정말 삭제하시겠습니까?')){
    			return true;
    		} else {
    			return false;
    		}
    	})
    </script>
    
<%@ include file="../include/footer.jsp" %>
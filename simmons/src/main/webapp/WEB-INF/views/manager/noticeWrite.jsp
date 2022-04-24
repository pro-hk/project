<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- main -->
    <main id="main">
      <div class="container">
        <!-- lnb -->
        <ul class="lnb">
          <li><a href="">HOME</a></li>
          <li><a href="">고객센터</a></li>
          <li><a href="">NOTICE WRITE</a></li>
        </ul>

		<div class="txtBox lineOff">
		    <h1>NOTICE WRITE</h1>
		</div>

        <!-- form -->
        <form action="NoticeWriteProcess" method="post" id="NoticeWriteProcess">
          
          <table>
            <colgroup>
              <col style="width: 20%" />
              <col style="width: 80%" />
            </colgroup>
            <tbody>
                <tr class="top">
                <th>제목</th>
                <td><input type="text" name="title" class="question" /></td>
              </tr>
              <tr class="bottom">
                <th>내용</th>
                <td class="textarea">
                  <textarea name="contents" id="summernote" class="answer"></textarea>
                </td>
              </tr>              
            </tbody>
          </table>
          <div class="btns">
            <button type="submit" class="comfirm btn">글쓰기</button>
            <a href="NoticeList" class="cancel btn">취소</a>
          </div>
        </form>
        <!-- form end -->
      </div>
    </main>
    <!-- main end -->
    
<%@ include file="../include/footer.jsp" %>
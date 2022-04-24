<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const loggedMember = <%=session.getAttribute("loggedMember")%>;
$(".Qna").on("click", ()=>{
	if(loggedMember==null){
		if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
			location.href="../member/Login";
			return false;
		} else {
			return false;
		}
	}
})
</script>
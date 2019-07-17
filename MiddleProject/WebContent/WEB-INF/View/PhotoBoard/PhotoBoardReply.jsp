<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.vo.MemberVo"%>
<%@ page import="com.pet.vo.*"%>
<%@ page import="com.photoboard.vo.*"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String root = request.getContextPath();
%>
<%
	MemberVo member = (MemberVo) request.getAttribute("member");
	if (member != null) {
		session.setAttribute("id", member.getId());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

function reUpdateForm(r_no){
	$.ajax({
		type:"GET",
		url:"replyupdateform.do?r_no="+r_no,
		dataType:"text",
		error:function(){
			alert("통신실패!!");
		},
		success:function(data){
			$('#reupdateform').html(data);
		}
	});
}

function replyDelete(r_no,no){
	if (confirm("정말 삭제하시겠습니까??") == true){
		$.ajax({
			type:"GET",
			url:"preplydelete.do?r_no="+r_no+"&no="+no,
			dataType:"text",
			error:function(){
				alert("통신실패!!");
			},
			success:function(data){
				getReplyList();
			}
		});
	}
}
</script>
</head>
<body>

	<div>
		<c:forEach var="re" items="${ re }">
			${re.r_n_id}  ${re.r_contents}
			<c:if test="${re.r_n_id == member.n_id}">
			<div onclick="reUpdateForm(${re.r_no})" class="btn btn-primary">수정</div>
			<div onclick="replyDelete(${re.r_no},${re.no})" class="btn btn-primary">삭제</div>
			</c:if>
			<div id="reupdateform"></div>
		</c:forEach>		
	</div>

</body>
</html>
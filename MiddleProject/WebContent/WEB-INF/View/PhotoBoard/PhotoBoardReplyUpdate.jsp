<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function replyUpdate(){
	$.ajax({
		type:"GET",
		url:"preplyUpdate.do",
		data:$("#replyupdate").serialize(),
		dataType:"text",
		error:function(){
			alert("통신실패!!");
		},
		success:function(data){
			getReplyList();
		}
	});
};

function updateCancel(no){
	$.ajax({
		type:"GET",
		url:"gocontent.do?no="+no,
		dataType:"text",
		error:function(){
			alert("통신실패!!");
		},
		success:function(data){
			getReplyList();
		}
	});
};

</script>
</head>
<body>

	<div>
		<form id="replyupdate" method="get">
			<input type="text" name="r_contents" value="${re.r_contents}">
			<input type="hidden" name="r_no" value="${re.r_no}">
			<input type="hidden" name="no" value="${re.no}">
			<div onclick="replyUpdate()" class="btn btn-primary">작성</div>
			<div onclick="updateCancel(${re.no})" class="btn btn-primary">취소</div>
		</form>
	</div>

</body>
</html>
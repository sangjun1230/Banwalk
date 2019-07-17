<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="java.util.*,com.board.biz.*, com.board.dao.*, com.board.vo.*, com.board.controller.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function replyFind(r_no){	
	$.ajax({
		type : "GET",
		url : "replyfind.do?r_no="+r_no,
		data:$("#replyupdate").serialize(),
		dataType : "text",
		error : function(){
			alert("통신실패");
		},
		success : function(data){	
			$("#commentUpdate").html(data);
		}
	});
};

function replyDelete(r_no) {
	
	$.ajax({
		type : "GET",
		url : "replydelete.do?r_no="+r_no,
		data : $("#redelete").serialize(),
		dataType : "text",
		error : function() {
			alert("통신실패!!");
		},
		success : function(data) {
			getReplyList();
		}
	});
};
</script>
</head>
<body>
	<br>
	<br>
	<div class="readReply">
		<table border="1">
			<tr>
				<th>댓글번호</th>
				<th>댓글아이디</th>
				<th>내용</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<!-- forEach 문은 리스트 객체 타입을 꺼낼때 많이 활용된다. -->
			<c:forEach var="row" items="${li}">
				<tr>
					<!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
					<td>${row.r_no}</td>
					<td>${row.r_n_id}</td>
					<td>${row.r_contents}
						<div id="commentUpdate"></div>
					</td>
					<td>
						<!-- 데이터 타입을 사용하는 방법 --> <fmt:parseDate var="r_regdate"
							value="${row.r_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
							value="${r_regdate}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
					<td>

						<div>
							<a onclick="replyFind(${row.r_no})"> 수정 </a>
						</div>

					</td>
					<td>
						 <a onclick="replyDelete(${row.r_no})">삭제</a></td>
				</tr>

			</c:forEach>
		</table>
	</div>


</body>
</html>
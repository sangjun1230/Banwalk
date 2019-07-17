<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.member.vo.MemberVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVo all = (MemberVo) request.getAttribute("all");
	String url = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</script>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

</head>
<body>

	<form action="<%=url%>/pw.do" method="POST">

		<div class="content">

			<div class="card col-md-6 mb-4">
				<h2>비밀번호 찾기</h2>
				<div>



					<input type="text"
						class="form-control form-control-user col-sm-6 mb-3 mb-sm-0"
						name="id" placeholder="id를 입력하세요" /><br> <input type="email"
						class="form-control form-control-user col-sm-6 mb-3 mb-sm-0"
						name="email" placeholder="email을 입력하세요" /><br>
					<button type="submit" class="btn btn-primary"
						onclick="search_pw();">확인</button>
					<button type="reset" class="btn btn-primary"
						onClick="history.back()">돌아가기</button>
				</div>
			</div>
		</div>

	</form>


</body>
</html>
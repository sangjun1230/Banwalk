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
<title>아이디 찾기</title>
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
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>


  <script>
/*  
    function checkz() {
      var getIntro = $("#intro").val().replace(/\s|/gi,'');
      var hobbyCheck = false;
      var getEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var getName= RegExp(/^[가-힣]+$/);
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
      
 
 
      //아이디 공백 확인
      if($("#u_name").val() == ""){
        alert("아이디 입력바람");
        $("#u_name").focus();
        return false;
      }
 
      //이름의 유효성 검사
      if(!getCheck.test($("#tbID").val())){
        alert("형식에 맞게 입력해주세요");
        $("#u_name").val("");
        $("#u_name").focus();
        return false;
      } 
      
      유효성검사...
      
      */

      </script>
      
      
      
</head>




<body>
	<form action="<%=url%>/findid.do" method="POST">

		<div class="content">
			
			<div class="card col-md-6 mb-4">
			<h2>아이디 찾기</h2>
				<div>
					<ul class="name_search">
						<form name="idSchForm" action="" method="post">
							<input
								class="form-control form-control-user col-sm-6 mb-3 mb-sm-0"
								name="u_name" type="text" placeholder="이름"> <input
								class="form-control form-control-user col-sm-6 mb-3 mb-sm-0"
								name="email" type="email" placeholder="이메일 주소"> <br>
							<button type="submit" class="btn btn-primary"
								onclick="search_id();">확인</button>
							<button type="reset" class="btn btn-primary"
								onClick="history.back()">돌아가기</button>
						</form>
					</ul>
<ul class="text_conA">
				위 방법으로 진행이 어려우신 경우
				<a href="maito:baram0315@naver.com" class="a0_color">baram0315@naver.com</a>
				로 문의하실 수 있습니다. (업무일 기준 300일 이내 회신하여 드립니다.)
			</ul>
				</div>

			</div>
		</div>
		<footer>

			
		</footer>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.photoboard.vo.*, java.util.*"%>
<%@ page import="com.member.vo.MemberVo" %>
<%@ page import="com.pet.vo.*" %>
<%
	String root = request.getContextPath();
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	MemberVo member = (MemberVo) request.getAttribute("member");
	if (member != null) {
		session.setAttribute("id", member.getId());
	}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>반걸음 - 반려견과 함께 걷는 길</title>

<!-- css -->
<link rel="stylesheet" href="css/test13.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/slick-theme.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=B612+Mono:400,700"
	rel="stylesheet">
<!-- font-family: 'B612 Mono', monospace; -->
<link href="https://fonts.googleapis.com/css?family=Squada+One"
	rel="stylesheet">
<!-- font-family: 'Squada One', cursive; -->
<link
	href="https://fonts.googleapis.com/css?family=Heebo:100,300,400,500,700,800,900"
	rel="stylesheet">
<!-- font-family: 'Heebo', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css?family=Neuton:200,300,400,700,800|Poiret+One"
	rel="stylesheet">
<!-- font-family: 'Neuton', serif; -->

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">


<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${path}/">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">반걸음</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="${path}/">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>산책길</span>
			</a></li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="far fa-clipboard"></i> <span>커뮤니티</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">커뮤니티:</h6>
						<a class="collapse-item" href="<%=root%>/board.do">게시판</a> <a
							class="collapse-item" href="<%=root%>/gophotoboard.do">사진판</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-cog"></i> <span>회원정보</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">회원정보:</h6>
						<% if(session.getAttribute("id")==null) { %>
							<a class="collapse-item" href="login.do">개인정보수정</a>
							<a class="collapse-item" href="login.do">반려견 정보 추가 및 수정</a>
						<%} else { %>
							<a class="collapse-item" href="update.do">개인정보수정</a>
							<a class="collapse-item" href="petselect.do">반려견 정보 추가 및 수정</a>
						<% } %>
						<div class="collapse-divider"></div>
					</div>
				</div></li>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
						</a> 
						
						<%
					 	if (session.getAttribute("id") == null) {
 						%>
						<li class="nav-item">
						<a class="nav-link" href="/MiddleProject/login.do" style="color: black;">로그인</a>
						</li>


						<%
							} else {
						%>
						<li class="nav-item"><span
							class="mr-2 d-none d-lg-inline text-gray-600 small">${member.n_id}</span></li>
						<li class="nav-item"><a class="nav-link"
							style="color: black;" href="/MiddleProject/logout.do"> 로그 아웃
						</a></li>

						<%
							}
						%>
						<!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/MiddleProject/update.do"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
								</a> <a class="dropdown-item" href="petUpdate.do"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 나의 반려견
									보기  
								</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->



								<div class="container" id="contents">
				<div class="row d-flex justify-content-center">
					<a href="<%=root%>/gophotoboardpost.do">
						<h3>글쓰기</h3>
					</a>
				</div>

					<div class="row d-flex justify-content-center">
						<c:forEach var="vo" items="${ all }">
							<div class="p-2" style="width: 320px; height: 320px;">
								<a href="gocontent.do?no=${vo.no}">
									<img src="<%=root%>/img/${ vo.url }" style="width: 100%; height: 100%;">
								</a>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; 반걸음 2019</span>
						</div>
						
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하실
							건가요?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">정말 로그아웃 하실 건가요? 고객님의 반려견이 더 뛰어 놀고
						싶어합니다.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="${path}/">로그아웃</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>

		<script src="js/jquery-1.12.4.js"></script>
		<script src="js/jquery-ui-1.12.1.min.js"></script>
		<script src="js/test.js"></script>
</body>
</html>	 		
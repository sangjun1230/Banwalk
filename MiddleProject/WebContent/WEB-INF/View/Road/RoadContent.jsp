<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.vo.*"%>
<%@ page import="com.pet.*"%>
<%@ page import="com.photoboard.*"%>
<%@ page import="com.road.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String root = request.getContextPath();
%>
<%
	RoadVo vo = (RoadVo)request.getAttribute("vo");
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

<link rel="stylesheet" href="css/test13.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/slick-theme.css">
<link href="https://fonts.googleapis.com/css?family=B612+Mono:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Squada+One"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Heebo:100,300,400,500,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Neuton:200,300,400,700,800|Poiret+One"
	rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
					
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=root%>">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">반걸음</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="<%=root%>">
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
						<a class="collapse-item" href="board.do">게시판</a> <a
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
						<h6 class="collapse-header">회원정보</h6>
						<a class="collapse-item" href="/MiddleProject/update.do">개인정보
							수정</a>
						<!-- register가 아닌 수정페이지 만들어서 그 쪽으로 -->
						<a class="collapse-item" href="petselect.do">반려견 정보 추가 및 수정</a>
						<!-- register가 아닌 수정페이지 만들어서 그 쪽으로 -->
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
							aria-expanded="false"> <!--로그인 , 회원가입 버튼 만들고 회원전용 서비스 누르면 로그인창 띄워서 회원가입 할 수 있도록  -->
								<!--  <span class="mr-2 d-none d-lg-inline text-gray-600 small">닉네임 n_id </span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"> -->
						
						</a> <%if (session.getAttribute("id") == null) {%>
						<li class="nav-item"><a class="nav-link"
							href="/MiddleProject/login.do" style="color: black;"> <!-- 아이콘 <i class="fas fa-sign-in-alt"></i> -->
								로그인
						</a></li>


						<%
							} else {
						%>
						<li class="nav-item"><span class="mr-2 d-none d-lg-inline text-gray-600 small">${member.n_id}</span></li>
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
							</a> <a class="dropdown-item" href="/MiddleProject/petUpdate.do">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 나의
								반려견 보기
							</a>

							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal"
								data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div>

						</li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Page Content -->
				<div class="container">
					<div class="row">
						<div><img src="<%=root%>/roadimg/${vo.photourl}"></div>
						<div>${vo.sttreestretnm}</div>
						<div>${vo.sttreestretintrcn}</div>
					</div>
				</div>

				
				<div id="map" style="width:500px;height:400px;"></div>
						
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf53c230e2a339588bcf86d790112fd4"></script>
					
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng("${vo.startlnmadr}","${vo.startlatitude}"),
							level: 3
						};
				
						var map = new daum.maps.Map(container, options);
						// 마커가 표시될 위치입니다 
						var markerPosition  = new daum.maps.LatLng("${vo.startlnmadr}","${vo.startlatitude}"); 
						var markerPosition2 = new daum.maps.LatLng("${vo.endlnmadr}","${vo.endlatitude}");
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
						    position: markerPosition
						});
						var marker2 = new daum.maps.Marker({
						    position: markerPosition2
						});
						
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						marker2.setMap(map);
						
						var iwContent = '<div style="padding:2px;">시작점</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    	iwPosition = new daum.maps.LatLng("${vo.startlnmadr}","${vo.startlatitude}"); //인포윈도우 표시 위치입니다
					    
						var iwContent2 = '<div style="padding:2px;">도착점</div>', 
				    		iwPosition2 = new daum.maps.LatLng("${vo.endlnmadr}","${vo.endlatitude}");
				    	
						// 인포윈도우를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						
						var infowindow2 = new daum.maps.InfoWindow({
						    position : iwPosition2, 
						    content : iwContent2 
						});
						  
						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker); 
						infowindow2.open(map, marker2);
					</script>
					


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
						<a class="btn btn-primary" href="login.html">로그아웃</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.vo.MemberVo"%>
<%@ page import="com.pet.vo.*"%>
<%@ page import="com.photoboard.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>반걸음 - 반려견과 함께 걷는 길</title>

  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body id="page-top">

  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" >

      <a class="sidebar-brand d-flex align-items-center justify-content-center"  href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">반걸음</div>
      </a>

      <hr class="sidebar-divider my-0">

      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>산책길</span></a>
      </li>

      <hr class="sidebar-divider">


      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="far fa-clipboard"></i>
          <span>커뮤니티</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">커뮤니티:</h6>
            <a class="collapse-item" href="<%=root%>/board.do">게시판</a>
            <a class="collapse-item" href="<%=root%>/gophotoboard.do">사진판</a>
          </div>
        </div>
      </li>


      <hr class="sidebar-divider">


      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-cog"></i>
          <span>회원정보</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
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
        </div>
      </li>

      <hr class="sidebar-divider d-none d-md-block">


	 <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div> 

    </ul>



    <div id="content-wrapper" class="d-flex flex-column">


      <div id="content">


        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>


          <ul class="navbar-nav ml-auto">
            

            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              </a>
              <%
 				if (session.getAttribute("id") == null) {
 			   %>
						<li class="nav-item"><a class="nav-link"
							href="/MiddleProject/login.do" style="color: black;"> <!-- 아이콘 <i class="fas fa-sign-in-alt"></i> -->
								로그인
						</a></li>


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
              

              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/MiddleProject/update.do">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
            	     프로필
                </a>
                <a class="dropdown-item" href="/MiddleProject/petUpdate.do">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
  	     	           나의 반려견 보기
                </a>
            
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>


  <div class="container">

    <div class="row">
		<form:form modelAttribute="vo" enctype="multipart/form-data">
			
			<div class="row">
				<label for="inputtitle">제목</label>
				<form:input path="title" /><br>
			</div>
			
			<div class="row">
				<label for="inputcontents">내용</label>
				<form:input path="contents"  /><br>
			</div>
			
			<label for="fileupload">파일</label>
			<form:input type="file" path="file" /><br>
	
			<p style="color: red; font-weight: bold">
			<form:errors path="file"/></p><br>
	
			<input type="submit" class="btn btn-dark" value="작성완료!!" />
		</form:form>


    </div>


  </div>



      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; 반걸음 2019</span>
          </div>
        </div>
      </footer>


    </div>


  </div>



  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하실 건가요?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">정말 로그아웃 하실 건가요? 고객님의 반려견이 더 뛰어 놀고 싶어합니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="login.html">로그아웃</a>
        </div>
      </div>
    </div>
  </div>


  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>


  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.member.vo.MemberVo,com.pet.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<PetVo> all = (List<PetVo>) request.getAttribute("all");
	/* List<MemberVo> all1 = (List<MemberVo>) request.getAttribute("all1"); */
%>

<%--  <%
 
	MemberVo member = (MemberVo) request.getAttribute("member");
	if(member != null){
		session.setAttribute("id", member.getId());
	}

%>  --%>

<%
	String url = request.getContextPath();
	/* String UserID = (String) session.getAttribute("UserID");
	MemberVo memberID = (MemberVo) request.getAttribute("member");
	memberID.getId(); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 테이블</title>
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


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-striped">

					<thead>
						<tr>
							<!-- <th>성별</th> -->
							<th scope="col">반려견 이름</th>
							<th scope="col">성별</th>
							<th scope="col">크기</th>
							<th scope="col">생년월일</th>
							<th scope="col"></th>
							<th scope="col"></th>

						</tr>
					</thead>

					<tbody>
						<!-- List<PetVo> all = petBiz.getPetAll(member.getId());  -->
						<c:forEach var="pet" items="${all}">
							<tr class="odd">
								<%-- <td>${pet.id}</td> --%>
								<th scope="row">${pet.p_name}</th>
								<td>
							
										<c:if test="${pet.p_sex==1}">수컷</c:if>
										<c:if test="${pet.p_sex==2}">암컷</c:if>	
										<c:if test="${pet.p_sex==3}">중성</c:if>												
								</td>
								<td>
										<c:if test="${pet.p_size==1}">소형</c:if>
										<c:if test="${pet.p_size==2}">중형</c:if>	
										<c:if test="${pet.p_size==3}">대형</c:if>												
							
								</td>
								<td>${pet.p_birthdate}</td>
								<td><a href="<%=url%>/petfind.do?up_pname=${pet.p_name}"
									class="btn btn-primary">수정</a></td>
								<td><a href="<%=url%>/petdelete.do?del_pname=${pet.p_name}"
									class="btn btn-primary">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<font style="font-size: 2em;"> <a href="<%=url%>/petinput.do"
					class="btn btn-primary">반려견 추가</a></font>
				<font style="font-size: 2em;"> <a href="<%=url%>"
					class="btn btn-primary">메인으로</a></font>
				<!--?in_pname=${member.id}  -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>
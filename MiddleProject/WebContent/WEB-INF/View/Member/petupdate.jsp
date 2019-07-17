<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.member.vo.MemberVo,com.pet.vo.*"%>
<% PetVo res = (PetVo) request.getAttribute("res"); %>
<% String date = res.getP_birthdate().substring(0, 10); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 수정</title>
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
	<% String url = request.getContextPath(); %>
	<br>
	<br> ${ res }
	<br>
	<!-- DataTales Example -->
	<div class="card shadow mb-4 col-xl-10 col-lg-10 col-md-6">

		<div class="card-header py-3">


			<div class="card">
			<h5 class="card-header info-color white-text text-center py-4">
			<strong>반려견 정보 수정</strong>
			</h5>


				<form action="<%=url %>/petupdate.do" method="POST">
<br> <br>
					<div class="form-group row">
					<div class="col-sm-4 mb-6 mb-sm-0">
							<input type="text" class="form-control form-control-user" readonly="readonly" name="p_name"
								value="${res.p_name}" />
					</div></div>
					<br> <br>
					
					
					 
					
<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary "> <input type="radio"
							name="p_sex" autocomplite="off" value="1" >남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="p_sex" autocomplite="off" value="2">여자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="p_sex" autocomplite="off" value="3">중성화
						</label>
					</div>성별 : 	
					 <c:if test="${res.p_sex==1}">수컷</c:if>
					<c:if test="${res.p_sex==2}">암컷</c:if>	
					<c:if test="${res.p_sex==3}">중성</c:if>	 <br><br>




								<div class="btn-group" data-toggle="buttons">
                               <label class="btn btn-primary ">
                                 <input type="radio" name="p_size" autocomplite="off" value="1">소 형
                                </label>
                                <label class="btn btn-primary">
                                  <input type="radio" name="p_size" autocomplite="off" value="2">중 형
                                </label>
                                <label class="btn btn-primary ">
                                    <input type="radio" name="p_size" autocomplite="off" value="3">대 형
                                   </label>
                              </div>크기 : 
                         <c:if test="${res.p_size==1}">소형</c:if>
										<c:if test="${res.p_size==2}">중형</c:if>	
										<c:if test="${res.p_size==3}">대형</c:if>												
							<br><br>

					


					


					<div class="form-group row">
					<div class="col-sm-6 mb-12 mb-sm-0">
					<input type="date" class="form-control" name="p_birthdate" value="<%=date%>" /><br>
					</div></div><br>
					<input type="submit" class="btn btn-primary" value="확인" /> 
					<input type="button" class="btn btn-primary" onclick="window.location='petselect.do'" value="취소" />


				</form>

			</div>
		</div>
	</div>

</body>
</html>
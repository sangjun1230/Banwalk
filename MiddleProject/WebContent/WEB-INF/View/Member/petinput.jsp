<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 추가</title>
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
	<h3>
		<% String url = request.getContextPath(); %>
	</h3>
	<br>
	<br>
	<div class="card shadow mb-4 col-xl-10 col-lg-10 col-md-6">
              
            <div class="card-header py-3">
                
              
                
	
	<div class="card">
		<h5 class="card-header info-color white-text text-center py-4">
			<strong>반려견 추가</strong>
		</h5>
		<div class="card-body px-lg-5 pt-0">
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<form class="md-form" style="color: #757575;"
					action="<%=url %>/petinsert.do" method="POST">
					
					
					<br>
					<div class="form-group row">
					<div class="col-sm-4 mb-6 mb-sm-0">
					
						<input type="text" class="form-control form-control-user"
							name="p_name" placeholder="이름" maxlength="20">
					</div></div><br>
					
					
					
					
					
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary "> <input type="radio"
							name="p_sex" autocomplite="off" value="1" checked>남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="p_sex" autocomplite="off" value="2">여자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="p_sex" autocomplite="off" value="3">중성화
						</label>
					</div><br><br>
					
					
					
					
					 <div class="btn-group" data-toggle="buttons">
                               <label class="btn btn-primary ">
                                 <input type="radio" name="p_size" autocomplite="off" value="1" checked>소 형
                                </label>
                                <label class="btn btn-primary">
                                  <input type="radio" name="p_size" autocomplite="off" value="2">중 형
                                </label>
                                <label class="btn btn-primary ">
                                    <input type="radio" name="p_size" autocomplite="off" value="3">대 형
                                   </label>
                              </div><br><br>

					<div class="form-group row">
					<div class="col-sm-6 mb-12 mb-sm-0">
					<input class="form-control" type="date" name="p_birthdate" />
					</div></div><br>



					<div>
						<input class="btn btn-primary" type="submit" value="확인" /> <input
							type="button" class="btn btn-primary"
							onclick="window.location='petselect.do'" value="취소" />
					</div>
				</form>


			</div>
			<div class="col-md-2"></div>
		</div>
		</div>
		
		</div>
	</div>
</body>
</html>
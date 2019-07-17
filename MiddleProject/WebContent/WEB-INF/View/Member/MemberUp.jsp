<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String root = request.getContextPath(); %>

<%@ page import="java.util.*, com.member.vo.MemberVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% String date = member.getU_birthday().substring(0, 10); %> --%>
<%
 
	MemberVo member = (MemberVo) request.getAttribute("member");
 	if(member != null){
		session.setAttribute("id", member.getId()); 
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/signup.css">
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
  function registerCheckFunction(){
     var userID = $('#userID').val();
     $.ajax({
        type: 'POST',
        url: './UserRegisterCheckServlet',
        data:{userID : userID},
        success: function(result){
           if(result==1){
              $('#checkMessage').html('사용할 수 있는 ID입니다.')
              $('#checkType').attr('class', 'modal-content panel-success');

           }
           else{
              $('#checkMessage').html('사용할 수 없는 ID입니다.')
              $('#checkType').attr('class', 'modal-content panel-warning');
           }
           $('#checkModal').modal("show");
        }
     })
  }

  function passwordCheckFunction(){
     var pw1 = $('#pw1').val();
     var pw2 = $('#pw2').val();
     if(pw1 != pw2){
        $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
     } else{
        $('#passwordCheckMessage').html('');
     }
  }
  </script>
<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function sample4_execDaumPostcode() { //sample4_execDaumPostcode
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               //var roadAddr = data.roadAddress; // 도로명 주소 변수(=)
               //var extraRoadAddr = ''; // 참고 항목 변수
           var sido = data.sido;
               var sigungu = data.sigungu;
               var roadname = data.roadname;
               var d_juso;
               var zonecode = data.zonecode;
               var extraRoadAddr = ''; 
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById("sample4_zonecode").value = data.zonecode;
               document.getElementById("sample4_sido").value = data.sido;
               document.getElementById("sample4_sigungu").value = data.sigungu;
               document.getElementById("sample4_roadname").value = data.roadname;
             //  document.getElementById("sample4_jibunAddress").value += data.jibunAddress;
               
               
               
               
               // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
               if(sido,sigungu,roadname !== ''){//roadAddr
                   document.getElementById("sample4_extraAddress").value = extraRoadAddr;
               } else {
                   document.getElementById("sample4_extraAddress").value = '';
               }

               var guideTextBox = document.getElementById("guide");
               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               if(data.autoRoadAddress) {
                   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                   guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                   guideTextBox.style.display = 'block';

               } else if(data.autoJibunAddress) {
                   var expJibunAddr = data.autoJibunAddress;
                   guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                   guideTextBox.style.display = 'block';
               } else {
                   guideTextBox.innerHTML = '';
                   guideTextBox.style.display = 'none';
               }
           }//
       }).open();
   }
</script>
<style>

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원정보 수정</h1>
							</div>

							<form action="/MiddleProject/update.do" method="POST">
								<!-- 질문1 -->
								<label for="id">ID</label>
								<div class="form-group">

									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control input-sm" type="text"
											readonly="readonly" name="id" value="${member.id}"
											maxlength="20" />
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="pw">비밀번호</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="password" name="pw"
											value="${member.pw}" onkeyup="passwordCheckFunction();"
											maxlength="20" placeholder="비밀번호 입력" />
									</div>

									<div class="form-group">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input class="form-control" type="password"
												onkeyup="passwordCheckFunction();" maxlength="20"
												placeholder="비밀번호 확인" />
											<div id="passwordCheckMessage"></div>
										</div>
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="u_name">성명</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="text" name="u_name"
											value="${member.u_name}" maxlength="20" />
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="n_id">닉네임</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="text" name="n_id"
											value="${member.n_id}" maxlength="20" />
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="u_birthday">생년월일</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="date" name="u_birthday"
											value="${member.u_birthday}" />
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="u_sex">성별</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" readonly="readonly" name="u_sex"
											value="${member.u_sex}" />
									</div>
								</div>
								<br>
								<br>
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

								<div class="form-group">
									<label for="address">주소</label><br>
									<div class="form-group">

										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="sample4_zonecode" name="zonecode"
												value="${member.zonecode}" placeholder="우편번호" /><br> <input
												type="text" class="form-control form-control-user"
												id="sample4_sido" name="sido" value="${member.sido}"
												placeholder="시도" /> <input type="text"
												class="form-control form-control-user" id="sample4_roadname"
												name="roadname" value="${member.roadname}"
												placeholder="도로명주소" /> <span id="guide"
												style="color: #999; display: none"></span>


										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="button" class="btn btn-primary btn-icon-split"
												onclick="sample4_execDaumPostcode()" value="우편번호 찾기" /><br>
											<br> <input type="text"
												class="form-control form-control-user" id="sample4_sigungu"
												name="sigungu" value="${member.sigungu}" placeholder="시군구" />
											<input type="text" class="form-control form-control-user"
												id="sample4_detailAddress" name="d_juso"
												value="${member.d_juso}" placeholder="상세주소" />
										</div>
										<input type="text" class="form-control form-control-user"
											id="sample4_extraAddress" placeholder="참고항목" />
										<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
									</div>
								</div>

								<div class="form-group">
									<br> <label for="email">Email</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="email" name="email"
											value="${member.email}" />
									</div>
								</div>
								<br>
								<br>

								<div class="form-group">
									<label for="tel">Tel</label><br>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" type="tel" name="tel"
											value="${member.tel}" />
									</div>
								</div>
								<br>
								<br> <label for="petcount">반려견 수</label><br>
								<div class="form-group">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control" list="petcounts" name="petcount"
											value="${member.petcount}">
										<datalist id="petcounts">
											<option value="0">
											<option value="1">
											<option value="2">
											<option value="3">
											<option value="4">
											<option value="5">
										</datalist>
									</div>
								</div>
								<br>
								<br>

								<button class="btn btn-primary" type="submit">수정</button>
								<button class="btn btn-default" type="reset">취소</button>
								<input class="btn btn-default" type="button" onclick="window.location='index.jsp'" value="메인으로">

							</form>
							

						</div>
						<a class="btn btn-default pull-right"
								href="/MiddleProject/delete.do?del_name=${member.id}">회원탈퇴</a>
					</div>
				</div>
			</div>
		</div>

	</div>




</body>
</html>
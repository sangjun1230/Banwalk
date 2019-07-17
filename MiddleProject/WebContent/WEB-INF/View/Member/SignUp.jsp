  <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% String root = request.getContextPath(); %>
<%@ page import="java.util.*,com.member.vo.MemberVo"%>
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
<title>회원가입</title>
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/signup.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
   function sample4_execDaumPostcode() {
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
              
              
              <form action="<%= root %>/insert.do" method="post">
                <table>
                    <thead class="h4 text-gray-900 mb-4">
                            <h1>회원가입</h1>
                    </thead>
                    <tbody>
                    <tr>
                        <td  id="title">아이디</td>
                        <td >
                            <input type="text" class="form-control form-control-user" name="id" placeholder="ID 입력" maxlength="20">
                        </td >
                        <td >
                            <input type="button" class="btn btn-primary" onclick="registerCheckfuntion();" value="중복확인" >    
                    </td>
                    </tr>
                    
                    <tr>
                        <td  id="title">비밀번호</td>
                        <td>
                            <input type="password" class="form-control" name="pw" onkeyup="passwordCheckFunction();" placeholder="비밀번호" maxlength="20">
                        </td>
                    </tr>
                    <tr>
                        <td  id="title">비밀번호</td>
                        <td>
                            <input type="password" class="form-control" onkeyup="passwordCheckFunction();" placeholder="비밀번호 확인" maxlength="20">
                        </td>
                    </tr>

                    <tr>
                        <td  id="title">이름</td>
                        <td>
                            <input type="text" class="form-control" name="u_name" placeholder="이름" maxlength="20">
                        </td>
                    </tr>

                    <tr>
                        <td id="title">닉네임</td>
                        <td>
                            <input type="text" class="form-control" name="n_id" placeholder="닉네임" maxlength="20">
                        </td>
                    </tr>
             
                    <tr>
                        <td  id="title">생년월일</td>
                        <td>
                            <input type="date" name="u_birthday" class="form-control" />
                        </td>
                    </tr>

                    <tr>
                        <td id="title">성별</td>
                        <td>
                            <input type="radio" class="btn btn-primary" name="u_sex" value="1" checked>남
                            <input type="radio" class="btn btn-primary" name="u_sex" value="2" checked>여
                        </td>
                    </tr>


                    <tr>                                                                                                                                                                            
                        <td id="title">주소</td>
                        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                                <td><input type="text" class="form-control"  id="sample4_zonecode" name="zonecode" placeholder="우편번호" /></td>
                                <td><input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" /></td><br>
                            </tr><tr><td></td>
                                <td><input type="text" class="form-control" id="sample4_sido" name="sido" placeholder="시도" /></td>
                            </tr><tr><td></td>
                                <td><input type="text" class="form-control" id="sample4_sigungu" name="sigungu" placeholder="시군구" /></td>
                            </tr><tr><td></td>
                                <td><input type="text" class="form-control" id="sample4_roadname" name="roadname" placeholder="도로명" />
                                <!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
                                <span id="guide" style="color: #999; display: none"></span></td>
                            </tr><tr><td>상세주소</td>
                                <td><input type="text" class="form-control" id="sample4_detailAddress" name="d_juso" placeholder="상세주소" /></td>
                        </tr><tr><td></td><td><input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" /></td>
                        
                    </tr>


                    <tr>
                            <td  id="title">e-mail</td>
                            <td>
                                <input class="form-control" name="email" type="email" placeholder="e-Mail 입력" />
                            </td>
                        </tr>

                        <tr>
                                <td id="title">휴대전화</td>
                                <td>
                                    <input class="form-control" name="tel" type="tel" placeholder="ex)010-0000-0000" />
                                </td>
                            </tr>
                            
                            <tr>
                                    <td id="title">반려견 수</td>
                                    <td>
                                        <select type="text" class="form-control" name="petcount">
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5 이상</option>
                                             </select>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                            <br>
                            <input type="submit" class="btn btn-primary" value="가입"/>  <input class="btn btn-default pull-right" type="reset"
                            onclick="myFunction()" value="다시작성">
                            </form>
              <hr>
              <div class="text-center">
               
                <a class="small" href="login.do">로그인 하기</a>
                <a class="small" href="index.jsp">메인으로</a>
              </div>
            </div>
          </div>
        </div>
    
    
      </div>
      
      <%
      String messageContent = null;
      if (session.getAttribute("messageContent") != null) {
         messageContent = (String) session.getAttribute("messageContent");
      }
      String messageType = null;
      if (session.getAttribute("messageType") != null) {
         messageType = (String) session.getAttribute("messageType");
      }
      if (messageContent != null) {
   %>
   
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="vertical-aligment-helper">
         <div class="modal-dialog"vertical-align-center">
            <div
               class="modal-content
            <%if (messageType.equals("오류 메시지"))
            out.println("panel-warning");
         else
            out.println("panel-success");%>">
               <div class="moda-header panel-heading">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title">
                     <%=messageType%>
                  </h4>
               </div>
               <div class="modal-body">
                  <%=messageContent%>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary"
                     data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script>
      $('#messageModal').modal("show");
   </script>

   <%
      session.removeAttribute("messageContent");
         session.removeAttribute("messageType");
      }
   %>
   <!-- 중복확인 : DAO작업자는 if(rs.next() || userID.equals("") 비어있을 때도 0을 출력하게 해줘야함-->

   <div class="modal fade" id="checkmodal" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="vertical-aligment-helper">
         <div class="modal-dialog"vertical-align-center">
            <div id="checkType" class="modal-content panel-info
            ">
               <div class="moda-header panel-heading">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title">확인메시지</h4>
               </div>
               <div class="modal-body" id="checkMessasge"></div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary"
                     data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<footer class="container-fluid text-center">
   <p>Footer Text</p>
</footer>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>


  
</body>

</html>

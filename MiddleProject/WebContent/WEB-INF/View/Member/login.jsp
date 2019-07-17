<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.member.vo.MemberVo"%>
<%
   MemberVo member = (MemberVo) request.getAttribute("member");
   
   if(member != null){
      session.setAttribute("id", member.getId());
   }
   
%>
<% String root = request.getContextPath(); %>

<!DOCTYPE html>


<html>
    <head>
    <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>로그인</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

      <link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
         crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
         integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
         crossorigin="anonymous"></script>
      <script
         src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
         integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
         crossorigin="anonymous"></script>
      <script
         src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
         integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
         crossorigin="anonymous"></script>
      <link rel="stylesheet" type="text/css" href="css/main.css">
      <link rel="stylesheet"
         href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
         integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
         crossorigin="anonymous">
      <link rel="stylesheet"
         href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
         integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
         crossorigin="anonymous">
      
      
      <title>로그인</title>
      <script type="text/javascript">
         
      </script>


</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                  </div>
                  <form class="user" action="<%=root%>/login.do" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="id" aria-describedby="id help" placeholder="여기에 ID를 입력하세요" maxlength="20">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="pw" placeholder="비밀번호" maxlength="20">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox big">
                        <input type="checkbox" class="custom-control-input" name="checkbox">
                        <label class="custom-control-label" for="customCheck">아이디 유지</label>
                      </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary btn-lg" style="width: 200px">Login</button>
                    <hr>
                    
                  </form>
                  <hr>
                  <div class="text-center">
                      <a class="btn btn-primary" href="/MiddleProject/insert.do" role="button" method="POST">회원가입 하기</a>  &nbsp; &nbsp; 
                    
                      <a class="small" href="/MiddleProject/findid.do" >아이디 찾기 </a>&nbsp;
                    
                      <a class="small" href="/MiddleProject/pw.do" >비밀번호 찾기 </a>
                    
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

</body>

</html>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Charts</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
<body>
    <div class="content container margin-top">
      <div class="container card-4">
        <div class="center large margin-top">
          <h3>My Page</h3>
        </div>
        <div>
          <form id="myForm" action="../member/update_mypage.do" method="post">
            <p>
              <label>ID</label> 
              <input class="input" type="text" id="id" name="id" readonly value="${ member.id }"> 
            </p>
            


            <p>
                <label>이름</label> 
                <input class="input" type="text" id="u-name" name="u-name" readonly value="${ member.u_name }"> 
              </p>
           


            <p>
                <label>닉네임</label> 
                <input class="input" type="text" id="n_id" name="n_id" readonly value="${ member.n_id }"> 
              
              <input class="input" type="text" name="n_id"  placeholder="변경할 닉네임">
            </p>
            
            <p>
                <label>연락처</label> 
                <input class="input" type="text" id="tel" name="tel" readonly value="${ member.tel }"> 
              
              <input class="input" type="text" name="tel"  placeholder="변경할 연락처">
            </p>
           
           
         
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

            <p>
                <label>우편번호</label> 
                <input class="input" type="text" id="adress" name="adress" readonly value="${ member.adress }"> <br>
                <input type="text" id="sample4_zonecode" name="zonecode" placeholder="우편번호">
               <input class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample4_sido" name="sido" placeholder="시도">
               <input type="text" id="sample4_sigungu" name="sigungu" placeholder="시군구"><br>
               <input type="text" id="sample4_roadname" name="roadname" placeholder="도로명">
               <!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
               <span id="guide" style="color: #999; display: none"></span>
               <input type="text" id="sample4_detailAddress" name="d_juso" placeholder="상세주소">
               <input type="text" id="sample4_extraAddress" placeholder="참고항목">
            </p>





         
         
              <p>
              <label>Email</label> 
              <input class="input" type="text" id="email" name="email" value="${ member.email }" > 
              <input class="input" type="text" name="email"  placeholder="변경할 Email">
            
            </p>
         
         
         
            <p>
                <label>성별</label> 
                <input class="input" type="text" id="u_sex" name="u_sex" readonly value="${ member.u_sex }"> 
              </p>
              
                 
                  

          
          
              <p>
                  <label>생년월일</label> 
                  <input class="input" type="date" id="u_date" name="u_date" readonly value="${ member.u_date }"> 
                </p>

                <p>

                    <label for="petcount">반려견 수</label>
                    <input class="input" type="text" id="petcount" name="petcount" readonly value="${ member.petcount }"> 
                    <select class="input" name="petcount">
                       <option>0</option>
                       <option>1</option>
                       <option>2</option>
                       <option>3</option>
                       <option>4</option>
                       <option>5 이상</option>
                    </select>
                    <p>

        
                <p class="center">
                
              <button type="submit" class="btn btn-primary">회원정보 변경</button>
              <input type="reset" class="btn btn-primary" value="돌아가기" onClick="history.back()">

              
            </p>
          </form>
          <br />
          <form id="pwForm" action="../member/update_pw.do" method="post">	
            <input type="hidden" name="id" value="${ member.id }">
            <p>
              <label>기존 비밀번호</label>
              <input class="input" id="old_pw" name="old_pw" type="password" required>
            </p>
            <p>
              <label>수정 비밀번호</label> 
              <input class="input" id="pw" name="pw" type="password" required>
            </p>
            <p>
              <label>비밀번호 확인</label>
              <input class="input" type="password" id="pw2" type="password" required>
            </p>
            <p class="center">
              <button type="submit" id="joinBtn" class="btn btn-primary">비밀번호 변경</button>
            </p>
          </form>
        </div>
      </div>
    </div>
  </body>

</html>


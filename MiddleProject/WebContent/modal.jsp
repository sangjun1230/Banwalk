<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function modal(roadno){
		$("#modal").css("display","block");
		$("#modal").fadeIn();
		$.ajax({
			type:"GET",
			url:"goroadcontent.do?roadno="+roadno,
			dataType:"text",
			error:function(){
				alert("통신실패!!");
			},
			success:function(data){
				$('#roadcontent').html(data);
			}
		});
	}
	
	function closeModal(){
		$("#modal").fadeOut();
	}
	</script>
</head>
<body>

	<div id="modal">
		<div class="modal-bg">
			<div class="modal-cont">
				<div class="img-box">
					<img src="<%=root%>/roadimg/${vo.photourl}" alt="">
				</div>
				<div class="cont">
					<div class="name">
						<div class="name-box">
							<div class="pic"></div>
							<div class="user">lee lee lee lee</div>
						</div>
					</div>
					<div class="text">
						<div class="text-box">
							<div class="content">hi hi hi hi hi hi hi</div>
							<div class="reply">
								<div class="userID">kimjutan</div>
								<div class="replytext">hi hi hi hi hi hi hi hi</div>
							</div>
						</div>
					</div>
					<div class="sum">
						<form action="">
							<input type="text" >
							<button></button>
						</form>
					</div>
				</div>
				<a href="#" class="close">
                <svg viewBox="0 0 24 24">
                    <path d="M14.1,12L22,4.1c0.6-0.6,0.6-1.5,0-2.1c-0.6-0.6-1.5-0.6-2.1,0L12,9.9L4.1,2C3.5,1.4,2.5,1.4,2,2C1.4,2.5,1.4,3.5,2,4.1
    L9.9,12L2,19.9c-0.6,0.6-0.6,1.5,0,2.1c0.3,0.3,0.7,0.4,1.1,0.4s0.8-0.1,1.1-0.4l7.9-7.9l7.9,7.9c0.3,0.3,0.7,0.4,1.1,0.4
    s0.8-0.1,1.1-0.4c0.6-0.6,0.6-1.5,0-2.1L14.1,12z"/>
                </svg>
            </a>
			</div>
		</div>
	</div>

</body>
</html>
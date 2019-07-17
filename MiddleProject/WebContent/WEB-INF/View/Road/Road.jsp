<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
 	String root = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="css/test13.css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/slick.css">
	<link rel="stylesheet" href="css/slick-theme.css">
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
		<div class="row">
			<c:forEach var="road" items="${ all }">
				<div class="col-md-2">
					<div class="card h-50">
						<a href="goroadcontent.do?roadno=${road.roadno}"><img src="<%=root%>/roadimg/${road.photourl}" style="width: 100%; height: 50%;"></a>
					</div>
					<div class="card-footer">
						<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
					</div>
				</div>
			</c:forEach>
		</div>



	
	<script src="js/jquery-1.12.4.js"></script>
	<script src="js/jquery-ui-1.12.1.min.js"></script>
	<script src="js/test.js"></script>	
</body>
</html>
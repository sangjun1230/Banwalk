<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.member.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<MemberVo> all = (List<MemberVo>) request.getAttribute("all");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="t1">

		<thead>
			<tr>
				<th>id</th>
				<th>pw</th>
				<th>성명</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>우편번호</th>
				<th>시도</th>
				<th>시군구</th>
				<th>도로명</th>
				<th>상세주소</th>
				<th>Email</th>
				<th>전화번호</th>
				<th>상태</th>
				<th>권한</th>
				<th>반려견수</th>
				<th>친구상태</th>
				<th>친구id</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach var="member" items="${all}">
				<tr class="odd">
					<td>${member.id}</td>
					<td>${member.pw}</td>
					<td>${member.u_name}</td>
					<td>${member.n_id}</td>
					<td>${member.u_birthday}</td>
					<td>${member.u_sex}</td>
					<td>${member.zonecode}</td>
					<td>${member.sido}</td>
					<td>${member.sigungu}</td>
					<td>${member.roadname}</td>
					<td>${member.d_juso}</td>
					<td>${member.email}</td>
					<td>${member.tel}</td>
					<td>${member.status}</td>
					<td>${member.manage}</td>
					<td>${member.petcount}</td>
					<td>${member.friend}</td>
					<td>${member.f_id}</td>
					
					
					<td><a href="delete.do?del_name=${member.id}">삭제</a></td>
					<td><a href="find.do?find_name=${member.id}">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<font style="font-size: 2em;"> 
	
		

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- 전체적인 CSS  -->
  <style>
    body {
      min-height: 100vh;

/*       background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); */
/*       background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
		background: #9796f0;
		background: -webkit-linear-gradient(to right, #fbc7d4, #9796f0); 
		background: linear-gradient(to right, #fbc7d4, #9796f0); 
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    .btn-primary {
   		color: #fff;
   		background-color: #695aa6;
    	border-color: #695aa6;
		transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
  </style>
    
</head>
<body>

	
<form method="post">
<div class="container">
	<table border="1" class="table table-bordered border-primary">
		<thead>
		<tr>
			<th colspan="2">환영합니다. ${detail.name}</th>
		</tr>
		</thead>
		<tr>
			<td>아이디</td>
			<td>
				${detail.id}<input type="hidden" value="${detail.id}" name = "id">	
			</td>
		<tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" value="${detail.name}" name = "name">	
			</td>
		<tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="password" value="${detail.password}" name = "password">	
			</td>
		<tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" value="${detail.phone}" name = "phone">	
			</td>
		<tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" value="${detail.email}" name = "email">	
			</td>
		<tr>
		<tr>
			<td colspan="2">
				<input class="btn btn-primary" type="submit" value="수정" formaction="modify">
				<input class="btn btn-primary" type="submit" value="회원탈퇴" formaction="remove">
				<input class="btn btn-primary" type="submit" value="게시판 이동" formaction="/list">	
<!-- 				formmethod="get" -->
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>

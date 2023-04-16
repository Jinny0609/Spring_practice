<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/resources/assets/js/list.js"></script> -->
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
	<h1>게시판 목록입니다.</h1>
	<!--글쓰기 버튼 -->
	<input type="button" value="글쓰기" onclick="location.href='http://localhost:8080/write'">
	<form id="searchForm" action="/board/list" method="POST">
		<select name="type">
			<option value="T">제목</option>
			<option value="C">내용</option>
			<option value="T">제목+게시글</option>
		</select>
		<input type="text" name="keyword" value="${paging.cri.keyword}">
		<input type="text" name="pageNum" value="${paging.cri.pageNum}">
		<input type="text" name="amount" value="${paging.cri.amount}">
		<input type="button" value="검색">
<!-- 	이 버튼 주석처리 안하면 1이 안나옴.. -->
	</form>
	
	<table border="1">
		<tr>
			<td>게시판번호</td> <td>제목</td> <td>작성자</td> <td> 작성일자 </td> <td> 조회수 </td>
		</tr>
	<!-- for문 시작  -->
	<c:forEach items="${list}" var="boardlist">
		<tr>
			<td>${boardlist.bno}</td>
			<td><a href="/board/detail?bno=${boardlist.bno}">${boardlist.title}</a></td>
			<td>${boardlist.id}</td>
			<td>${boardlist.regdate}</td>
			<td>${boardlist.cnt}</td>
			
		</tr>
	</c:forEach>
	</table>
	
	<!--  prev(이전)이 true 이면 이전 버튼 활성화 -->
	<c:if test="${paging.prev}">
		<a href="/board/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
	</c:if>
	<!-- begin(1)이 end(10)될 동안 반복(1일 10일 될 동안 반복) -->
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		<a href="/board/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
	</c:forEach>
	<!--  next(다음)이 true이면 다음버튼 활성화 -->
	<c:if test="${paging.next}">
		<a href="/board/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
	</c:if>
	
	
</body>
</html>
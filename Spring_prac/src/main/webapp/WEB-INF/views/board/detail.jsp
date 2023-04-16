<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/reply.js"></script>
<script type="text/javascript" src="/resources/assets/js/attach.js"></script>

<script>
function modifyBoard(bno) {
//  	  window.location.href = "/board/modify?bno=" + bno;
		$.ajax({
// 			url: '/board/modify',
			url: '/board/modify',
			type: 'POST',
			data: {bno: bno},
			success: function(){
				alert("수정 완료되었습니다.")
				location.href = "/board/modify?bno=" + bno;
			},
			error: function(){
				alert("수정 중 오류가 발생했습니다.");
			}
		});
	}
function deleteBoard(bno) {
// 	  window.location.href = "/board/remove?bno=" + bno;
		$.ajax({
			url: '/board/remove',
			type: 'POST',
			data: {bno: bno},
			success : function(){
				alert("삭제가 완료되었습니다.");
				location.href = "/list";
			},
			error: function(){
				alert("삭제 중 오류가 발생하였습니다.");
			}
		});
	}
</script>
<!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
    body {
     	min-height: 100vh;
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
		<table border="1" class="table table-bordered border-primary">
			<tr>
				<td>제목</td>
				<td><input type="text" value="${detail.title}" name="title">
					<input type="hidden" value="${detail.bno}" name="bno">
				</td>
			</tr>
			
				<tr>
					<td>내용</td> <td><textarea name="content">${detail.content}</textarea></td>
				</tr>
				<!-- 기존 사용하던 -->
<!-- 			<tr> -->
<!-- 				<td><input type="submit" value="수정" formaction="/board/modify"></td> -->
<!-- 				<td><input type="submit" value="삭제" formaction="/board/remove"></td> -->
<!-- 			</tr> -->
<!-- 					이거는 나중에 spring security 배우고 해보기 -->
					<tr>
					  <c:if test="${isOwner}">
					    <td colspan="2">
						    <button type="button" onclick="modifyBoard(${board.bno})">수정</button>
						    <button type="button" onclick="deleteBoard(${board.bno})">삭제</button>
					    </td>
					  </c:if>
					</tr>				
		</table>
	</form>
	
	<div id="uploadResult">
		<ul>
		
		</ul>
	</div>
	
	<div><label>댓글</label></div>
	<div>
		<textarea rows="5" cols="50" id="reply"></textarea>
	</div>
	<div>
		<input type="button" value="댓글쓰기(aaa)" id="aaa">
		<input type="button" value="댓글쓰기(add)" id="add">
<!-- 	id가 왜 aaa인지  -->
	</div>
	<!--  댓글 삭제 chat -->
	<div id="chat">
		<ul id="replyUL">
		</ul>
	</div>
	<div id="replyPage"></div>
</body>
</html>
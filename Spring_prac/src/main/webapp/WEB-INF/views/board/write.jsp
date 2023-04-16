<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/uploadAjax.js"></script>
<!-- 2023-04-13 9번 줄 주석 해제  -->
<script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>

<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- 전체적인 CSS  -->
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
	<h1>글쓰기 페이지 입니다.</h1>
	
<form id="form" action="/write" method="post">
	제목 <input type="text" name="title"><br>
	<!-- 내용<input type="text" name="context"><br> -->
	<textarea rows="" cols="" name="content" id="content_area"></textarea>
	
	<input type="file" name="uploadFile" multiple >
	<input type="submit" id="uploadBtn" value="글쓰기">
</form>
	
	<div id="uploadResult">
		<ul>
		
		</ul>
	</div>
</body>
<script type="text/javascript">

// ClassicEditor
// .create(document.querySelector('#content_area'))
// .catch(error=>{
// 	console.error(error);
// });

ClassicEditor
.create(document.querySelector('#content_area'), {
    enterMode: CKEditor5.EnterMode.BR,
    shiftEnterMode: CKEditor5.EnterMode.P,
    // ...
})
.catch(error => {
    console.error(error);
});



</script>
</html>
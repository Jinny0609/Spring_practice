<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Login</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="resources/text/javascript" src="/resource/js/bootstrap.js"></script>
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
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .btn-primary {
   		color: #fff;
   		background-color: #695aa6;
    	border-color: #695aa6;
		transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/login.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="login" method="post" accept-charset="utf-8">
    <img class="mb-4" src="resources/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Please Login In</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="id">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <a href="#">Forgot your ID or Password?</a> &nbsp;
        <a href="signup">Sign up</a>
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Login in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  </form>
</main>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SignUp Page</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 배경 -->
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
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
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
<<<<<<< HEAD
        <!-- novalidate는 개발자가 직접 유효성검사 지정해줘야함-->
        <form class="validation-form" action="signup" method="post" novalidate>	
          <div class="row">
            <div class="col-md-6 mb-3">
	              <label for="id">아이디</label>
	              <input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요." required>
	              <div class="invalid-feedback">
	               아이디를 입력해주세요.
	              </div>
            </div>
            <div class="col-md-6 mb-3">
	            <label for="name">이름</label>
	            <input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요." required>
	            <div class="invalid-feedback">
	              이름을 입력해주세요.
	            </div>
          	</div>
          </div>
          
          <div class="row">
            <div class="col-md-12 mb-3">
              <label for="password">패스워드</label>
              <input type="password" class="form-control" name="password" placeholder="" required>
              <div class="invalid-feedback">
               패스워드를 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-12 mb-3">
              <label for="passwordck">패스워드 확인</label>
              <input type="password" class="form-control" name="passwordck" placeholder=""required>
              <div class="invalid-feedback">
               패스워드를 입력해주세요.
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12 mb-3">
              <label for="phone">전화번호</label>
              <input type="text" class="form-control" name="phone" placeholder="전화번호를 입력해주세요." required>
              <div class="invalid-feedback">
                전화번호를 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-12 mb-3">
              <label for="eamil">이메일</label>
              <input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요." required>
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>
          </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <input type="submit" class="btn btn-primary btn-lg btn-block" value="가입 완료">
=======
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="password">패스워드</label>
              <input type="password" class="form-control" id="password" placeholder="" value="" required>
              <div class="invalid-feedback">
               패스워드를 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="passwordck">패스워드 확인</label>
              <input type="password" class="form-control" id="passwordck" placeholder="" value="" required>
              <div class="invalid-feedback">
               패스워드를 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
		  <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>

          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root">가입 경로</label>
              <select class="custom-select d-block w-100" id="root">
                <option value=""></option>
                <option>검색</option>
                <option>카페</option>
              </select>
              <div class="invalid-feedback">
                가입 경로를 선택해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="code">추천인 코드</label>
              <input type="text" class="form-control" id="code" placeholder="" required>
              <div class="invalid-feedback">
                추천인 코드를 입력해주세요.
              </div>
            </div>
          </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
>>>>>>> refs/remotes/origin/master
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 HJ</p>
    </footer>
  </div>
  <!-- 유효성 검사 -->
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
</html>
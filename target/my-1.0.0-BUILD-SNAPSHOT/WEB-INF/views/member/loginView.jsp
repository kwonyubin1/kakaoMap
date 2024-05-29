<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>My first Web</title>
  <style type="text/css">
    .login-container {
        background-color: white;
        border-radius: 20px;
        box-shadow: 0px 01px 20px black;
        padding: 20px;
        max-width: 1700px;
        width: 100%;
        text-align: center;
        margin-top: 150px; /* 적절한 여백 추가 */
        margin-bottom: 150px;
    }

    .login-container h2 {
        margin-bottom: 30px;
        color: #333333;
    }

    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: calc(100% - 40px);
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        outline: none;
    }

    .login-form input[type="submit"],
    .signup-btn {
        width: calc(100% - 40px);
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-bottom: 10px;
    }

    .login-form input[type="submit"]:hover,
    .signup-btn:hover {
        background-color: #45a049;
    }

    .login-form input[type="submit"]:focus,
    .signup-btn:focus {
        outline: none;
    }

    .signup-link {
        text-decoration: none;
        color: #333333;
    }
</style>
  
</head>

<body>
	<!-- 네비게이션 영역 -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- 네비게이션 영역 -->
<section id="main">
    <div class="section-content overlay d-flex justify-content-center align-items-center">
      <div class="container-xxl">
        <div class="row align-items-center">
  <section id="services">
    <div class="container"> 
      <div class="row justify-content-center"> 
        <div class="col-md-6"> 
          <div class="login-container">
            <h2>Login</h2>
            <form class="login-form" method="post"  action="<c:url value="/loginDo" />">
                            <div class="form-floating mb-3">
                                <input value="${cookie.rememberId.value}" class="form-control" name="memId" id="memId" type="text" placeholder="아이디를 입력해주세요" data-sb-validations="required" />
                                <label for="memId">아이디</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A ID is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요" data-sb-validations="required" />
                                <label for="memPw">비밀번호</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">An password is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                            	아이디 기억하기<input ${cookie.rememberId.value==null ? "" : "checked"} 
                            	   class="form-check-input" type="checkbox" name="remember" id="rememberId">
                            </div>
                            <input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="로그인">
                            <input type="hidden" name="fromURL" value="${fromURL}">
                        </form>
            <a href="http://localhost:8080/registView" class="signup-link"><button class="signup-btn">회원가입</button></a>
          </div>
        </div> 
      </div>
      </div>
  </section>
</div>
</div>
</div>
</section>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
  <!-- footer영역 -->
</body>

</html>
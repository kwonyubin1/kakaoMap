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
<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
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
      	 <!-- Contact Section Heading-->
               <h2 class="page-section-heading text-center text-uppercase mb-0" style="font-weight: 700; color: #ffffff !important; font-size: 2.5rem;">mypage</h2>
                <!-- Icon Divider-->
                <br><br><br>
               
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon text-center">
                    	<c:if test="${sessionScope.login.profileImg == null }">
	                    	<img src="<c:url value="/resources/assets/images/non.png" />" 
	                    	  id="myImage" class="rounded-circle img-thumbnail shadow-sm"
	                    	  width="200px" style="cursor:pointer;"
	                    	>
                    	</c:if>
                    	<c:if test="${sessionScope.login.profileImg != null }">
                    		<img src="<c:url value="${sessionScope.login.profileImg}" />" 
	                    	  id="myImage" class="rounded-circle img-thumbnail shadow-sm"
	                    	  width="200px" style="cursor:pointer;"
	                    	>
                    	</c:if>
						<!-- 파일 전송할때는 multipart/form-data 로 전송해야함.	 -->
                    	<form id="profileForm" enctype="multipart/form-data">
                    		<input type="file" name="uploadImage" id="uploadImage"
                    		 accept="image/*" style="display:none;"  >
                    	</form>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>
                <br><br>
                <!-- 	 Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value="updateDo" />">
                            <div class="form-floating mb-3">
                                <input disabled value="${sessionScope.login.memId}" class="form-control" name="memId" id="memId" type="text" placeholder="아이디를 입력해주세요." data-sb-validations="required" />
                                <input type="hidden" value="${sessionScope.login.memId}" name="memId">
                                <label for="memId">아이디</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A Id is required.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" value="${sessionScope.login.memNm }" id="memNm" name="memNm" type="text" placeholder="이름을 입력해주세요" />
                                <label for="memNm">이름</label>
                            </div>
                           <div class="text-center"> <!-- 수정하기 버튼을 우측에 위치시키기 위해 text-end 클래스 추가 -->
               					 <button class="btn btn-primary btn-xl" id="submitButton" type="submit">수정하기</button>
            				</div>
                        </form>
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function(){
        $("#myImage").click(function(){
            $("#uploadImage").click();
        });
        $("#uploadImage").on("change", function(){
            let file = $(this)[0].files[0];
            if(file){
                let fileType = file['type'];
                let valTypes = ['image/gif','image/jpeg','image/png','image/jpg'];
                if(!valTypes.includes(fileType)){
                    alert("유효한 이미지 타입이 아닙니다.!!!");
                    $(this).val('') //파일 초기화
                }else{
                    let formData = new FormData($('#profileForm')[0]);
                    console.log(formData);
                    $.ajax({
                        url : "<c:url value='/files/upload' />",
                        type :"POST",
                        data:formData,
                        dataType:'json',
                        processData:false,
                        contentType:false,
                        success:function(res){
                            console.log(res);
                            if(res.message == 'success'){
                                // 새로운 이미지 URL로 프로필 이미지를 업데이트
                                $("#myImage").attr('src', '${pageContext.request.contextPath}' + res.imgPath);
                                // 수정된 이미지의 URL을 세션에 저장 (다음 요청 시 사용)
                                sessionScope.login.profileImg = res.imgPath;
                            }
                        },
                        error:function(e){
                            console.log(e);
                        }
                    });
                }
            }
        });
    });
</script>
</body>

</html>
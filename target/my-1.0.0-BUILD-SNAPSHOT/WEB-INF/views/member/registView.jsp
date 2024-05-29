<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
table tr td {
	text-align: left;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
}




@charset "UTF-8";
*{
	margin: 0;
	padding:0;
}

/* 화면 전체 렙 */
.wrapper{
	width: 1900px;	
}

/* content 랩 */
.wrap{
	width : 800px;
	margin: auto;
}
/* 페이지 제목 */
.subjecet{
	width: 100%;
    height: 120px;
    background-color: #8EC0E4;
}
.subjecet span{
	margin-left: 31px;
    font-size: 80px;
    font-weight: 900;
    color: white;
}

/* 아이디 영역 */
.id_wrap{
	width: 100%;
    margin-top: 20px;
}
.id_name{
	font-size: 25px;
    font-weight: bold;
}
.id_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.id_input{
	width:100%;
	height:250%;
	border:none;
	font-size:28px;
}

/* 비밀번호 영역 */
.pw_wrap{
	width: 100%;
    margin-top: 20px;
}
.pw_name{
	font-size: 25px;
    font-weight: bold;
}
.pw_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.pw_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 비밀번호 확인 영역 */
.pwck_wrap{
	width: 100%;
    margin-top: 20px;
}
.pwck_name{
	font-size: 25px;
    font-weight: bold;
}
.pwck_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.pwck_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 이름 영역 */
.user_wrap{
	width: 100%;
    margin-top: 20px;
}
.user_name{
	font-size: 25px;
    font-weight: bold;
}
.user_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.user_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 메일 영역 */
.mail_wrap{
	width: 100%;
    margin-top: 20px;
}
.mail_name{
	font-size: 25px;
    font-weight: bold;
}
.mail_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.mail_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}
.mail_check_wrap{
	margin-top: 20px;	
}
.mail_check_input_box{
	border: 1px solid black;
    height: 31px;
  /*   padding: 10px 14px; */
    width: 61%;
    float: left;
}


 
#mail_check_input_false{
    background-color:#ebebe4;
}
 
#mail_check_input_true{
    background-color:white;
}
.mail_check_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}
.mail_check_button{
    border: 1px solid black;
    height: 51px;
    width: 30%;
    float: right;
    line-height: 50px;
    text-align: center;
    font-size: 30px;
    font-weight: 900;
    background-color: #ececf7;
    cursor: pointer;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

/* 주소 영역 */
.address_wrap{
	width: 100%;
    margin-top: 20px;
}
.address_name{
	font-size: 25px;
    font-weight: bold;
}
.address_input_1_box{
	border: 1px solid black;
    height: 51px;
    width: 65%;
    float: left;	
}
.address_input_1{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;	
}
.address_button{
    border: 1px solid black;
    height: 51px;
    width: 30%;
    float: right;
    line-height: 50px;
    text-align: center;
    font-size: 30px;
    font-weight: 900;
    background-color: #ececf7;
    cursor: pointer;	
}
.address_input_2_wrap{
	margin-top: 20px;
}
.address_input_2_box{
	border: 1px solid black;
	height:31px;
	
}
.address_input_2{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

.address_input_3_wrap{
	margin-top: 20px;
}
.address_input_3_box{
	border: 1px solid black;
	height:31px;
	
}
.address_input_3{
	width:100%;
	height:100%;
	font-size:28px;
}

/* 가입하기 버튼 */
.join_button_wrap{
	margin-top: 40px;
	text-align: center;
}
.join_button{
	width: 100%;
    height: 80px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
}

/* float 속성 해제 */
.clearfix{
	clear: both;
}



/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}


</style>

</head>



<body>
 
  <!-- 네비게이션 영역 -->
  <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
  <!-- 네비게이션 영역 -->

  <section id="">
    <div class="section-content overlay d-flex justify-content-center align-items-center">
      <div class="container-xxl">
        <div class="row align-items-center">
          <section id="services">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-md-6">
                  <div class="signup-container">
                   <!--  <h1>회원가입</h1> -->
                    
                    <form action="<c:url value="/registDo" />" id="registForm" method="post">
                   <!--    <div class="form-floating mb-3">
                        <input class="form-control" id="memNm" name="memNm" type="text" placeholder="이름을 입력해주세요" required data-sb-validations="required"/>
                        <label for="memNm">이름</label>
                         <div class='valid'>이름을 입력하세요. </div>
                      </div>
                    
                      <div class="form-floating mb-3">
                        <input class="form-control" name="memId" id="memId" type="text" placeholder="아이디를 입력해주세요" required data-sb-validations="required" />
                        <label for="memId"> 아이디</label>
                        <div class="invalid-feedback" data-sb-feedback="name:required">A ID is required.</div>
                        <div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
                         <button class="btn btn-secondary" id="checkIdButton" type="button">아이디 확인</button>
                    	 <div id="idExistsError" style="color: red;"></div>
                        <div id="idError" style="color:red;display:none;"></div> 아이디 유효성 검사 오류 메시지
                      </div>
                     
                      <div class="form-floating mb-3">
                        <input class="form-control"  id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요" required data-sb-validations="required" />
                        <label for="memPw">비밀번호</label>
                        <div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
                        <div class="invalid-feedback" data-sb-feedback="password:required">An password is required.</div>
                      </div>
                      
                      <div class="form-floating mb-3">
                        <input class="form-control"  id="memPwCh" name=memPwCh type="password" placeholder="비밀번호를 확인 해주세요" required data-sb-validations="required" />
                        <label for="memPwCh">비밀번호 확인</label>
                        <div class="valid">비밀번호를 다시 입력하세요. </div>
                        <font id="chkNotice" size="5"></font>
                      <div id="passwordError" style="color: red;"></div>  
                      
                      </div>
                      
                      <div class="form-floating mb-3">
                        <input class="form-control" id="memEmail" name="memEmail" type="text" placeholder="이메일을 입력해주세요" required data-sb-validations="required" />
                        <label for="memPw">이메일</label>
                        <div class="valid">이메일을 입력하세요.</div>
                         <button class="btn btn-info" id="sendEmailButton" type="button">이메일 확인</button>
                 		 <div id="verificationCodeSection" style="display: none;">
                    	 <div class="form-floating mb-3">
                        <input class="form-control" id="verificationCode" type="text" placeholder="인증 코드를 입력해주세요" />
                        <label for="verificationCode">인증 코드</label>
                     </div>
                     <button class="btn btn-info" id="verifyCodeButton" type="button" style="background-color: #69585a; color: white;">코드확인</button>
                     <br>
                     <div id="verificationResult" style="margin-top: 10px;"></div>
                  </div>
                        <div class="invalid-feedback" data-sb-feedback="password:required">An password is required.</div>
                      </div>
                      <button class="btn btn-primary btn-xl" id="submitButton" type="submit">Send</button> -->
 	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
					<input class="id_input" id="memId" name="memId" type="text" placeholder="아이디를 입력해주세요" required data-sb-validations="required"/>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			</div>
			<div class="pw_wrap">
			    <div class="pw_name">비밀번호</div>
			    <input class="pw_input" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요" required data-sb-validations="required"/>
			</div>
			<div class="pwck_wrap">
			    <div class="pwck_name">비밀번호 확인</div>
			    <input class="pw_input" id="memPwCh" name="memPwCh" type="password" placeholder="비밀번호를 한번더 입력해주세요" required data-sb-validations="required"/>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
					 <input class="pw_input" id="memNm" name="memNm" type="text" placeholder="이름을 입력해주세요" required data-sb-validations="required"/>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
					<input class="mail_input" id="memEmail" name="memEmail" type="text" placeholder="이메일을 입력해주세요" required data-sb-validations="required" />
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					<div class="mail_check_button">
						<span>인증번호</span>
					</div>
					</div>
					<div class="clearfix">
						<span id="mail_check_input_box_warn"></span>
					</div>
					
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" id="memberAddr1" name="memberAddr1" type="text"  disabled="false" " />
					</div>
					<div class="address_button" onclick="execution_daum_address()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
						<div class="address_input_2_box">
						<input class="address_input_2" id="memberAddr2" name="memberAddr2" type="text"  disabled="false"/>
					</div>
				</div>
				<div class ="address_input_3_wrap">
						<div class="address_input_3_box">
						<input class="address_input_3" id="memberAddr3" name="memberAddr3" type="text"  />
					</div>
				</div>
			</div>
			<div class="join_button_wrap">
				<button class="btn btn-primary btn-xl" id="submitButton" type="submit">회원가입</button>
			</div>
		</div>
                    </form>
                    <p class="login-link">이미 계정이 있으신가요? <a href="http://localhost:8080/loginView">로그인</a></p>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  var code = "";                //이메일전송 인증번호 저장위한 코드
  
//아이디 중복검사
 $('.id_input').on("propertychange change keyup paste input", function(){
    //console.log("keyup 테스트");   
    var memberId = $('.id_input').val();          // Value entered in .id_input
    var data = {memId: memberId};                // Data to be sent to the controller

    $.ajax({
        type: "post",
        url: "<c:url value='/memberIdChk'/>",
        data: data,
        success: function(result){
            // console.log("성공 여부" + result);
            if(result != 'fail'){
                $('.id_input_re_1').css("display", "inline-block");
                $('.id_input_re_2').css("display", "none");                
            } else {
                $('.id_input_re_2').css("display", "inline-block");
                $('.id_input_re_1').css("display", "none");                
            }
            
        } // End of success
    }); // End of ajax
}); // End of function




/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $(".mail_input").val();        // 입력한 이메일
    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    
    $.ajax({
        
    	type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
            
        	 //console.log("data : " + data);
        	 cehckBox.attr("disabled",false);
        	 boxWrap.attr("id", "mail_check_input_box_true");
        	 code = data;
        	
        }
    });
    
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
    
	 var inputCode = $(".mail_check_input").val();        // 입력코드    
	 var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
    
	 if(inputCode == code){                           		 // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }    
});



/* 다음 주소 연동 */
function execution_daum_address(){
 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
            
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            	 // 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;

            
            } else {
            	  addr += ' ';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           	$(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
              $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            alert(addr);
            alert("testset"+data.zonecode);
              // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
              $(".address_input_3").attr("readonly",false);
              $(".address_input_3").focus();
    
            
 
        }
    }).open();    
 
}
 
/* 
  	$('.id_input').focusout(function(){
  		if($('.id_input').val() == 'asd'){
  			alert("중복id");
  			$('.id_input').val('');
  			$('.id_input').focus();
  		}
  	}); */
  
  /* $(document).ready(
          function() {
             let checkCode;
             let verificationResultFlag = false; // verificationResult 상태를 저장하는 플래그

             // 확인 버튼 클릭 시 이벤트 처리
             $("#verifyCodeButton").click(
                   function() {
                      var enteredCode = $("#verificationCode")
                            .val();

                      if (enteredCode === checkCode) {
                         $("#verificationResult").html(
                               "이메일이 확인되었습니다.").css("color",
                               "green");
                         $("#verificationCode").prop("disabled",
                               true);
                         verificationResultFlag = true; // verificationResult를 true로 설정
                      } else {
                         $("#verificationResult").html(
                               "코드가 일치하지 않습니다. 다시 시도해주세요.")
                               .css("color", "red");
                         verificationResultFlag = false; // verificationResult를 false로 설정
                      }

                      // submit 버튼 상태 업데이트
                      toggleSubmitButton();
                   });

             function toggleSubmitButton() {
                // 모든 필수 입력란이 채워져 있고, verificationResult가 true이면 버튼 활성화
                if ($("#memNm").val().trim() !== ''
                      && verificationResultFlag) {
                   $("#submitButton").prop('disabled', false);
                } else {
                   $("#submitButton").prop('disabled', true);
                }
             }

             $("#sendEmailButton").click(function() {
                var email = $("#memEmail").val();

                // 이메일 중복 확인을 위한 AJAX 요청
                $.ajax({
                   type : "POST",
                   url : "<c:url value='/sendEmail' />", // 중복 확인을 위한 서블릿 또는 컨트롤러 경로
                   data : {
                      email : email
                   },
                   dataType : "json",
                   success : function(response) {
                      console.log(response);
                      if (response.code == "Y") {
                         // 이메일 중복이 없으면 이메일 확인 절차 진행
                         alert(response.msg);
                         $("#verificationCodeSection").show();
                         checkCode = response.randomCode;
                      } else {
                         // 이메일 중복이 있으면 사용자에게 알림
                         alert(response.msg);
                      }
                   },
                   error : function(xhr, status, error) {
                      console.log("에러 발생: " + error);
                   }
                });
             });

             // 아이디 중복 확인 함수
             $("#checkIdButton").click(function() {
                var memberId = $("#memId").val();
                var idExistsError = $("#idExistsError");

                $.ajax({
                   type : "GET",
                   url : "<c:url value='/checkExistingId'/>",
                   dataType : "json",
                   data : {
                      memId : memberId
                   },
                   success : function(response) {
                      console.log(response);
                      if (response.msg === "아이디 사용 가능") {
                         idExistsError.text("");
                         alert("사용 가능한 아이디입니다.");
                      } else {
                         idExistsError.text(response.msg);
                      }
                   },
                   error : function(xhr, status, error) {
                      console.log("에러 발생: " + error);
                   }
                });
             });

             // 폼 제출 시 이벤트 처리
             $("#registrationForm").submit(function(event) {
                // 이메일 인증이 완료되지 않았으면 폼 제출을 막고 안내 메시지를 표시
                if (!verificationResultFlag) {
                   event.preventDefault();
                   alert("이메일 인증이 완료되지 않았습니다.");
                }
             });
          });

    // 비밀번호 코드
     $(document).ready(function() {
       // 폼이 제출되면 비밀번호 유효성 검사를 실행합니다.
       $("#registForm").submit(function(event) {
//           // !!!!!수정!!!!!!!
//           // 비밀번호 검증 함수를 호출하여 검증 결과에 따라 제출을 막거나 진행합니다.
          if (!validatePassword()) {
             // 비밀번호 검증에 실패하면 폼 제출을 막습니다.
             $("#registForm").submit();
          }
       });
    }); 

    $(function(){
        $('#memPw').keyup(function(){
          $('#chkNotice').html('');
        });

        $('#memPwCh').keyup(function(){

            if($('#memPw').val() != $('#memPwCh').val()){
              $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
              $('#chkNotice').attr('color', '#f82a2aa3');
              
              if (chkNotice === "비밀번호 일치하지 않음<br><br>") {
                  // 이름이 입력된 경우
                  $("#submitButton").prop("disabled", false); // 가입 버튼 활성화
               } else {
                  // 이름이 입력되지 않은 경우
                  $("#submitButton").prop("disabled", true); // 가입 버튼 비활성화
               }
            } else{
              $('#chkNotice').html('비밀번호 일치함<br><br>');
              $('#chkNotice').attr('color', '#199894b3');
              
              if (chkNotice === "비밀번호 일치함<br><br>") {
                  // 이름이 입력된 경우
                  $("#submitButton").prop("disabled", true); // 가입 버튼 활성화
               } else {
                  // 이름이 입력되지 않은 경우
                  $("#submitButton").prop("disabled", false); // 가입 버튼 비활성화
               }
            }

        });
    });
    
     // 비밀번호 유효성 검사 함수
    function validatePassword() {
       var password = $("#memPw").val();
       var confirmPassword = $("#memPwCh").val();
       var passwordError = $("#passwordError");

       // 비밀번호와 비밀번호 확인 값이 다를 경우 에러 메시지 표시
       if (password !== confirmPassword) {
          passwordError.text("비밀번호가 일치하지 않습니다.");
          return false; // 유효성 검사 실패
       } else {
          passwordError.text(""); // 에러 메시지 초기화
       }
       return true; // 유효성 검사 통과
    } 

    $(document).ready(function() {
       // 이름 입력란(#memNm)의 입력 이벤트를 감지하여 가입 버튼(#submitButton)의 활성화 여부 결정
       $("#memNm").on("input", function() {
          // 이름 입력 값
          var name = $(this).val().trim();

          // 이름이 입력되었는지 여부에 따라 가입 버튼의 활성화 상태를 변경
          if (name.length > 0) {
             // 이름이 입력된 경우
             $("#submitButton").prop("disabled", false); // 가입 버튼 활성화
          } else {
             // 이름이 입력되지 않은 경우
             $("#submitButton").prop("disabled", true); // 가입 버튼 비활성화
          }
       });
    }); */
    
    

	                  
</script>
</body>
</html>













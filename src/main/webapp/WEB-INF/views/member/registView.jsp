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
background-color: #ffffff;
}

.row {
  background-color: #ffffff; /* 흰색 배경색 */
}

/* 화면 전체 렙 */
.wrapper{
width: 2000px;
background-color: #ffffff;
}

/* content 랩 */
.wrap {
  width: 650px; /* 너비 설정 */
   margin: 0 auto;
}




/* 페이지 제목 */
.subjecet{
width: 100%;
    height: 120px;
    background-color: #8EC0E4;
     margin: 0 auto;
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


/* 유효성 검사 문구 */
 
.final_id_ck{
    display: none;
}
.final_pw_ck{
    display: none;
}
.final_pwck_ck{
    display: none;
}
.final_name_ck{
    display: none;
}
.final_mail_ck{
    display: none;
}
.final_addr_ck{
    display: none;
}

 
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : green;
        display : none;    
}
.pwck_input_re_2{
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
 <form action="<c:url value="/registDo" />" id="joinForm" method="post">
             
  <div class="wrap">
<div class="subjecet text-center" >
<span>회원가입</span>
</div>
<div class="id_wrap">
<div class="id_name">아이디</div>
<input class="id_input" id="memId" name="memId" type="text" placeholder="아이디를 입력해주세요" required data-sb-validations="required"/>
<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
<span class="final_id_ck">아이디를 입력해주세요.</span>
</div>
<div class="pw_wrap">
   <div class="pw_name">비밀번호</div>
   <input class="pw_input" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요" required data-sb-validations="required"/>
<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
</div>
<div class="pwck_wrap">
   <div class="pwck_name">비밀번호 확인</div>
   <input class="pwck_input" id="memPwCh" name="memPwCh" type="password" placeholder="비밀번호를 한번더 입력해주세요" required data-sb-validations="required"/>
<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
</div>
<div class="user_wrap">
<div class="user_name">이름</div>
<input class="user_input" id="memNm" name="memNm" type="text" placeholder="이름을 입력해주세요" required data-sb-validations="required"/>
<span class="final_name_ck">이름을 입력해주세요.</span>
</div>
<div class="mail_wrap">
<div class="mail_name">이메일</div>
<input class="mail_input" id="memEmail" name="memEmail" type="text" placeholder="이메일을 입력해주세요" required data-sb-validations="required" />
<span class="final_mail_ck">이메일을 입력해주세요.</span>
<div class="mail_check_wrap">
<div class="mail_check_input_box" id="mail_check_input_box_false">
<input class="mail_check_input" disabled="disabled">
<div class="mail_check_button">
<span>인증</span>
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
<input class="address_input_1" id="memberAddr1" name="memberAddr1" type="text"  disabled />
<input class="address_input_1" id="memberAddr1" name="memberAddr1" type="hidden"   />
</div>
<div class="address_button" onclick="execution_daum_address()">
<span>주소 찾기</span>
</div>
<div class="clearfix"></div>
</div>
<div class ="address_input_2_wrap">
<div class="address_input_2_box">
<input class="address_input_2" id="memberAddr2" name="memberAddr2" type="text"  disabled />
<input class="address_input_2" id="memberAddr2" name="memberAddr2" type="hidden"   />
</div>
</div>
<div class ="address_input_3_wrap">
<div class="address_input_3_box">
<input class="address_input_3" id="memberAddr3" name="memberAddr3" type="text"  />
</div>
</div>
</div>
<div class="join_button_wrap">
<button class="join_button"  id="submitButton" type="button">회원가입</button>
</div>
<span class="final_addr_ck">주소를 입력해주세요.></span>
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
 
  /* 유효성 검사 통과유무 변수 */
  var idCheck = false;            // 아이디
  var idckCheck = false;            // 아이디 중복 검사
  var pwCheck = false;            // 비번
  var pwckCheck = false;            // 비번 확인
  var pwckcorCheck = false;        // 비번 확인 일치 확인
  var nameCheck = false;            // 이름
  var mailCheck = false;            // 이메일
  var mailnumCheck = false;        // 이메일 인증번호 확인
  var addressCheck = false         // 주소
 
 
$(document).ready(function(){
//회원가입 버튼(회원가입 기능 작동)
  $(".join_button").click(function(){
     
      /* 입력값 변수 */
      var id = $('.id_input').val();                 // id 입력란
      var pw = $('.pw_input').val();                // 비밀번호 입력란
      var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
      var name = $('.user_input').val();            // 이름 입력란
      var mail = $('.mail_input').val();            // 이메일 입력란
      var addr = $('.address_input_3').val();        // 주소 입력란
     
      /* 아이디 유효성검사 */
      if(id == ""){
          $('.final_id_ck').css('display','block');
          idCheck = false;
      }else{
          $('.final_id_ck').css('display', 'none');
          idCheck = true;
      }
     
      /* 비밀번호 유효성 검사 */
      if(pw == ""){
          $('.final_pw_ck').css('display','block');
          pwCheck = false;
      }else{
          $('.final_pw_ck').css('display', 'none');
          pwCheck = true;
      }
     

      /* 비밀번호 확인 유효성 검사 */
      if(pwck == ""){
          $('.final_pwck_ck').css('display','block');
          pwckCheck = false;
      }else{
          $('.final_pwck_ck').css('display', 'none');
          pwckCheck = true;
      }
     

      /* 이름 유효성 검사 */
      if(name == ""){
          $('.final_name_ck').css('display','block');
          nameCheck = false;
      }else{
          $('.final_name_ck').css('display', 'none');
          nameCheck = true;
      }

      /* 이메일 유효성 검사 */
      if(mail == ""){
          $('.final_mail_ck').css('display','block');
          mailCheck = false;
      }else{
          $('.final_mail_ck').css('display', 'none');
          mailCheck = true;
      }
     
      /* 주소 유효성 검사 */
      if(addr == ""){
          $('.final_addr_ck').css('display','block');
          addressCheck = false;
      }else{
          $('.final_addr_ck').css('display', 'none');
          addressCheck = true;
      }
     
      /* 최종 유효성 검사 */
       if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&addressCheck ){

//       $("#join_form").attr("action", "/member/registView");
$("#joinForm").submit();
//            $("#join_form").submit();        
     
       }    
      return false;  
     

});  
});    
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
            // 아이디 중복이 없는 경우
            idckCheck = true;
            } else {
                $('.id_input_re_2').css("display", "inline-block");
                $('.id_input_re_1').css("display", "none");
              // 아이디 중복된 경우
                idckCheck = false;
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
   
if(inputCode == code){                           // 일치할 경우
       checkResult.html("인증번호가 일치합니다.");
       checkResult.attr("class", "correct");    
       mailnumCheck = true;     // 일치할 경우  
   } else {                                            // 일치하지 않을 경우
       checkResult.html("인증번호를 다시 확인해주세요.");
       checkResult.attr("class", "incorrect");
       mailnumCheck = false;    // 일치하지 않을 경우
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
              // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
              $(".address_input_3").attr("readonly",false);
              $(".address_input_3").focus();
   
           
 
        }
    }).open();    
 
}

/* 비밀번호 확인 일치 유효성 검사 */
 
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
   
});    


 
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




<%-- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>회원가입 화면 샘플 - Bootstrap</title>


  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

   
    }

    .input-form {
      max-width: 300px;
 padding: 50px;
 width: 100%;
 margin-top: 155550px;
 margin-bottom: 100px;

      background: #fff;
      -webkit-border-radius: 50px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
     
     
    }
   
   
  </style>
</head>

<body>

  <!-- 네비게이션 영역 -->
  <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
  <!-- 네비게이션 영역 -->
 
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form action="<c:url value="/registDo" />" id="joinForm" method="post">
            <div class="mb-3">
              <label for="id_name">아이디</label>
              <input class="form-control" type="text" id="memId" name="memId" placeholder="아이디를 입력해주세요" value="" required>
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
<!-- <span class="final_id_ck">아이디를 입력해주세요.</span> -->

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
        </form>
      </div>
    </div>
  </div>
 
   <!-- footer영역 -->
  <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
  <!-- footer영역 -->
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
  <script>
  var code = "";                //이메일전송 인증번호 저장위한 코드
 
  /* 유효성 검사 통과유무 변수 */
  var idCheck = false;            // 아이디
  var idckCheck = false;            // 아이디 중복 검사
  var pwCheck = false;            // 비번
  var pwckCheck = false;            // 비번 확인
  var pwckcorCheck = false;        // 비번 확인 일치 확인
  var nameCheck = false;            // 이름
  var mailCheck = false;            // 이메일
  var mailnumCheck = false;        // 이메일 인증번호 확인
  var addressCheck = false         // 주소
 
 
$(document).ready(function(){
//회원가입 버튼(회원가입 기능 작동)
  $(".join_button").click(function(){
     
      /* 입력값 변수 */
      var id = $('.id_input').val();                 // id 입력란
      var pw = $('.pw_input').val();                // 비밀번호 입력란
      var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
      var name = $('.user_input').val();            // 이름 입력란
      var mail = $('.mail_input').val();            // 이메일 입력란
      var addr = $('.address_input_3').val();        // 주소 입력란
     
      /* 아이디 유효성검사 */
      if(id == ""){
          $('.final_id_ck').css('display','block');
          idCheck = false;
      }else{
          $('.final_id_ck').css('display', 'none');
          idCheck = true;
      }
     
      /* 비밀번호 유효성 검사 */
      if(pw == ""){
          $('.final_pw_ck').css('display','block');
          pwCheck = false;
      }else{
          $('.final_pw_ck').css('display', 'none');
          pwCheck = true;
      }
     

      /* 비밀번호 확인 유효성 검사 */
      if(pwck == ""){
          $('.final_pwck_ck').css('display','block');
          pwckCheck = false;
      }else{
          $('.final_pwck_ck').css('display', 'none');
          pwckCheck = true;
      }
     

      /* 이름 유효성 검사 */
      if(name == ""){
          $('.final_name_ck').css('display','block');
          nameCheck = false;
      }else{
          $('.final_name_ck').css('display', 'none');
          nameCheck = true;
      }

      /* 이메일 유효성 검사 */
      if(mail == ""){
          $('.final_mail_ck').css('display','block');
          mailCheck = false;
      }else{
          $('.final_mail_ck').css('display', 'none');
          mailCheck = true;
      }
     
      /* 주소 유효성 검사 */
      if(addr == ""){
          $('.final_addr_ck').css('display','block');
          addressCheck = false;
      }else{
          $('.final_addr_ck').css('display', 'none');
          addressCheck = true;
      }
     
      /* 최종 유효성 검사 */
       if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&addressCheck ){

//       $("#join_form").attr("action", "/member/registView");
$("#joinForm").submit();
//            $("#join_form").submit();        
     
       }    
      return false;  
     

});  
});    
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
            // 아이디 중복이 없는 경우
            idckCheck = true;
            } else {
                $('.id_input_re_2').css("display", "inline-block");
                $('.id_input_re_1').css("display", "none");
              // 아이디 중복된 경우
                idckCheck = false;
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
   
if(inputCode == code){                           // 일치할 경우
       checkResult.html("인증번호가 일치합니다.");
       checkResult.attr("class", "correct");    
       mailnumCheck = true;     // 일치할 경우  
   } else {                                            // 일치하지 않을 경우
       checkResult.html("인증번호를 다시 확인해주세요.");
       checkResult.attr("class", "incorrect");
       mailnumCheck = false;    // 일치하지 않을 경우
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
              // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
              $(".address_input_3").attr("readonly",false);
              $(".address_input_3").focus();
   
           
 
        }
    }).open();    
 
}

/* 비밀번호 확인 일치 유효성 검사 */
 
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
   
});  
</script>
</body>

</html> --%>
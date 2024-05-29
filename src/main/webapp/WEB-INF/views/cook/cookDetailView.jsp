<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>게시판</title>
</head>
<body>
  	<!-- 네비게이션 영역 -->
    <jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
    <!-- 네비게이션 영역 -->
    
    <div class="section-content overlay d-flex justify-content-center align-items-center">
       <table class="table table-striped table-bordered">
                   <tr>
					    <th>제목</th>
					    <!-- 
					        게시글 제목을 출력하는 입력 필드입니다.
					        입력 필드는 읽기 전용(read-only)으로 설정되어 있습니다.
					        ${freeBoard.boTitle}을 값으로 가지며, 게시글의 제목을 출력합니다.
					        입력 필드의 클래스는 "form-control input-sm"입니다.
					        입력 필드의 타입은 텍스트(text)입니다.
					        입력 필드의 이름은 "boTitle"입니다.
					    -->
					    <td><input readOnly value="${cook.ckTitle }"  
					    class="form-control input-sm" type="text" name="ckTitle"></td>
					</tr>
                    <tr>
					    <th>작성자</th>
					    <!-- 
					        게시글 작성자를 출력하는 입력 필드입니다.
					        입력 필드는 읽기 전용(read-only)으로 설정되어 있습니다.
					        ${freeBoard.boWriter}을 값으로 가지며, 게시글의 작성자를 출력합니다.
					        입력 필드의 클래스는 "form-control input-sm"입니다.
					        입력 필드의 타입은 텍스트(text)입니다.
					        입력 필드의 이름은 "boWriter"입니다.
					    -->
					    <td><input readOnly value="${cook.memId}"
						class="form-control input-sm" type="text" name="memId"></td>
					</tr>
                   
					<tr>
                        <th>내용</th>
                        <td>${cook.ckContent}</td>
                    </tr>
                     <c:if test="${sessionScope.login.memId == cook.memId }">
						<!-- 현재 로그인한 사용자와 게시글 작성자가 같은 경우에만 수정 및 삭제 버튼 표시 -->

						<div class="col-lg-8 col-xl-7 d-flex justify-content-end">

							<form action="<c:url value="/cookEditView" />" method="post">
								<!-- 게시글 수정을 위한 폼 -->
								<!-- 게시글 번호를 전송하는 hidden input -->
								<input type="hidden" name="ckNo" value="${cook.ckNo}">
								<!-- 수정 버튼 -->
								<button type="submit" class="btn btn-warning me-2">수정</button>
							</form>
							
							<form action="<c:url value="/cookboardDel" />" method="POST"
								id="delForm">
								<!-- 게시글 삭제를 위한 폼 -->
								<input type="hidden" name="ckNo" value="${cook.ckNo}">
								<!-- 삭제 버튼 -->
								<button type="button" class="btn btn-danger me-2"
									onclick="fn_check()">삭제</button>
							</form>

						</div>

					</c:if>
                </table>
                
               
</div>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    <!-- footer영역 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		
			function fn_check(){ // 삭제 확인 함수
				if(confirm("정말 삭제 하시겠습니까?")){
					document.getElementById("delForm").submit(); // 삭제 폼 제출
				}
			}
			
			/* //댓글 등록
			function fn_reply(p_id, p_no){
				if(p_id == ''){
					alert("댓글은 로그인이후에 가능합니다.");
					return;
				}
				let msg = $("#replyInput").val();
				if(msg == ''){
					alert("내용을 작성해주세요!");
					return;
				}
				let json_data = { boardNo :p_no
								  ,memId :p_id
								  ,replyContent : msg};
				alert(json_data);
				$.ajax({
					url : '<c:url value="/writeReplyDo" />'
				   ,type : 'POST'
				   ,contentType : 'application/json'
				   ,dataType: 'json'
				   ,data : JSON.stringify(json_data)
				   ,success:function(res){
					   console.log(res);
					   let str = "";
					   str +="<tr id='"+res.replyNo+"' >";
					   str +="<td>" + res.replyContent + "</td>";
					   str +="<td>" + res.memNm + "</td>";
					   str +="<td>" + res.replyDate + "</td>";
					   str +="</tr>";
					   $("#replyBody").prepend(str);
					   $("#replyInput").val(''); //입력창 초기화
					   
				   }	
				   ,error: function(e){
					   console.log(e);
				   }
				});
			} */
		</script>
</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>게시판</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <!-- 네비게이션 영역 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- 네비게이션 영역 -->
    
    <div class="section-content overlay d-flex justify-content-center align-items-center">
        <div class="container">
            <table class="table table-striped table-bordered">
                <tr>
                    <th>제목</th>
                    <td><input readOnly value="${cook.ckTitle}" class="form-control" type="text" name="ckTitle"></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input readOnly value="${cook.memId}" class="form-control" type="text" name="memId"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${cook.ckContent}</td>
                </tr>
                <c:if test="${sessionScope.login.memId == cook.memId}">
                    <!-- 현재 로그인한 사용자와 게시글 작성자가 같은 경우에만 수정 및 삭제 버튼 표시 -->
				  <tr>
				    <td colspan="2" class="text-right">
				        <form action="<c:url value="/cookEditView" />" method="post" style="display: inline;">
				            <input type="hidden" name="ckNo" value="${cook.ckNo}">
				            <button type="submit" class="btn btn-warning">수정</button>
				        </form>
				        <form action="<c:url value="/cookboardDel" />" method="POST" id="delForm" style="display: inline;">
				            <input type="hidden" name="ckNo" value="${cook.ckNo}">
				            <button type="button" class="btn btn-danger" onclick="fn_check()">삭제</button>
				        </form>
				    </td>
				</tr>
                </c:if>
            </table>
        </div>
    </div>

    <!-- footer영역 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    <!-- footer영역 -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function fn_check() {
            // 삭제 확인 함수
            if (confirm("정말 삭제 하시겠습니까?")) {
                document.getElementById("delForm").submit(); // 삭제 폼 제출
            }
        }
    </script>
</body>
</html>








<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<!-- Main Content -->
	<section id="main3">
		<div class="container">
			<!-- Contact Section Form-->
			<div class="row justify-content-center" style="margin-bottom: 50px;">
				<div class="col-lg-8 col-xl-7">
					<!-- title input-->
					<div class="text-center mb-5">
						<br>
						<h2 class="page-section-heading text-uppercase text-secondary">
							<strong>상세보기</strong></h2>
						<div class="divider-custom">
							<div class="divider-custom-line"></div>
							<div class="divider-custom-line"></div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-4">
							<label for="title"><strong>제목</strong></label>
							<h6 id="title">${board.boardTitle}</h6>
							<!-- 게시글 제목 출력 -->
						</div>
						<div class="col-md-4">
							<label for="name"><strong>작성자</strong></label>
							<h6 id="name">${board.memNm}</h6>
							<!-- 작성자명 출력 -->
						</div>
						<div class="col-md-4">
							<label for=""><strong>작성일</strong></label>
							<h6 id="boardDate">${board.boardDate}</h6>
							<!-- 게시글 작성일 출력 -->
						</div>
					</div>
					<!-- content input-->
					<div class="mb-3">
						<textarea readonly class="form-control bg-white"
							style="height: 20rem">${board.boardContent}</textarea>
						<!-- 게시글 내용 출력 -->
					</div>
					<c:if test="${sessionScope.login.memId == board.memId }">
						<!-- 현재 로그인한 사용자와 게시글 작성자가 같은 경우에만 수정 및 삭제 버튼 표시 -->

						<div class="col-lg-8 col-xl-7 d-flex justify-content-end">

							<form action="<c:url value="/boardEditView" />" method="post">
								<!-- 게시글 수정을 위한 폼 -->
								<!-- 게시글 번호를 전송하는 hidden input -->
								<input type="hidden" name="boardNo" value="${board.boardNo}">
								<!-- 수정 버튼 -->
								<button type="submit" class="btn btn-warning me-2">수정</button>
							</form>
							<form action="<c:url value="/boardDel" />" method="POST"
								id="delForm">
								<!-- 게시글 삭제를 위한 폼 -->
								<input type="hidden" name="boardNo" value="${board.boardNo}">
								<!-- 삭제 버튼 -->
								<button type="button" class="btn btn-danger me-2"
									onclick="fn_check()">삭제</button>
							</form>

						</div>

					</c:if>


				</div>
			</div>
			<form id="replyForm" action="" method="post">
				<div class="row justify-content-center">
					<div class="row col-lg-8 col-xl-7">
						<div class="col-lg-9">
							<input class="form-control" type="text" id="replyInput"
								name="replyContent"> <input type="hidden" name="memId"
								value="">
						</div>
						<div class="col-lg-3">
							<button type="button" class="btn btn-info me-2"
								onclick="fn_reply('${sessionScope.login.memId}','${board.boardNo}')">등록
							</button>
							<!-- 댓글 등록 버튼 -->
						</div>
					</div>
				</div>
			</form>
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<table class="table">
						<tbody id="replyBody">
							<c:forEach items="${replyList}" var="reply">
								<tr id="${reply.replyNo}">
									<td>${reply.replyContent}</td>
									<!-- 댓글 내용 출력 -->
									<td>${reply.memNm}</td>
									<!-- 댓글 작성자 출력 -->
									<td>${reply.replyData}</td>
									<!-- 댓글 작성일 출력 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>

	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
	<!-- 하단에 들어가는 공통 부분 include -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		
			function fn_check(){ // 삭제 확인 함수
				if(confirm("정말 삭제 하시겠습니까?")){
					document.getElementById("delForm").submit(); // 삭제 폼 제출
				}
			}
			
			//댓글 등록
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
			}
		</script>
</body>
</html>
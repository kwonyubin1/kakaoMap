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
<title>게시글 수정</title>

<!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<!-- Main Content -->
	<section id="main3">
		<div class="container">
			  <!-- Contact Section Heading-->
                <div class="text-center mb-5">
            	<br><br><br>
                <h2 class="page-section-heading text-uppercase text-secondary">수정화면</h2>
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-line"></div>
                </div>
            	</div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
               	 <div class="col-lg-8 col-xl-7">
                        <form action="<c:url value="/boardEditDo" />" method="post">
                            <!-- title input-->
                            <div class="mb-3">
                                <label for="title">제목</label>
                                <input class="form-control" id="title" name="boardTitle" type="text" value="${board.boardTitle}"/>
                            </div>
                            <!-- content input-->
                            <div class="mb-3">
                                <textarea class="form-control" name="boardContent" style="height: 20rem">${board.boardContent}</textarea>
                            </div>
                            <input type="hidden" name="boardNo" value="${board.boardNo}"/>
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" type="submit">등록</button>
                            <button class="btn btn-primary btn-xl" type="submit" href="<c:url value="/boardView" />">목록으로</button>
                        </form>
                    </div>
                </div>
		</div>
	</section>

	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
	<!-- 하단에 들어가는 공통 부분 include -->
	<!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
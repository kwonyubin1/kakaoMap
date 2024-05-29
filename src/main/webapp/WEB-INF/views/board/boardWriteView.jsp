<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <section id="main2">
        <div class="container">
            <div class="text-center mb-5">
            	<br><br><br>
                <h2 class="page-section-heading text-uppercase text-secondary">글 작성</h2>
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-line"></div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <form action="<c:url value="/boardWriteDo" />" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input class="form-control" id="title" name="boardTitle" type="text" >
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea class="form-control" id="content" name="boardContent" rows="8" ></textarea>
                        </div>
                        <button class="btn btn-primary btn-block" type="submit">등록</button>
                    </form>
                </div>
            </div>
            <!-- 게시판 목록으로 돌아가는 버튼 -->
			<div class="row justify-content-center mt-3">
				<div class="col-lg-8 col-xl-7 text-center">
					<a href="<c:url value="/boardView" />"
						class="btn btn-primary btn-block">목록으로 돌아가기</a>
				</div>
			</div>
			<!-- 게시판 목록으로 돌아가는 버튼 끝 -->
        </div>
    </section>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    function validateForm() {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;

        if (title.trim() === "" || content.trim() === "") {
            alert("제목과 내용을 모두 입력해주세요.");
            return false;
        }
        return true;
    }
    </script>
</body>
</html>
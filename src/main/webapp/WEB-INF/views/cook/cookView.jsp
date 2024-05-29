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
</head>
<body>
  	<!-- 네비게이션 영역 -->
    <jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
    <!-- 네비게이션 영역 -->
    
  <section id="main2">
    <div class="section-content overlay d-flex justify-content-center align-items-center">
      <div class="container-xxl">
        <div class="row align-items-center">
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<td>번호</td>
						<td>썸네일</td>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
						<td>날짜</td>
					</tr>
				</thead>

				<!-- 게시글 출력 -->
				<c:forEach items="${cookList}" var="cook">
					<tr>
						<td>${cook.ckNo }</td>
						<td><img src="${cook.ckImage}" alt="" style="width: 100px; height: auto;"></td>
						<td><a href="<c:url value="/cookDetailView?ckNo=${cook.ckNo}"/>">${cook.ckTitle}</a></td>
						<td>${cook.memId}</td>
						<td>${cook.ckHit}</td>
						<td>${cook.ckRegDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<a href="<c:url value="cookWriteView" />">
				<button type="button" class="btn btn-primary">글쓰기</button>
			</a>
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
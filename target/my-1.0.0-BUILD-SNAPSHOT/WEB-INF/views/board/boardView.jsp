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
						<td>제목</td>
						<td>작성자</td>
						<td>목록</td>
						<td>날짜</td>
					</tr>
				</thead>

				<!-- 게시글 출력 -->
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td>${board.boardNo }</td>
						<td><a
							href="<c:url value="/boardDetailView?boardNo=${board.boardNo}"/>">
								${board.boardTitle} </a></td>
						<td>${board.memId}</td>
						<td>${board.boardContent}</td>
						<td>${board.boardDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<a href="<c:url value="boardWriteView" />">
				<button type="button" class="btn btn-primary">글쓰기</button>
			</a>
		</div>
	</section>
	<table>
		<tr>
			<th>대분류</th>
			<td>
				<select id="mainsel">
					<option value="">-- 선택하세요 --</option>
					<c:forEach items="${comList }" var="code">
						<option value="${code.commCd}">${code.commNm}</option>
					</c:forEach>
				</select>
			</td>
			<th>중분류</th>
			<td>
			    <select id="subsel">
			    	<option value="">-- 선택하세요 --</option>
			    </select>
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</section>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    <!-- footer영역 -->

</body>
</html>
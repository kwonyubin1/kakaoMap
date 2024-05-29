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
					    <td><input readOnly value="${freeBoard.boTitle }"  
					    class="form-control input-sm" type="text" name="boTitle"></td>
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
					    <td><input readOnly value="${freeBoard.boWriter }"
						class="form-control input-sm" type="text" name="boWriter"></td>
					</tr>
                   <tr>
					    <th>분류</th>
					    <!-- 
					        게시글 분류를 출력하는 입력 필드입니다.
					        입력 필드는 읽기 전용(read-only)으로 설정되어 있습니다.
					        ${freeBoard.boCategoryNm}을 값으로 가지며, 게시글의 분류를 출력합니다.
					        입력 필드의 클래스는 "form-control input-sm"입니다.
					        입력 필드의 타입은 텍스트(text)입니다.
					        입력 필드의 이름은 "boCategoryNm"입니다.
					    -->
					    <td><input readOnly value="${freeBoard.boCategoryNm }"  
					    class="form-control input-sm" type="text" name="boCategoryNm"></td>
					</tr>
					<tr>
                        <th>내용</th>
                        <td>${freeBoard.boContent}</td>
                    </tr>
                </table>
</div>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    <!-- footer영역 -->

</body>
</html>
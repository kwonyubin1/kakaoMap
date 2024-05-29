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
    

     <section class="page-section" id="contact">
		<div class="container" style="margin-top: 0px;">
			<div class="card-body pt-0">
				<!-- data-list 내 valueNames 의 배열 내부 요소들에 대한 검색이 이루어진다 -->
				<br>
				<h2 class="page-section-heading text-uppercase text-secondary text-center">맛집추천게시판</h2>
				<!-- START : 검색 폼  -->
				<div class="row g-0 justify-content-md-center">
					<div class="col-auto col-sm-5 mb-3">
						<form name="search" action="freeList" method="post">
							<input type="hidden" name="curPage" value="${searchVO.curPage}">
							<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
							<div class="input-group">
								<div class="col-sm-2">
										<select id="id_searchType" name="searchType" class="form-control input-sm">
										    <option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : "" }>제목</option>
										    <option value="W" ${searchVO.searchType eq "W" ? "selected='selected'" : "" }>작성자</option>
										    <option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : "" }>내용</option>
										</select>
								</div>
								<div class="col-sm-2">
									<select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
										<option value="">-- 전체 --</option>
										<c:forEach items="${comList }" var="code">
											<option value="${code.commCd}" ${searchVO.searchCategory eq code.commCd ? "selected='selected'" : ""}>${code.commNm}</option>
										</c:forEach>
										
									</select>
								</div>
								<div class="col-sm-6">
									<!-- 검색바 -->
									<input class="form-control shadow-none search" name="searchWord" type="search" placeholder="검색어" aria-label="search" value="${searchVO.searchWord }" />
								</div>
								<div class="col-sm-2 text-right">
									<button type="submit" class="btn btn-primary form-control">
										<i class="fa fa-search"></i> &nbsp;검&nbsp;색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- END : 검색 폼  -->
				<!-- START : 목록건수 및 새글쓰기 버튼  -->
				<div class="row justify-content-md-end">
					<div class="col-sm-2">
						<div class="input-group">
							<label class="form-control input-sm">총 ${searchVO.totalRowCount} 건</label>
							<select id="id_rowSizePerPage"	name="rowSizePerPage" class="form-control">
								<!-- forEach 반복문 begin부터 50까지 10씩 증가  i는 10, 20, 30, 40 ,50 -->
								<c:forEach var="i" begin="10" end="50" step="10">
    								<option value="${i}"
            						${searchVO.rowSizePerPage eq i ? "selected='selected'" : ""}
            						>
        							${i}
    								</option>
							</c:forEach>
							</select>
						</div>	
					</div>
				</div>
				<!-- END : 목록건수 및 새글쓰기 버튼  -->
			</div>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%" /><col width="15%" /><col /><col width="10%" /><col width="15%" /><col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th><th>분류</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeList }" var="free">
						<tr>
							<td>${free.boNo }</td>
							<td>${free.boCategoryNm }</td>
							<td><a href="freeView?boNo=${free.boNo}">${free.boTitle }</a>
							</td>
							<td>${free.boWriter }</td>
							<td>${free.boRegDate }</td>
							<td>${free.boHit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="freeForm" class="btn btn-primary">글쓰기</a>
			</div>
			<!-- START : 페이지네이션  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 페이지 -->
					<c:if test="${searchVO.firstPage !=1 }">
						<li class="page-item">
							<a class="page-link" href="freeList?curPage=${searchVO.firstPage-1 }"
							 data-page="${searchVO.firstPage-1}" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>	
					<!-- 이전 페이지 -->
					<!-- paging -->
					<c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
					    <c:if test="${searchVO.curPage == i }">
					        <li class="page-item active">
					            <a class="page-link" href="#" data-page="${i}" >${i}</a>
					        </li>
					    </c:if>    
					    <c:if test="${searchVO.curPage != i }">
					        <li class="page-item">
					            <a class="page-link" href="freeList?curPage=${i}" data-page="${i}" >${i}</a>
					        </li>
					    </c:if>
					</c:forEach>	
					<!-- paging -->
					<!-- 다음  페이지  -->
					<c:if test="${searchVO.lastPage != searchVO.totalPageCount }">
						<li class="page-item">
							<a class="page-link" href="freeList?curPage=${searchVO.lastPage+1}" 
								data-page="${searchVO.lastPage+1}" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<!-- 다음  페이지  -->
				</ul>
			</nav>
			<!-- END : 페이지네이션  -->
		</div>
		<!-- container -->
</section>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    <!-- footer영역 -->

</body>

<script type="text/javascript">
	let search_form = $("form[name='search']");
	let cur_page = search_form.find('input[name="curPage"]');
	$(document).ready(function(){
		// 10,20,30,40,50 select box 변경시 선택 행으로 출력되도록
		$("#id_rowSizePerPage").change(function(){
			cur_page.val(1);
			search_form.find('input[name="rowSizePerPage"]').val($(this).val());
			search_form.submit();
		});
		
		search_form.find("button[type='submut']").click(function(e){
			e.preventDefault(); // 디폴트 행동취소
			cur_page.val(1);
			search_form.submit();
		});
		$('ul.pagination li a[data-page]').click(function(e){
			e.preventDefault();
			cur_page.val($(this).data('page'));
			search_form.submit();
		});
	});
</script>
</html>
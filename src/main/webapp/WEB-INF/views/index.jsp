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
<title>맛집지도</title>
<style>
.ls_wrap{
    margin: 30px 0 30px 0;
    padding: 0 10px 0 10px;
}
.ls_div_content{
	width: 80%;
    margin: auto;
    height: 275px;
    border: 1px solid #dadada;
}
.image_wrap{
	width: 80%;
    height: 60%;
    margin: auto;
    padding: 5% 0 5% 0;
    display: flex;
    align-items: center;    
}
.ls_category{
	text-align: center;
    font-size: 13px;
    color: #3e74ab;
}
.ls_rating{
	text-align: center;
    font-size: 13px;
    color: #e15b6e;
}
.ls_bookName{
	text-align: center;
    color: #333;
    font-size: 15px;
    font-weight: bold;
}
.ls_div_subject{
	font-weight: bold;
	font-size: 26px;
	padding-bottom: 10px;
}




.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/* 커스텀 */
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
</style>
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/app.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="/resources/kakaomap/css/evaluation/evaluationMap.css">
<style type="text/css">
html, body, .entire {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>

	<!-- 메시지가 있는 경우 경고창을 표시하는 스크립트 -->
	<c:if test="${not empty msg}">
		<script>alert("${msg}");</script>
	</c:if>
	<!-- 네비게이션 영역 -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- 네비게이션 영역 -->

	<c:if test="${sessionScope.login == null}">
		<section id="main">
			<div
				class="section-content overlay d-flex justify-content-center align-items-center">
				<div class="container-xxl">
					<div class="row align-items-center">
						<div class="col-md-9 welcome">
							<h1 class="welcome-title fw-light">
								저희는 <span class="text-warning fw-bold">지역의 최고의 맛집들을</span>
								찾아드립니다!
							</h1>
							<br>
							<div class="row welcome-desc">
								<p class="col-sm-2 col-md-6">
									<a href="http://192.168.0.22:8080/loginView"
										class="btn btn-primary w-100">로그인</a>
								</p>
								<p class="col-sm-2 col-md-6">
									<a href="http://192.168.0.22:8080/registView"
										class="btn btn-primary w-100">회원가입</a>
								</p>
							</div>
						</div>
						<div class="col-md-3 d-none d-md-block letsgo"></div>
					</div>
				</div>
			</div>
		</section>
	</c:if>

	<c:if test="${sessionScope.login != null}">
		<section id="main">
			<div
				class="section-content overlay d-flex justify-content-center align-items-center">
				<div class="container-xxl">
					<div class="row align-items-center">
						<div class="col-md-9 welcome">
							<h1 class="welcome-title fw-light">
								저희는 <span class="text-warning fw-bold">지역의 최고의 맛집들을</span>
								찾아드립니다!
							</h1>
							<br>
							<div class="row welcome-desc"></div>
						</div>
						<div class="col-md-3 d-none d-md-block letsgo"></div>
					</div>
				</div>
			</div>
		</section>
	</c:if>


	<section id="services">
		<div class="section-content">
			<div class="container services">
				<div class="services-header text-center mb-5">
					<h1 class="display-5">맛집추천순</h1>
					<div class="divider"></div>
					<p class="lead text-secondary">조회수가 많은순서대로 맛집을 추천드립니다!.</p>
				</div>
				<div id="slick-slide" class="slick-slider">
				    <c:forEach items="${ls}" var="cook">
				        <div class="services-col mx-2 my-3">
				            <div class="card">
				                <a href="#"> <img src="${cook.ckImage }" alt="" class="card-img-top"> </a>
				                <div class="card-body">
				                    <h2 class="card-title">${cook.ckTitle}</h2>
				                    <p class="card-title">조회수:${cook.ckHit}</p>
				                    <!-- <p class="card-text fw-light mb-4">${cook.ckContent}</p>
				                    <!-- 링크 태그 수정 -->
				                    <a href="<c:url value='/cookDetailView'/>?ckNo=${cook.ckNo}" class="btn btn-primary">바로가기</a>
				                </div>
				            </div>
				        </div>
				    </c:forEach>	
				</div>
				</div>	
				<br><br><br><br>
				<div class="container services">
				<div class="services-header text-center mb-5">
					
					<h1 class="display-5">주간맛집추천순</h1>
					<div class="divider"></div>
					<p class="lead text-secondary">주간 맛집을 추천드립니다!.</p>
				</div>
				<div id="slick-slide" class="slick-slider">
				    <c:forEach items="${ls}" var="cook">
				        <div class="services-col mx-2 my-3">
				            <div class="card">
				                <a href="#"> <img src="${cook.ckImage }" alt="" class="card-img-top"> </a>
				                <div class="card-body">
				                    <h2 class="card-title">${cook.ckTitle}</h2>
				                    <p class="card-title">조회수:${cook.ckHit}</p>
				                    <!-- <p class="card-text fw-light mb-4">${cook.ckContent}</p>
				                    <!-- 링크 태그 수정 -->
				                    <a href="<c:url value='/cookDetailView'/>?ckNo=${cook.ckNo}" class="btn btn-primary">바로가기</a>
				                </div>
				            </div>
				        </div>
				    </c:forEach>	
				</div>
				</div>
				
				
				<br><br><br><br>
				<div class="container services">
				<div class="services-header text-center mb-5">
					
					<h1 class="display-5">인플루언서 맛집</h1>
					<div class="divider"></div>
					<p class="lead text-secondary">인플루언서들의 맛집을 추천드립니다!.</p>
				</div>
				<div id="slick-slide" class="slick-slider">
				    <c:forEach items="${ls}" var="cook">
				        <div class="services-col mx-2 my-3">
				            <div class="card">
				                <a href="#"> <img src="${cook.ckImage }" alt="" class="card-img-top"> </a>
				                <div class="card-body">
				                    <h2 class="card-title">${cook.ckTitle}</h2>
				                    <p class="card-title">조회수:${cook.ckHit}</p>
				                    <!-- <p class="card-text fw-light mb-4">${cook.ckContent}</p>
				                    <!-- 링크 태그 수정 -->
				                    <a href="<c:url value='/cookDetailView'/>?ckNo=${cook.ckNo}" class="btn btn-primary">바로가기</a>
				                </div>
				            </div>
				        </div>
				    </c:forEach>	
				</div>
				</div>
				</div>
	</section>
	
	
	


			
	<!-- <section id="slogan">
    <div class="section-content d-flex align-items-center h-100">
      <div class="container slogan">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-body slogan-card">
              <h1 class="mb-3 mb-3">Our Slogan...</h1>
              <p class="lead">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae, mollitia iure. Numquam eius necessitatibus doloribus, minus ex delectus quaerat? Eos quasi saepe repellendus eaque ab optio maxime obcaecati consectetur exercitationem.</p>
              <p class="lead">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae, mollitia iure. Numquam eius necessitatibus doloribus, minus ex delectus quaerat? Eos quasi saepe repellendus.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- <section id="features">
    <div class="section-content">
      <div class="container features">
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card card-body shadow border-0 features-card">
              <h4 class="card-title mb-3">
                <span class="fw-bold">1</span>
                Feature 1
              </h4>
              <p class="card-text fw-light">Lorem ipsum dolor sit amet consectetur adipisicing elit. Id amet beatae eligendi quaerat officiis dignissimos distinctio, magnam aut laborum hic.</p>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card card-body shadow border-0 features-card">
              <h4 class="card-title mb-3">
                <span class="fw-bold">2</span>
                Feature 2
              </h4>
              <p class="card-text fw-light">Lorem ipsum dolor sit amet consectetur adipisicing elit. Id amet beatae eligendi quaerat officiis dignissimos distinctio, magnam aut laborum hic.</p>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card card-body shadow border-0 features-card">
              <h4 class="card-title mb-3">
                <span class="fw-bold">3</span>
                Feature 3
              </h4>
              <p class="card-text fw-light">Lorem ipsum dolor sit amet consectetur adipisicing elit. Id amet beatae eligendi quaerat officiis dignissimos distinctio, magnam aut laborum hic.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- <section id="gallery">
    <div class="section-content">
      <div class="container gallery">
        <div class="gallery-header text-center mb-5">
          <h1 class="display-4">Our gallery</h1>
          <div class="divider"></div>
          <p class="lead text-secondary">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi, error. Veniam, deleniti ullam. Inventore esse ab, amet voluptatum corrupti suscipit.</p>
        </div>
        <div class="row gallery-body">
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 1</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 2</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 3</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 4</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 5</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 mb-4 gallery-item">
            <div class="card card-body border-0 p-0">
              <div class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                <h2 class="gallery-title">Gallery 6</h2>
                <a class="link-warning text-decoration-none" href="#">View this gallery</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- <section id="cta" class="position-relative">
    <div class="section-content position-absolute h-100 w-100 overlay d-flex flex-column justify-content-center align-items-center">
      <div class="container text-center cta">
        <h3 class="dispaly-6 text-primary">
          Contact us anytime!
        </h3>
        <h2 class="display-4 text-light">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</h2>
        <p class="lead text-light mb-4">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Harum modi eaque maxime quasi eum eos asperiores amet quas ut? Sit.</p>
        <h1 class="m-0">
          <a href="tel:02-111-1111" class="link-warning text-decoration-none">02-111-1111</a>
        </h1>
      </div>
    </div>
  </section> -->

	<!-- 맛집 검색 기능을 위한 입력 폼 및 버튼 -->
	<!-- <div id="map">
  <input type="text" id="keyword" placeholder="맛집을 검색하세요" style="width: 200px;">
  <button onclick="searchPlaces()">검색</button>
</div> -->


	<section id="find-us">
		<!--   <div class="container-fluid px-0 mb-3">
      <div id="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14280.713052870058!2d126.97104083821134!3d37.5704304726405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca37454f683b1%3A0xfa19c5217c6a0bc0!2z6rSR7ZmU66y4!5e0!3m2!1sko!2skr!4v1629755858980!5m2!1sko!2skr" width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
      </div> 
    </div> -->
		<!--  <div class="container">
      <div class="row">
        <div class="col-md-4 offset-md-8 col-10 find-us">
          <h3>맛집검색</h3>
          <div class="divider"></div>
          <p class="text-secondary">해당하는 지역의 맛집을 찾아드립니다!.</p>
          <div class="d-flex text-secondary">
            <p class="fw-bold me-5">
              <span class="text-uppercase">phone</span>: 
              <a href="tel:02-111-1111" class="text-decoration-none">02-111-1111</a>
            </p>
            <p class="fw-bold">
              <span class="text-uppercase">email</span>: 
              <a href="mailto:jdoe@email.com" class="text-decoration-none">jdoe@email.com</a>
            </p>
          </div>
          <form action="">
            <div class="mb-3">
              <input type="text" class="form-control" placeholder="원하시는 음식을 작성해주세요">
            </div>
            <div class="mb-3">
              <input type="email" class="form-control" placeholder="원하시는 지역을 선택해주세요">
            </div>
            <div class="mb-3">
              <textarea rows="3" class="form-control" placeholder="문의내용을 작성해주세요!"></textarea>
            </div> 
            <div class="mb-3">
              <input type="checkbox" id="checkDefault" class="form-check-input">
              <label for="checkDefault" class="form-check-label text-secondary">
                I agree to provide privacy.
              </label>
            </div>
            <p class="mb-3">
              <button class="btn btn-primary w-100">맛집찾기!</button>
            </p>
          </form>
        </div>
      </div>
    </div> -->
		<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="둔산 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	</section>

	<!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- footer영역 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44b89dcd5c59e118a479c41f86a8b453&libraries=services"></script>
<script>
    $(document).ready(function(){
        $('.slick-slider').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 1000, // 1초마다 자동으로 슬라이드 전환
            prevArrow: '<button type="button" class="slick-prev">Previous</button>', // 이전 버튼 커스텀
            nextArrow: '<button type="button" class="slick-next">Next</button>', // 다음 버튼 커스텀
        });
    });
</script>
<script>
//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명과 상세 정보를 표시합니다
function displayInfowindow(marker, places) {
 var content = '<div style="padding:10px;">' +
                 '<div style="font-weight:bold; font-size:16px; margin-bottom:5px;">' + places.place_name + '</div>' +
                 '<div style="margin-bottom:5px;">주소: ' + (places.road_address_name || places.address_name || '주소 정보 없음') + '</div>' +
                 '<div>전화번호: ' + (places.phone || '전화번호 정보 없음') + '</div>' +
               '</div>';

 infowindow.setContent(content);
 infowindow.open(map, marker);
}
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    console.log('place', places);
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
        marker = addMarker(placePosition, i, places[i]), 
        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, info) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
     ///ex
     console.log(position, idx, info);
     var content = '<div class="wrap" onclick="closeOverlay(this)">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            info.place_name + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">'+info.address_name+'</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="'+info.place_url+'" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                position: marker.getPosition()       
            });

            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
            });
            

        ///ex    
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

// // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// kakao.maps.event.addListener(marker, 'click', function() {
//     overlay.setMap(map);
// });

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay(obj) {
    $(obj).empty();
    // obj.setMap(null);     
    // overlay.setMap(null);     
}
 
 
 
 
</script>



</body>

</html>
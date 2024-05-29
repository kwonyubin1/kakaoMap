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
  <title>My first Web</title>
  <link rel="stylesheet" type="text/css" href="/resources/assets/css/app.css">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link rel="stylesheet" href="/resources/kakaomap/css/evaluation/evaluationMap.css">
  <style type="text/css">
        html,body, .entire {
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
    <jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>
    <!-- 네비게이션 영역 -->

<c:if test="${sessionScope.login == null}">   
  <section id="main">	
    <div class="section-content overlay d-flex justify-content-center align-items-center">
      <div class="container-xxl">
        <div class="row align-items-center">
          <div class="col-md-9 welcome">
            <h1 class="welcome-title fw-light">저희는 <span class="text-warning fw-bold">지역의 최고의 맛집들을</span>
              찾아드립니다!</h1><br>
            <div class="row welcome-desc">
              <p class="col-sm-2 col-md-6">
                <a href="http://localhost:8080/loginView" class="btn btn-primary w-100">로그인</a>
              </p>
              <p class="col-sm-2 col-md-6">
                <a href="http://localhost:8080/registView" class="btn btn-primary w-100">회원가입</a>
              </p>
            </div>
          </div>
          <div class="col-md-3 d-none d-md-block letsgo">
          </div>
        </div>
      </div>
    </div>
  </section>
  </c:if>

  <c:if test="${sessionScope.login != null}"> 
  <section id="main">	
    <div class="section-content overlay d-flex justify-content-center align-items-center">
      <div class="container-xxl">
        <div class="row align-items-center">
          <div class="col-md-9 welcome">
            <h1 class="welcome-title fw-light">저희는 <span class="text-warning fw-bold">지역의 최고의 맛집들을</span>
              찾아드립니다!</h1><br>
            <div class="row welcome-desc">
            
            </div>
          </div>
          <div class="col-md-3 d-none d-md-block letsgo">
          </div>
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
          <p class="lead text-secondary">
              	조회수가 많은순서대로 맛집을 추천드립니다!.
          </p>
        </div>
        <!-- <div id="slick-slide" class="sercives-body">
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
          <div class="services-col mx-2 my-3">
            <div class="card">
              <a href="#">
                <img src="/resources/assets/images/메인.jpg" alt="" class="card-img-top">
              </a>
              <div class="card-body">
                <h4 class="card-title">Slide title</h4>
                <p class="card-text fw-light mb-4">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod laboriosam quisquam totam voluptatibus. Dignissimos laudantium repellendus cum adipisci. Voluptates, eligendi!
                </p>
                <a href="#" class="btn btn-primary">View more...</a>
              </div>
            </div>
          </div>
        </div> -->
<div id="slick-slide" class="slick-slider">
    <div class="services-col mx-2 my-3">
        <div class="card">
            <a href="#">
                <img src="/resources/assets/images/음식1.jpg" alt="" class="card-img-top">
            </a>
            <div class="card-body">
                <h4 class="card-title">히쓰마부시 (장어덮밥)</h4>
                <p class="card-text fw-light mb-4">
                    나고야의 명물 음식으로 꼽히는 장어덮밥인 히쓰마부시는 달콤한 소스로 양념한 장어를 숯불에 구워 밥 위에 올린 덮밥입니다. 히쓰마부시를 보기만 해도 힘이 생기는 것 같습니다.
                </p>
                <a href="#" class="btn btn-primary">바로가기</a>
            </div>
        </div>
    </div>
    <!-- 나머지 슬라이드 요소들도 동일하게 추가 -->
    <div class="services-col mx-2 my-3">
        <div class="card">
            <a href="http://localhost:8080/freeView?boNo=2004">
                <img src="/resources/assets/images/음식2.jpg" alt="" class="card-img-top">
            </a>
            <div class="card-body">
                <h4 class="card-title">왕관식당</h4>
                <p class="card-text fw-light mb-4">
                    대전 동구 중동에 위치한 '왕관식당'입니다. 하루에 두 시간만 운영되는 곳으로 매스컴에도 여러 번 소개되어 대전뿐만 아니라 전국에서도 유명한 곳입니다. 콩나물이 섞인 밥에 국내산 한우 암소로 만든 육회를 취향에 맞게 비벼 먹거나 따로 먹으면 됩니다. 
                </p>
                <a href="https://map.naver.com/p/entry/place/13571039?lng=127.4275623&lat=36.3336207&placePath=%2Fhome&entry=plt&searchType=place&c=15.00,0,0,0,dh" class="btn btn-primary">바로가기</a>
            </div>
        </div>
    </div>
     <!-- 나머지 슬라이드 요소들도 동일하게 추가 -->
    <div class="services-col mx-2 my-3">
        <div class="card">
            <a href="#">
                <img src="/resources/assets/images/음식3.png" alt="" class="card-img-top">
            </a>
            <div class="card-body">
                <h4 class="card-title">부여순대</h4>
                <p class="card-text fw-light mb-4">
                    깔끔하면서도 진한 국물의 순대국밥 전문점입니다. 간과 소면이 따로 나오는 것이 특징입니다. 잡내가 전혀 없어 남녀노소 누구나 즐길 수 있습니다. SBS 생방송투데이에 출연하기도 했던 유명 맛집입니다
                </p>
                <a href="" class="btn btn-primary">바로가기</a>
            </div>
        </div>
    </div>
     <!-- 나머지 슬라이드 요소들도 동일하게 추가 -->
    <div class="services-col mx-2 my-3">
        <div class="card">
            <a href="#">
                <img src="/resources/assets/images/음식4.jpg" alt="" class="card-img-top">
            </a>
            <div class="card-body">
                <h4 class="card-title">이태리국시</h4>
                <p class="card-text fw-light mb-4">
                    우송대 외식조리학부 졸업생들이 만든 곳으로 새롭고 창의적인 음식을 만들어 내는 공간입니다. 
                </p>
                <a href="#" class="btn btn-primary">바로가기</a>
            </div>
        </div>
    </div>
    <!-- 나머지 슬라이드 요소들도 동일하게 추가 -->
    <div class="services-col mx-2 my-3">
        <div class="card">
            <a href="#">
                <img src="/resources/assets/images/음식5.png" alt="" class="card-img-top">
            </a>
            <div class="card-body">
                <h4 class="card-title">벽제갈비 방이본점</h4>
                <p class="card-text fw-light mb-4">
                    월스트리트지가 아시아 5대 음식점의 하나로 선정했고, 중국에서 브랜드 로열티를 받는 등 해외에도 잘 알려진 벽제갈비의 방이동 본점입니다. 1++ 축산 등급 확인서를 확인할 수 있을 만큼 최고급 한우만을 취급합니다.
                </p>
                <a href="#" class="btn btn-primary">바로가기</a>
            </div>
        </div>
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
    <div>
        <input type="hidden" id="regMarkerLat" value="36.326725">
        <input type="hidden" id="regMarkerLongt" value="127.407470">

        <input type="hidden" class="home_lat" value="36.3504119">
        <input type="hidden" class="home_longt" value="127.3845475">

        <input type="hidden" class="home_lat" value="36.326725">
        <input type="hidden" class="home_longt" value="127.407470">

    </div>

    <div class="entire">
        <div class="part row">
            <!-- 지도 부분 -->
            <div id="eva_map" class="col-9">
                <!-- 주소 검색창 -->
                <div class="eva_search">
                    <div class="search_input_btn d-flex justify-content-center">
                        <input id="addr_search" type="text" placeholder="시, 군, 구 검색">
                        <button data-cityLat="" data-cityLongt="" id="addr_search_btn"></button>
                    </div>
                    <div class="search_bar"></div>
                    <div>
                        <select class="search_select search_btn" id="search_con">
                            <option selected value="base" disabled>맛집구분 ▾</option>
                            <option value="데이트">데이트</option>
                            <option value="찐맛집">찐맛집</option>
                            <option value="">상관 없음</option>
                        </select>
                    </div>
                    <div>
                        <select class="search_select search_btn" id="search_score">
                            <option value="base" selected disabled>등급 정렬 ▾</option>
                            <option value="up">등급 높은 순</option>
                            <option value="down">등급 낮은 순</option>
                            <option value="">상관 없음</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section>

  <!-- footer영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
  <!-- footer영역 -->
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
<!-- 카카오 맵 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44b89dcd5c59e118a479c41f86a8b453&libraries=services,clusterer"></script>
    <script>
        // 화면 로딩 완료 후
        $(document).ready(function () {
            setMarker(0, 0);
            // 마커를 표시할 위치와 title 객체 배열입니다
            $("#addr_search_btn").click(function(){
                
                let query =$("#addr_search").val();
                if(query != ""){
                    // 키워드로 장소를 검색합니다
                  ps.keywordSearch(query, placesSearchCB);
                }else{
                    alert("검색어를 입력하세요");
                }
            });
        });
        // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});
        // 카카오 맵 생성
        var map = new kakao.maps.Map(document.getElementById('eva_map'), { // 지도를 표시할 div
            center: new kakao.maps.LatLng($("#regMarkerLat").val(), $("#regMarkerLongt").val()), // 지도의 중심좌표
            level: 12 // 지도의 확대 레벨
        });

        // 마커 클러스터러를 생성합니다
        var clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
            minLevel: 4 // 클러스터 할 최소 지도 레벨
        });

        function setMarker(nowLat, nowLongt) {
            now_title = "";//표시
            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "home_inactive.png";
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(40, 40);
            // 마커 이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
            $.get("./chicken.json", function (data) {
                // 데이터에서 좌표 값을 가지고 마커를 표시합니다
                // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
                var markers = $(data.positions).map(function (i, position) {
                    return new kakao.maps.Marker({
                        position: new kakao.maps.LatLng(position.lat, position.lng)
                        , image: markerImage // 마커 이미지 
                    });
                });
                // 클러스터러에 마커들을 추가합니다
                clusterer.addMarkers(markers);
            });
            return now_title;
        }

        // set한 마커 다 지우기
        function hideMarkers() {
            clusterer.clear();
        }


        // 검색관련

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

      

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });

            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
            });
        }
    </script>
 
	

</body>

</html>
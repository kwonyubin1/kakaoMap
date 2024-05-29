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
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44b89dcd5c59e118a479c41f86a8b453&libraries=services,clusterer"></script>  
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
    <!-- 카카오 맵 -->
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=44b89dcd5c59e118a479c41f86a8b453&libraries=services,clusterer"></script>
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
            $.get("/resources/kakaomap/chicken.json", function (data) {
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
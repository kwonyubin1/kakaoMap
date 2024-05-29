	// page context path 가져오기
	function getContextPath() {
		let hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	
	// 화면 로딩 완료 후
	$(document).ready(function() {
		// 이 함수를 ajax보다 늦게 실행되게 해야되는데..
		// fn_getAreaData(swLatlng, neLatlng, searchJSON);
		// 마커 찍기
		setMarker(0, 0);
		// 준공년도 옵션 출력
		// yearOptions();
		// 별점 변화 시 이모티콘 출력
		// change_rate();
		// 도시 리스트 가져오기
		// fn_getCityList();
		// search 변화 감지
		// search_value_btn();
		// 평수의 양방향 슬라이드 감지
		fn_width_range_change();
	});
	
	
	// 클래스를 배열로 바꾸는 함수
	function returnClassToArr(arr, attr) {
		let temp_arr = []
		if(attr == "innerHTML"){
			for(let i = 0; i < arr.length; i++){
				temp_arr.push(arr[i].innerHTML);
			}
		}else if(attr == "val"){
			arr.each(function(index,item){
				temp_arr.push($(this).val())
			});
		}
		return temp_arr
	}
	

	
	// 카카오 맵 생성
    var map = new kakao.maps.Map(document.getElementById('eva_map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng($("#regMarkerLat").val(), $("#regMarkerLongt").val()), // 지도의 중심좌표
        level : 3 // 지도의 확대 레벨
    });
    
    // 두번째 맵 생성
    var detailMapContainer = document.getElementById('detail_map'), // 지도를 표시할 div
    detailMapOption = { 
        center: new kakao.maps.LatLng(36.326725, 127.407470), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };
    var detailMap = new kakao.maps.Map(detailMapContainer, detailMapOption); // 지도를 생성합니다
    // 두번째 맵 확대, 축소 막기
    detailMap.setZoomable(false);
    
    // 지도 중심을 이동시키는 함수!!!!
    function setCenter(nowMap, markerLat, markerLongt) {            
        // 이동할 위도 경도 위치를 생성합니다
        var moveLatLon = new kakao.maps.LatLng(markerLat, markerLongt);
        // 지도 중심을 이동 시킵니다
        nowMap.setCenter(moveLatLon);
    }
    
    // 지하철 마커들을 제어하는 함수!!!
/*
 * function setMarkers(map) { for (var i = 0; i < subwayMarkers.length; i++) {
 * console.log("하이드!2"); subwayMarkers[i].setMap(map); } }
 *  // 마커들을 감추는 함수 function hideMarkers() { console.log("하이드!");
 * setMarkers(null); }
 */
    
    // 지하철 마커 정보를 담는 배열
    // 지하철 마커 시작 하기 전에 마커 다 지우고 시작하기 위해서
    let subwayMarkers = [];
    // 클러스터가 아닌 마커 생성하기!!!!!!!!!!
    // 영역에 맞는 지하철과, 현재 마커 찍기!
    function setBaseMarker(data, detailLat, detailLongt) {
    	// 시작시 마커들 다 안보이게 하기
    	// console.log("subwayMarkers : ", subwayMarkers);
    	for(let i = 0; i < subwayMarkers.length; i++){
    		subwayMarkers[i].setMap(null);
    	}
    	subwayMarkers = [];
    	// 마커를 표시할 위치와 title 객체 배열입니다
    	var positions = [];
    	// 현재 보는 집부터 넣고
    	let detailJson = {
    		title: "현재집",
    		latlng: new kakao.maps.LatLng(detailLat, detailLongt)
    	}
    	positions.push(detailJson);
    	// data 집어넣기 (지하철 역)
    	for(let i = 0; i < data["subwayList"].length; i++){
    		let tempJson = {}
    		tempJson.title = data["subwayList"][i]["subwayName"];
    		tempJson.latlng = new kakao.maps.LatLng(data["subwayList"][i]["subwayLat"], data["subwayList"][i]["subwayLongt"]);
    		positions.push(tempJson)
    	}
    	// data 집어넣기 (버스 정류장)
    	for(let i = 0; i < data["busList"].length; i++){
    		let tempJson = {}
    		tempJson.title = data["busList"][i]["busName"];
    		tempJson.latlng = new kakao.maps.LatLng(data["busList"][i]["busLat"], data["busList"][i]["busLongt"]);
    		positions.push(tempJson)
    	}

    	// 마커 이미지의 이미지 주소입니다
    	var imageSrc = "../../images/subway.png"; 
    	var busSrc = "../../images/bus_stop.png";
    	var homeSrc = "../../images/home_active.png";
    	for (var i = 0; i < positions.length; i ++) {
    		
    	    // 마커 이미지의 이미지 크기 입니다
    	    var imageSize = new kakao.maps.Size(40, 40); 
    	    var busSize = new kakao.maps.Size(25, 25); 
    	    // 마커 이미지를 생성합니다
    	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    	    var homeImage = new kakao.maps.MarkerImage(homeSrc, imageSize); 
    	    var busImage = new kakao.maps.MarkerImage(busSrc, busSize); 
    	    
    	    if(i == 0){
        	    var marker = new kakao.maps.Marker({
        	        map: detailMap, // 마커를 표시할 지도
        	        position: positions[i].latlng, // 마커를 표시할 위치
        	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이
												// 표시됩니다
        	        image : homeImage // 마커 이미지
        	    });
        	    subwayMarkers.push(marker);
        	    continue;
    	    }
    	    // 지하철 수 만큼 넣기
    	    if(i != 0 && i <= data["subwayList"].length){
    	    	 // 마커를 생성합니다
        	    var marker = new kakao.maps.Marker({
        	        map: detailMap, // 마커를 표시할 지도
        	        position: positions[i].latlng, // 마커를 표시할 위치
        	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이
												// 표시됩니다
        	        image : markerImage // 마커 이미지
        	    });
        	    subwayMarkers.push(marker);
        	    continue;
    	    }
    	    // 버스 수 만큼 넣기
    	    var marker = new kakao.maps.Marker({
    	        map: detailMap, // 마커를 표시할 지도
    	        position: positions[i].latlng, // 마커를 표시할 위치
    	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    	        image : busImage // 마커 이미지
    	    });
    	    subwayMarkers.push(marker);
    	   
    	}
	}
    
    
    
	/*
	 * mapOptions = { center: new kakao.maps.LatLng($("#regMarkerLat").val(),
	 * $("#regMarkerLongt").val()), level: 3 };
	 */
	// 맵 생성하고 div에 뿌리기
	// var map = new kakao.maps.Map(mapContainer, mapOptions);
	
	// 마커 클러스터러를 생성합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 4 // 클러스터 할 최소 지도 레벨
    });
	
	
	// ------------------------ 전역변수 선언 >> 지도 영역 정보 ------------------------
	let bounds = map.getBounds();
	// 남서쪽의 정보
	let swLatlng = bounds.getSouthWest();
	// 북동쪽의 정보
	let neLatlng = bounds.getNorthEast();
	// 주소 정보
	var addr = $("input[name='markerAdd']").val();
	// console.log("전역에 선언한 addr : ", addr);
	// 현재 타이틀
	let now_title
	// 현재 보고 있는 집의 위도, 경도
	let detail_lat;
	let detail_longt;
	// 마커 리스트
	let markerInfoList = [];
	// 도시 리스트
	let cityList;
	// 현재 마커의 정보
	// let nowMarkerInfo;
	// 검색 조건 가져갈 JSON
	let searchJSON = {
						 	 searchCon : ""
						 	,searchScore : ""
						 	,widthMax : 100
						 	,widthMin : 0
						}
	// 서버 >> html >> script 클래스 배열로 형변환
	// 여기서 title이라 명명했지만 id임
	// 모든 마커들의 정보
	let home_title = $(".home_title");
	let home_title_list = returnClassToArr(home_title, "val");
	let home_lat = $(".home_lat");
	let home_lat_list = returnClassToArr(home_lat, "val");
	let home_longt = $(".home_longt");
	let home_longt_list = returnClassToArr(home_longt, "val");
	let home_con = $(".home_con");
	let home_con_list = returnClassToArr(home_con, "val");
	let home_width = $(".home_width");
	let home_width_list = returnClassToArr(home_width, "val");
	
	
	// DB에서 불러온 정보로 마커 찍기
	// 마커를 표시할 위치와 title 객체 배열입니다
	function setMarker(nowLat, nowLongt) {
		// console.log(searchJSON["searchCon"]);
		var positions = [];
		now_title = "";
		// 계약 상세를 위한 배열
		let con_title_list = [];
		let con_lat_list = [];
		let con_longt_list = [];
		let con_width_list = [];
		// 검색을 위한 배열
		let search_title_list = [];
		let search_lat_list = [];
		let search_longt_list = [];
		let search_width_list = [];
		// 여기서 마커들의 위도 경도를 담는데, 검색 조건의 조건들을 넣어준다
		// 계약 상세 값이 있을 시
		// db 처리하는게 더 좋을듯함
		if(searchJSON["searchCon"] != null && searchJSON["searchCon"] != ""){
			for(let i = 0; i < home_con_list.length; i++){
				// 검색의 계약 상세와 마커의 계약 상세가 같을 시
				if(home_con_list[i] == searchJSON["searchCon"]){
					// 계약 상세 배열에 값들 밀어넣기
					con_title_list.push(home_title_list[i]);
					con_lat_list.push(home_lat_list[i]);
					con_longt_list.push(home_longt_list[i]);
					con_width_list.push(home_width_list[i]);
				}
			}
		}else{		// 검색 조건이 없으면
			con_title_list = home_title_list;
			con_lat_list = home_lat_list;
			con_longt_list = home_longt_list;
			con_width_list = home_width_list;
		}
		
		// console.log("con_title_list : ", con_title_list);
		// console.log("con_lat_list : ", con_lat_list);
		// console.log("con_longt_list : ", con_longt_list);
		// console.log("con_width_list : ", con_width_list);
		
		// 면적 검색 조건이 있을 시!!
		// 일단 ~~평을 숫자로 만들어주자
		// 최솟값, 최댓값 다 있을 시!
		if(searchJSON["widthMin"] != 0 && searchJSON["widthMax"] != 100){
			for(let i = 0; i< con_title_list.length; i++){
				let int_width = (con_width_list[i].replace("평","")) * 1;
				// console.log("int_width : ", int_width);
				// console.log("최소 : ", searchJSON["widthMin"])
				// console.log("최대 : ", searchJSON["widthMax"])
				if(searchJSON["widthMin"] <= int_width && int_width <= searchJSON["widthMax"]){
					// 검색 배열에 값들 밀어넣기
					search_title_list.push(con_title_list[i]);
					search_lat_list.push(con_lat_list[i]);
					search_longt_list.push(con_longt_list[i]);
					search_width_list.push(con_width_list[i]);
				}
			}
		// 최솟값만 있을 시!
		}else if(searchJSON["widthMin"] != 0 && searchJSON["widthMax"] == 100){
			for(let i = 0; i< con_title_list.length; i++){
				let int_width = (con_width_list[i].replace("평","")) * 1;
				if(searchJSON["widthMin"] <= int_width){
					// 검색 배열에 값들 밀어넣기
					search_title_list.push(con_title_list[i]);
					search_lat_list.push(con_lat_list[i]);
					search_longt_list.push(con_longt_list[i]);
					search_width_list.push(con_width_list[i]);
				}
			}
		// 최댓값만 있을 시!
		}else if(searchJSON["widthMin"] == 0 && searchJSON["widthMax"] != 100){
			for(let i = 0; i< con_title_list.length; i++){
				let int_width = (con_width_list[i].replace("평","")) * 1;
				if(int_width <= searchJSON["widthMax"]){
					// 검색 배열에 값들 밀어넣기
					search_title_list.push(con_title_list[i]);
					search_lat_list.push(con_lat_list[i]);
					search_longt_list.push(con_longt_list[i]);
					search_width_list.push(con_width_list[i]);
				}
			}
		// 둘다 없을 시!
		}else{
			search_title_list = con_title_list;
			search_lat_list = con_lat_list;
			search_longt_list = con_longt_list;
			search_width_list = con_width_list;
		}
		
		// console.log("search_title_list : ", search_title_list);
		// console.log("search_lat_list : ", search_lat_list);
		// console.log("search_longt_list : ", search_longt_list);
		// console.log("search_width_list : ", search_width_list);
		
		// 집어 넣은 값들 마커 위치 잡아주기
		for(let i = 0; i < home_lat_list.length; i++){
			let tempJSON = {}
			tempJSON.title = search_title_list[i];
			// tempJSON.latlng = new kakao.maps.LatLng(home_lat_list[i],
			// home_longt_list[i]);
			// console.log("tempJSON : ", tempJSON);
			tempJSON.lat = search_lat_list[i];
			tempJSON.lng = search_longt_list[i];
			positions.push(tempJSON);
		};
		// console.log("positions : ", positions);
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "../../images/house_marker.png"; 
		var activeSrc = "../../images/home_active.png";
		    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(40, 40); 
	    var activeSize = new kakao.maps.Size(40, 40);
	    
	    // 마커 이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    // 현재 활성화 된 마커 이미지
	    var activeMarker = new kakao.maps.MarkerImage(activeSrc, activeSize); 
	    
		// for (var i = 0; i < positions.length; i ++) {
		    
		    
	
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
       var markers = positions.map(function(i, position) {
    	   // console.log("test!!!!!! : ", i.lat, i.lng);
    	   // script map에 대한 이해가 필요하다!!
    	   // 현재 위도, 경도와 같은 마커는
    	   // 이미지 변경!!
    	   if(i.lat == nowLat && i.lng == nowLongt){
    		   // console.log(i.lat , "잘 탔습니다!!");
    		   now_title = i.title;
        	   return new kakao.maps.Marker({
                   position : new kakao.maps.LatLng(i.lat, i.lng),
                   title : i.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                   image : activeMarker // 마커 이미지
               });
    	   }else{
        	   return new kakao.maps.Marker({
                   position : new kakao.maps.LatLng(i.lat, i.lng),
                   title : i.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                   image : markerImage // 마커 이미지
               });
    	   }
        });
        // 클러스터러에 마커들을 추가합니다
        // console.log("markers : ", markers);
        clusterer.addMarkers(markers);

		    // 마커를 생성합니다
		    /*
			 * var marker = new kakao.maps.Marker({ map: map, // 마커를 표시할 지도
			 * position: positions[i].latlng, // 마커를 표시할 위치 title :
			 * positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 image :
			 * markerImage // 마커 이미지 });
			 */
		// }
        return now_title;
	}
	
	// set한 마커 다 지우기
	function hideMarkers() {
		clusterer.clear();
	}
	
	
	// 일단 여기는 나중에.. db에서 값 가져와서 마커 찍는거부터 하자
	// 현재 지도 영역의 남서쪽 값과 북동쪽 값 가져오기
	// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'bounds_changed', function() {             
	    
	    // 지도 영역정보를 얻어옵니다
	    bounds = map.getBounds();
	    
	    // 영역정보의 남서쪽 정보를 얻어옵니다
	    swLatlng = bounds.getSouthWest();
	    
	    // 영역정보의 북동쪽 정보를 얻어옵니다
	    neLatlng = bounds.getNorthEast();
	    
	    // console.log("swLatlng : ", swLatlng);
	    // console.log("neLatlng : ", neLatlng);
	    
	    // 여기서 ajax로 위도, 경도에 맞는 마커 정보와 상세 정보 가져오기
	    fn_getAreaData(swLatlng, neLatlng, searchJSON);
	    
	});
	
	// 주소-좌표 변환 객체를 생성합니다(지도에 마커 찍기 위해.. 선언 필요)
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 파라미터로 주소를 입력받고
	// 그 주소 위도, 경도 input 태그에 넣기
	// 그리고 그 위치로 지도 이동
	function fn_signMarker(addr) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면
		     if (status === kakao.maps.services.Status.OK) {
				 // console.log("addr : ", addr)
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값
		        // console.log("coords.La(경도) : ", coords.La);
		        // console.log("coords.Ma(위도) : ", coords.Ma);
				// input 창에 값 넣어주기
				$("#markerLat").val(coords.Ma);
				$("#markerLongt").val(coords.La);
				
		     	// 마커 값을 가지고 데이터를 가지고 가서 db에 저장해야함
		     	// (위도, 경도, 건물명(타이틀), 주소)
		     	// fn_registeMarkerAjax(coords.Ma, coords.La, title, addr);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		       // map.setCenter(coords);
		    } 
		});
	};
	
	
	
	// 다음 주소 API
	// 이제 안쓴다!!!!!!!!!
	// 회원 주소 = 마커 주소
	function fn_getUserAdd() {
		/*
		// 마커에 간단한 정보를 등록할 창 띄워줌(마커 이미지는 관리자만 건들 수 있게 할까?)
		// 보통 건물명이 아니라 월세, 전세 가격으로 나와있는데 이를 어떻게 할까..
		
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var extraAddr = ''; // 참고항목 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					// document.getElementById("addDetail").value = addr;
					// console.log("extraAddr : ", extraAddr);
				} else {
					// document.getElementById("sample6_extraAddress").value =
					// '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.getElementById('sample6_postcode').value =
				// data.zonecode;
				document.getElementById("addDetail").value = addr;
				// console.log("data.zonecode : ", data.zonecode);
				// console.log("addr : ", addr);
				
				// TODO 여기서 회원가입시 주소값과 같은지 판별하고 >> 서버 갔다와야겠지?
				
				// 마커를 지도에 표시 함수, db에 저장
				// fn_signMarker(addr, title);
				
				// 주소를 잘 받아왔음 위도, 경도 정보도 넣자!
				fn_signMarker(addr);
			}
		}).open();
		*/
		alert("마커의 주소는 회원 가입시 입력한 주소입니다!\n" +
				"주소를 변경하고 싶으시면 회원 정보를 수정해주세요!")
	};
	
	// ajax로 마커 등록하기
	// 폼으로 서버에 전송하기 때문에 일단 안쓴다!
	function fn_registeMarkerAjax(La, Ma, title, addr) {
		$.ajax({
			url :  "/evaluation/registeMarker"
			,type : "post"
			,data : {"markerLat" : La, "markerLongt" : Ma, 
					  "markerTitle" : title, "markerAdd" : addr,
					   "markerRegId" : 'hgp'}	// MARKER_REG_ID는 나중에서 세션에서 가져올것
			,success : function(data) {
				// 서버에서 오류 발생
				if(data == false){
					alert("서버에서 정상적으로 등록하지 못했습니다. 전산실에 문의해주세요 010-4403-9382")
				}
				alert("마커 등록 완료");
			}
			,error : function(request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		        alert("마커를 정상적으로 등록하지 못했습니다. 전산실에 문의해주세요 010-4403-9382");
			}
		});
	};
	
	
	/*
	 * 						 searchCon 
						 	searchScore 
						 	widthMax 
						 	widthMin 
	 */
	
	// ajax로 영역에 맞는 데이터 가져오기
	function fn_getAreaData(swLatlng, neLatlng, searchJSON) {

		// $.ajax({
		// 	url : getContextPath() + "/areaData"
		// 	,type : "post"
		// 	,data : {
		// 				"minLat" : swLatlng.Ma, "maxLat" : neLatlng.Ma,
		// 				"minLongt" : swLatlng.La, "maxLongt" : neLatlng.La,
		// 				"searchCon" : searchJSON.searchCon , "searchScore" : searchJSON.searchScore,
		// 				"widthMax" : searchJSON.widthMax, "widthMin" : searchJSON.widthMin
		// 			  }
		// 	,success : function(data) {
		// 		// console.log("data : ", data);
		// 		// 데이터 화면에 뿌려주기
		// 		$("#home_review").empty();
		// 		let home_review_text = "";
		// 		for(let i = 0; i < data.length; i++){
		// 			// 마커들 정보 배열에 담기
		// 			markerInfoList.push(data[i]);
					
		// 			home_review_text += 
		// 				`
		// 					<div class="marker_view row top_bottom_margin" 
		// 					data-markerLat = ${data[i]["markerLat"]} data-markerLongt = ${data[i]["markerLongt"]}>
		// 						<div class="style_none home_eva_id">${data[i]["markerId"]}</div>
		// 						<div class="col-md-5">
		// 							<img class="home_eva_img" alt="홈사진" src='/image/${data[i]["markerImage"]}'>
		// 						</div>
		// 						<div class="col-md-1"></div>
		// 						<div class="col-md-6">
		// 							<div class="markerCon">${data[i]["markerCon"]} ${data[i]["markerConDetail"]}</div>
		// 							<div class="markerAdd font-size-small">${data[i]["markerAdd"]}</div>
		// 							<div class="markerWidth">면적 : ${data[i]["markerWidth"]}</div>
		// 				`
		// 			// 별 집어 넣기!!!!!
		// 			// 별점 퍼센트
		// 			let starScore = ((data[i]["markerScore"] * 20)) + "%";
		// 			// console.log("starScore : ", starScore);
		// 			home_review_text +=
		// 				`
		// 							<div class="star-ratings">
		// 								<div 
		// 							    class="star-ratings-fill space-x-2 text-lg" style="width: ${starScore}"
		// 								>
		// 									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		// 								</div>
		// 								<div class="star-ratings-base space-x-2 text-lg">
		// 									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		// 								</div>
		// 							</div>
		// 							<span class="detail_score">${data[i]["markerScore"]}점<span>
		// 				`
		// 			home_review_text +=
		// 				`
		// 						</div>
		// 						<div class="col-md-1"></div>
		// 					</div>
		// 				`
		// 		}
		// 		// console.log("home_review_text : " , home_review_text);
		// 		$("#home_review").append(home_review_text);
		// 	}
		// 	,error : function(request, status, error) {
		//         console.log("code: " + request.status);
		//         console.log("message: " + request.responseText);
		//         console.log("error: " + error);
		//         alert("서버와의 통신 오류가 발생했습니다. 전산실에 문의해주세요 010-4403-9382");
		// 	}
		// 	,complete : function() {
		// 		// 현재 hover한 리스트의 이미지 바꾸기
		// 		// console.log("칠드런 : ", $('#home_review').children());
		// 		$('#home_review').children().hover(function() {
		// 			// 마커 감추기
		// 			hideMarkers();
		// 			// alert("호버");
		// 			fn_get_hover_list_info(this);
		// 		}, function() {	// hover 벗어나면!
		// 			// 마커 감추기
		// 			hideMarkers();
		// 			// 다시 마커 찍기
		// 			setMarker(0,0);
		// 		});
				
		// 		// 리스트 중 하나 클릭시
		// 		$('#home_review').children().click(function() {
		// 			// 리스트 목록 지우기
		// 			$(".markerInfo").empty();
		// 			// this의 이미지, key값 가져오기
		// 			let img_src = $(this).find(".home_eva_img").attr("src");
		// 			let marker_id = $(this).find(".home_eva_id").html();
		// 			detail_lat = $(this).attr("data-markerLat");
		// 			detail_longt = $(this).attr("data-markerLongt");
		// 			// console.log("img_src : ", img_src);
		// 			// console.log("marker_id : ", marker_id);
		// 			// console.log("detail_lat : ", detail_lat);
		// 			// console.log("detail_longt : ", detail_longt);
		// 			// console.log("markerInfoList : ",
		// 			// markerInfoList[0]["markerId"]);
		// 			for(markerInfo of markerInfoList){
		// 				// console.log("markerInfo : ", markerInfo);
		// 				if(markerInfo["markerId"] == marker_id){
		// 					nowMarkerInfo = markerInfo;
		// 				}
		// 			}
		// 			// console.log("nowMarkerInfo : ", nowMarkerInfo);
		// 			// 마커 목록 부분 지우기
		// 			$(".marker_list").css("display","none");
		// 			// 상세 부분 나오기
		// 			$(".home_detail").css("display", "block");
		// 			// 상세 부분 나올때 맵2에게 알려주기
		// 			detailMap.relayout();
		// 			// 맵2 중심 옮기기
		// 			setCenter(detailMap, detail_lat, detail_longt);
		// 			// 목록 부분에 상세 페이지 부분 넣기
		// 			appendMarkerInfo(nowMarkerInfo);
		// 		});
		// 	}
		// });
	}
	
	// 주소 상세 어팬드
	function appendMarkerInfo(nowMarkerInfo) {
		let home_detail_html = "";
		// 별 채우는 넓이
		let starScore = ((nowMarkerInfo["markerScore"] * 20) + 1.5) + "%";
		// 등록 날짜
		let signDay = nowMarkerInfo["markerRegDate"].split(" ")[0];
		home_detail_html += `
			<img class="markerInfoImage" alt="홈사진" src='/image/${nowMarkerInfo["markerImage"]}'>
			<div class="col-md-5">
				<div class="markerInfoId margin-left margin-top-bottom-10">등록 번호 ${nowMarkerInfo["markerId"]}</div>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-3">
				<div class="markerInfoDay margin-top-bottom-10">${signDay}</div>
			</div>
			<div class="col-md-12">`
		// 등록 아이디랑 세션의 아이디가 같으면
		if(nowMarkerInfo["markerRegId"] == $("#markerRegId").val() ){
			home_detail_html += `
				<div class="update_delete_btn">
					<div>
						<button type="button" class="btn_eva color_home" onclick="fn_home_modify(nowMarkerInfo)">수정</button>
					</div>
					<div>
						<button type="button" class="btn_eva color_home" onclick="fn_home_delete()">삭제</button>
					</div>
				</div>
				`
		}
		home_detail_html +=`
				<div class="makerInfoAdd margin-left">${nowMarkerInfo["markerAdd"]}</div>
				<div class="markerInfoCon margin-left">${nowMarkerInfo["markerCon"]} ${nowMarkerInfo["markerConDetail"]}</div>
				<div class="bottom-bar"></div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/title.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerTitle"]}
					</span>
				</div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/width.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerWidth"]}
					</span>
				</div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/build.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerBuildYear"]}
					</span>
				</div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/type.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerType"]}
					</span>
				</div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/park.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerPark"]}
					</span>
				</div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/score.svg"> 
					<span class="eva_icon_detail">
						<div class="star-ratings eva_detail_star">
							<div 
						    class="star-ratings-fill space-x-2 text-lg" style="width: ${starScore}"
							>
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
						<span class="detail_score">${nowMarkerInfo["markerScore"]}점<span>
					</span>
				</div>
				<div class="bottom-bar"></div>
				<div class="margin-padding">
					<img class="eva_icon" src="/images/icon/writer.svg"> 
					<span class="eva_icon_detail">
						${nowMarkerInfo["markerRegId"]}
					</span>
				</div>
				<div class="margin-padding eva_detail_text">
					<img class="eva_icon" src="/images/icon/writing.svg"> 
					<span class="eva_icon_detail font-bold">
						상세 평가
					</span>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8 eva_detail_content">${nowMarkerInfo["markerEvaDetail"]}</div>
					<div class="col-md-2"></div>
				</div>
				<div class="bottom-bar"></div>
				<div class="near_trapic font-bold">주변 정류장</div>
			</div>
								`
		$(".markerInfo").append(home_detail_html);
	}
	
	// 주소 수정 함수
	function fn_home_modify(nowMarkerInfo) {
		// 주소를 잘 받아왔음 위도, 경도 정보도 넣자!
		fn_signMarker(addr);
		// 모달 띄우기
		$("#addModal").modal("show");  
		// 수정 모달 내용 채우기;
		fn_home_modify_content(nowMarkerInfo);
	}
	
	// 수정 모달 안에 값 넣기
	function fn_home_modify_content(nowMarkerInfo) {
		$("#addModalLabel").text("내 집 평가 수정");
		// console.log("nowMarkerInfo : ", nowMarkerInfo);
		// 마커 위도 경도
		$("input[name='markerLat']").val(nowMarkerInfo["markerLat"]);
		$("input[name='markerLongt']").val(nowMarkerInfo["markerLongt"]);
		// 타이틀
		$("input[name='markerTitle']").val(nowMarkerInfo["markerTitle"]);
		// 상세 주소
		$("input[name='markerAdd']").val($(".member_home_add").val());
		// 계약 상태(셀렉박스 집고 val == 옵셥 값 하면 된다!!!!)
		$("select[name='markerCon']").val(nowMarkerInfo["markerCon"]).prop("selected", true);
		// 계약 상세
		$("input[name='markerConDetail']").val(nowMarkerInfo["markerConDetail"]);
		// 건물 면적
		$("input[name='markerWidth']").val(nowMarkerInfo["markerWidth"]);
		// 준공 년도
		$("select[name='markerBuildYear']").val(nowMarkerInfo["markerBuildYear"]).prop("selected", true);
		// 주차 여부
		$("select[name='markerPark']").val(nowMarkerInfo["markerPark"]).prop("selected", true);
		// 건물 종류
		$("select[name='markerType']").val(nowMarkerInfo["markerType"]).prop("selected", true);
		// 등급 평가 (여기 확인 필요)
		$("input[name='markerScore']").val(nowMarkerInfo["markerScore"]);
		// 별 넒이
		let starScore = ((nowMarkerInfo["markerScore"] * 20) + 1.5) + "%";
		$(".eva_star span").css("width", starScore);
		// 이미지 비우고 추가
		$(".image-preview li").remove();
		$(".image-preview").append(`<li><img src="/image/${nowMarkerInfo['markerImage']}"</li>`);
		// 상세 평가
		$("textarea[name='markerEvaDetail']").val(nowMarkerInfo["markerEvaDetail"]);
		// 확인 버튼 수정으로, 클릭 이벤트도 바꾸기
		$("#addCompleteBtn").text("수정");
	}
	
	// 홈 평가 삭제 함수
	function fn_home_delete() {
		// alert("삭제");
		// 탈퇴 모달 띄우기
		$("#modal_div1").fadeIn();
	}
	
	// 삭제 모달 관련 함수
	function fn_Cancel(){
		$("#modal_div1").fadeOut();
	}
	
	// 삭제 모달 함수 구현
	function fn_markerDeleteSubmit(){
		// console.log("fn_markerDeleteSubmit");
		let ret = confirm("탈퇴를 진행하시겠습니까?");
		if(ret){
			let f = document.deleteForm;
			// console.log("f : ", f);
			f.submit();
		}else{
			$("#modal_div1").fadeOut();	
		}
	}
	
	// 주소 입력 모달
	function fn_AddView() {
		// form 리셋
		$("#addForm")[0].reset();
		// 이미지 리셋
		$(".image-preview > li").remove();
		// 별 등급, 별 이모티콘 리셋
		$(".eva_star span").css("width", 0);
		$(".emote").empty();
		// 만약 수정이면 확인으로
		$("#addCompleteBtn").text("확인");
		// 주소를 잘 받아왔음 위도, 경도 정보도 넣자!
		fn_signMarker(addr);
		// 모달 띄우기
		$("#addModal").modal("show");     
	}
	
	// 주소 입력 모달 확인 버튼 클릭시
	$("#addCompleteBtn").on("click", function() {
		// alert("fn_addCompleteBtn");
		// input창에 위도, 경도 넣어주고
		// 서버로 보내기
		// 확인 일 때, 수정일 때 다름!
		if($("#addCompleteBtn").text() == "확인"){
			$("#addForm").submit();
		}else if($("#addCompleteBtn").text() == "수정"){
			$("#addForm").attr("action", getContextPath()+"/modifyMarker");
			$("#addForm").submit();
		}
	});
	
	// 이미지 파일 넣을 시 인풋에 그 값 집어넣기
	$("#home_image").on('change',function(){
		  let fileName = $("#home_image").val();
		  $(".image_name").val(fileName);
		});
	
	// 이미지 업로드 관련 함수들
	function getImageFiles(e) {
		const files = e.currentTarget.files;
		const imagePreview = document.querySelector('.image-preview');
		const file = files[0];
		const reader = new FileReader();
		reader.onload =  function(e){  
			const preview = createElement(e, file);
			let imageLiTag = document.querySelector('.image-preview > li');
			if(imageLiTag){
				imagePreview.removeChild(imagePreview.firstElementChild);
			}
			imagePreview.appendChild(preview);
		};
		reader.readAsDataURL(file); 
	}
	
	function createElement(e, file) {
		const li = document.createElement('li');
		const img = document.createElement('img');
		img.setAttribute('src', e.target.result); // img.setAttribute('src',
													// reader.result);
		img.setAttribute('data-file', file.name);
		li.appendChild(img);
		return li;
	}
	
	const realUpload = document.querySelector('.real-upload');
	const upload = document.querySelector('.upload');
	
	upload.addEventListener('click', function(e){
		realUpload.click();  
	});
	
	realUpload.addEventListener('change', getImageFiles);
	// 이미지 업로드 끝
	
	// hover한 리스트의 위도 경도 가져와서 marker 찍기!!!
	function fn_get_hover_list_info(now) {
		let nowLat = $(now).attr("data-markerLat");
		let nowLongt = $(now).attr("data-markerLongt");
		// console.log("nowLat : ", nowLat , " nowLongt : ", nowLongt);
		// 마커 찍기
		setMarker(nowLat, nowLongt);
	}
	
	

	// 클러스터 변경
	// 클러스터링이 완료됐을 때 발생한다.
	// 실행순서때문에 로직이 좀 꼬였다~
	kakao.maps.event.addListener(clusterer, 'clustered', function(clusters ) {
		// 클러스터 리스트 반복문
	    for(var i=0; i<clusters.length; i++){            
	    	var cluster = clusters[i];
			var overlay = cluster.getClusterMarker().getContent();
			// 클러스터 안의 마커들의 반복문
			let clu_markers = cluster["_markers"];
			let checkInTitle = false;
			for(let k = 0; k < clu_markers.length; k++){
				// title과 클러스터 안의 마커의 title이 같다면
				// console.log("여기서 확인 해야 합니다!! : ", clu_markers[k]["Gb"], " vs
				// (now_title)", now_title);
				if(clu_markers[k]["Gb"] == now_title){
					checkInTitle = true;
				}
			}
			// console.log("checkInTitle : ", checkInTitle);
			if(checkInTitle == true){
				// 클러스터 변경
				// var content = "<div style='cursor: pointer; width: 52px;
				// height: 52px; border-radius: 52px; border: 1px solid #1a86ae;
				// background-color:white; line-height: 52px; font-size: 14px;
				// text-align: center; font-weight:
				// bold;'>"+cluster.getSize()+"</div>";
				overlay.classList.add('div_hover');
				cluster.getClusterMarker().setContent(overlay);
				checkInTitle = false;
				break;
			}else{
				overlay.classList.remove('div_hover');
				cluster.getClusterMarker().setContent(overlay);
			}
			// console.log("cluster : ", cluster);
			// console.log("cluster : ", cluster["_markers"][0]["Gb"]); //
			// cluster["_markers"]가 배열이다
			// console.log("overlay : ", overlay);
	    }
	});

	// 상세부분에서 뒤로가기
	function fn_evaBack() {
		// 마커 목록 부분 지우기
		$(".marker_list").css("display","block");
		// 상세 부분 나오기
		$(".home_detail").css("display", "none");
		// 상세 들어갔다 나오면 목록 출력 이상하니 다시 아작스 통신
	}
	
	
	// 상세 부분 중앙 이동시 이벤트
	kakao.maps.event.addListener(detailMap, 'center_changed', function() {
	    // alert('center changed!');
	    // 지도 영역정보를 얻어옵니다
	    bounds = detailMap.getBounds();
	    // 영역정보의 남서쪽 정보를 얻어옵니다
	    let tempSwLatlng = bounds.getSouthWest();
	    // 영역정보의 북동쪽 정보를 얻어옵니다
	    let tempNeLatlng = bounds.getNorthEast();
	    
	    // 여기서 ajax로 위도, 경도에 맞는 지하철 정보 가져오기
	    fn_getAreaSubwayData(tempSwLatlng, tempNeLatlng);
	});
	
	// ajax로 영역에 맞는 지하철, 버스 정보 가져오기
	function fn_getAreaSubwayData(swLatlng, neLatlng) {
		$.ajax({
			url : getContextPath() + "/areaSubwayData"
			,type : "post"
			,data : {"minLat" : swLatlng.Ma, "maxLat" : neLatlng.Ma,
					  "minLongt" : swLatlng.La, "maxLongt" : neLatlng.La}
			,success : function(data) {
				// console.log(data);
				// 전역에 버스, 지하철 리스트
				// console.log("busList : ", data["busList"]);
				let busList = data["busList"];
				// console.log("subwayList : ", data["subwayList"]);
				let subwayList = data["subwayList"];
				// 지하철, 버스 정보 마커 찍기
				setBaseMarker(data, detail_lat, detail_longt);
				// 지하철, 버스 정보 화면에 출력
				signTrapicList(busList, subwayList);
			}
			,error : function(request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		        alert("서버와의 통신 오류가 발생했습니다. 전산실에 문의해주세요 010-4403-9382");
			}
		});
	}
	
	function signTrapicList(busList, subwayList) {
		// 기존 내용 지우고 시작
		$("#trapicList").empty();
		let tempHtml = "";
		// 정류장 추가
		tempHtml += 
		`
			<div class="col-md-2">
				<img class="eva_icon" src="/images/icon/bus.svg"> 
			</div>
			<div class="col-md-4">
		`
		for(bus of busList){
			tempHtml += `<div class="trapic_text">${bus.busName}</div>`
		}
		tempHtml +=
		`
			</div>
			<div class="col-md-2">
					<img class="eva_icon" src="/images/icon/subway.svg"> 
			</div>
			<div class="col-md-4">
		`
		for(subway of subwayList){
			tempHtml += `<div class="trapic_text">${subway.subwayLine} ${subway.subwayName}</div>`
		}
		tempHtml +=
		`
			</div>
			<div class="col-md-2"></div>
		`
		$("#trapicList").append(tempHtml);
	}
	
	
	// name="markerBuildYear" 년도 뒤에 옵션들 붙이기
	function yearOptions() {
		let date = new Date();
		let year = date.getFullYear();
		let optionHtml = "";
		for(let i = 0; i <= 100; i++){
			optionHtml += `<option value="${year - i}">${year - i}</option>`
		}
		$("select[name='markerBuildYear']").append(optionHtml);
	}
	
	// input 별점 script
	const drawStar = (target) => {
		document.querySelector(`.eva_star span`).style.width = `${target.value * 20}%`;
	}
	
	// 별점 변화시 옆에 이모티콘 나타내기
	function change_rate() {
		$("input[type='range']").change(function() {
			// $('.emote') 초기화 후
			$('.emote').empty();
			// 별점에 따라 이모티콘
			let rating = parseInt($(".eva_star > span").css("width").replace("px",""));
			// console.log("rating : ", rating);
			// 콘솔 확인
			// console.log("drawStar : ", drawStar);
			if(rating >= 0 && rating <= 40){
				$('.emote').append(`<div class="print_emote">😞</div>`)
			}else if(rating >= 40 && rating <= 80){
				$('.emote').append(`<div class="print_emote">🙂</div>`)
			}else if(rating >= 80 && rating <= 120){
				$('.emote').append(`<div class="print_emote">😊</div>`)
			}else if(rating >= 120 && rating <= 160){
				$('.emote').append(`<div class="print_emote">🤗</div>`)
			}else if(rating >= 160 && rating <= 200){
				$('.emote').append(`<div class="print_emote">🤩</div>`)
			}
		});
	}
	
	// 검색 관련 함수들!!!!!!!
	// ajax로 도시 리스트 가져오기
	function fn_getCityList() {
		$.ajax({
			url : getContextPath() + "/cityList"
			,type : "post"
			,success : function(data) {
				// console.log(data);
				cityList = data;
			}
			,error : function(request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		        alert("서버와의 통신 오류가 발생했습니다. 전산실에 문의해주세요 010-4403-9382");
			}
			,complete : function() {
				// 검색입력 혹은 클릭시
				fn_keyupAddr();
			}
		});
	}
	
	// input에 키 업시
	function fn_keyupAddr() {
		$("#addr_search").keyup(function() {
			// alert("dd");
			let searchValue = $("#addr_search").val();
			// searchValue가 빈값이 아니면
			if(searchValue != null && searchValue != ""){
				fn_insertCityList(searchValue);
			}else{
				$("#addr_list").css("border", "none");
				$("#addr_list").empty();
			}
		});
	}
	
	// datalist에 도시 리스트 넣기
	function fn_insertCityList(searchValue) {
		// 도시 리스트 비우고
		$("#addr_list").empty();
		// border css 주고
		$("#addr_list").css("border", "rgba(20,20,20, 0.5) solid 1px");
		$("#addr_list").css("border-top", "none");
		// 도시 리스트 추가
		let searchCityList = [];
		let cityListHtml = "";
		for(city of cityList){
			if(city["cityName"].indexOf(searchValue) != -1){
				cityListHtml +=
					`
					<div class="search_city_list">
						<div class="search_city_result" data-cityLat="${city["cityLat"]}" data-cityLongt="${city["cityLongt"]}" 
						value="${city["cityName"]}">${city["doName"]} ${city["cityName"]}</div>
						<div class="search_city_bar"></div>
					</div>
					`
			}
		}
		$("#addr_list").append(cityListHtml);
		// 도시 리스트 클릭 이벤트
		fn_cityListClick();
		// 돋보기에 클릭 이벤트
		search_btn_click()
	}
	
	// datalist에 클릭이벤트 주기
	function fn_cityListClick() {
		// console.log("클릭 이벤트 줄 것: ", $("#addr_list").children());
		$("#addr_list").children().click(function() {
			// 위도 경도 얻고
			let cityLat = $(this).find(".search_city_result").attr("data-cityLat");
			let cityLongt = $(this).find(".search_city_result").attr("data-cityLongt");
			let cityText = $(this).find(".search_city_result").text();
			// console.log(cityLat);
			// console.log(cityLongt);
			// 돋보기 버튼에 위도 경도 넣기
			$("#addr_search_btn").attr("data-cityLat", cityLat);
			$("#addr_search_btn").attr("data-cityLongt", cityLongt);
			// input에 텍스트 집어넣기
			$("#addr_search").val(cityText);
			// 리스트 remove해주기
			$(".search_city_list").remove();
			// list border 지우기
			$("#addr_list").css("border", "none");
		});
	}
	
	// map 확대, 축소 5레벨로 주기~
	function mapLv5(map) {
	    // 현재 지도의 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
	    map.setLevel(5);
	}
	
	// 돋보기 버튼 클릭
	function search_btn_click() {
		$("#addr_search_btn").click(function() {
			let nowCityLat = $("#addr_search_btn").attr("data-cityLat");
			let nowCityLongt = $("#addr_search_btn").attr("data-cityLongt");
			// console.log("nowCityLat : ", nowCityLat);
			if(nowCityLat == null || nowCityLat == ""){
				// 주소 리스트의 첫번째 친구 가져오기
				nowCityLat = $("#addr_list").children().first().find(".search_city_result").attr("data-cityLat");
				// console.log("nowCityLat2 : ", nowCityLat);
				nowCityLongt = $("#addr_list").children().first().find(".search_city_result").attr("data-cityLongt");
			}
			// 5레벨로 이동
			mapLv5(map);
			// 도시 쪽으로 중심 이동
			setCenter(map, nowCityLat, nowCityLongt);
			// 돋보기 위도 경도 비우기
			timeOutEmpty();
			// list border 지우기
			$("#addr_list").css("border", "none");
		});
	}
	
	// 0.5초 뒤에 위도, 경도 비워주기
	function timeOutEmpty() {
		setTimeout(() => {
			// 위도 경도 비워주기
			$("#addr_search_btn").attr("data-cityLat", "");
			$("#addr_search_btn").attr("data-cityLongt", "");
			// 리스트 remove해주기
			$(".search_city_list").empty();
		}, 100);
	}

	
	// 검색 쪽 함수 구현!!!!!
	// 검색 버튼에 값 넣었을 시 이벤트 
	function search_value_btn() {
		$(".search_select").change(function() {
			// alert($(this));
			// 선택된 값 가져오기
			let bnt_val = $(this).find('option:selected').val();
			// 상관없음 선택시 css를 위한 class 제거
			if(bnt_val == ""){
				$(this).removeClass("value_input");
				$(this).val("base").prop("selected", true);
			}else{		// 변수 선택시 css를 위한 class 추가
				$(this).addClass("value_input");
			}
			// this의 id 뽑아내고
			let tempId = $(this).attr("id");
			// console.log("this의 아이디 : " , tempId);
			// 전역변수에 검색 값 집어넣기
			fn_insert_search(tempId, bnt_val);
			// ajax 통신
			fn_getAreaData(swLatlng, neLatlng, searchJSON);
			// 마커 감추기
			hideMarkers();
			// 마커 찍기
			setMarker(0, 0);
		});
	}
	
	// 전역 JSON에 검색 결과 집어넣기
	function fn_insert_search(tempId, bnt_val) {
		if(tempId == "search_con"){
			searchJSON["searchCon"] = bnt_val;
		}else if(tempId == "search_score"){
			searchJSON["searchScore"] = bnt_val;
		}
	}
	
	// search_width 버튼 클릭시
	$("#search_width").click(function(){
		fn_insert_css_class();
	});
	
	// range에서 확인 버튼 클릭시
	$("#width_confirm").click(function(){
		fn_insert_css_class();
	});
	
	// range에서 초기화 버튼 클릭
	$("#width_reset").click(function(){
		// 최솟값, 최댓값 초기화
		$("#input-left").val(0);
		$("#input-right").val(100);
		// 화면에 뿌려주고
		$(".printLowWidth").text("최소");
		$(".printMaxWidth").text("최대");
		// 슬라이드 바 초기화
		$(".range").css("left", "0%");
		$(".range").css("right", "0%");
		$(".thumb.left").css("left", "0%");
		$(".thumb.right").css("right", "0%");
		
		// 전역에 뿌린 searchJSON도 초기화!
		searchJSON.widthMin = 0;
		searchJSON.widthMax = 100;

		// ajax 통신
		fn_getAreaData(swLatlng, neLatlng, searchJSON);
		// 마커 감추기
		hideMarkers();
		// 마커 찍기
		setMarker(0, 0);
	});
	
	// range에서 버튼 클릭시 이벤트~ ,, css주는 버튼 함수
	function fn_insert_css_class() {
		// css를 줄 타겟
		let target = $("#search_width");
		let tempDis = $(".eva_range_box").css("display");
		// display 조건
		if(tempDis == "block"){
			$(".eva_range_box").css("display", "none");
			// 버튼에 css class 제거
			target.removeClass("value_input");
			// 값 들어가있으면 css 주기
			fn_mabyRangeVal(target);
		}else{
			$(".eva_range_box").css("display", "block");
			// 버튼에 css class 추가
			target.addClass("value_input");
		}
	}
	
	/*
	 * 검색 부분의 양방향 슬라이드!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 * 원리가 input range 두 개 생성하고 양 쪽이 안 겹치게 설정하고 div를 변화시키면 된다 마지막에 input
	 * range 두 개, div 겹쳐주기
	 */
	
	// 일단 슬라이드들 값들 넣어놓기
	const inputLeft = document.getElementById("input-left");
	const inputRight = document.getElementById("input-right");
	
	const thumbLeft = document.querySelector(".thumb.left");
	const thumbRight = document.querySelector(".thumb.right");
	
	const range = document.querySelector(".range");

	// 왼쪽 버튼을 위한 함수 정의
	const setLeftValue = e => {
	    // 타겟을 _this 변수에 담기
	    const _this = e.target;
	    // 타겟의 속성 뽑아내기
	    const { value, min, max } = _this;
	
	    // 왼쪽 버튼 오른쪽 버튼 겹치지 않게 하기
	    if (+inputRight.value - +value < 10) {
	        _this.value = +inputRight.value - 10;
	    }
	
	    // 왼쪽 범위를 위한 퍼센테이지 구하기
	    const percent = ((+_this.value - +min) / (+max - +min)) * 100;
	
	    thumbLeft.style.left = `${percent}%`;
	    range.style.left = `${percent}%`;
	};
	
	// 오른쪽 버튼을 위한 함수 정의
	const setRightValue = e => {
	    const _this = e.target;
	    const { value, min, max } = _this;
	
	    if (+value - +inputLeft.value < 10) {
	        _this.value = +inputLeft.value + 10;
	    }
	
	    const percent = ((+_this.value - +min) / (+max - +min)) * 100;
	
	    thumbRight.style.right = `${100 - percent}%`;
	    range.style.right = `${100 - percent}%`;
	};
	
	// 정의한 함수 이벤트로 추가
	if (inputLeft && inputRight) {
	    inputLeft.addEventListener("input", setLeftValue);
	    inputRight.addEventListener("input", setRightValue);
	}
	
	
	// 화면 로딩 후
	// console.log($("#input-left").val());
	function fn_width_range_change() {
		
		// input값 변경 이벤트
	    $(".input-range").change(function(){
	        // alert("체인지");
	        // console.log($("#input-left").val());
	        // console.log($("#input-right").val());
	        
	        // 왼쪽 버튼 = 최소, 오른쪽 버튼 = 최대값 (0~50이 필요해서 /2함)
	        let lowWidth = $("#input-left").val() * 0.5;
	        let maxWidth = $("#input-right").val() * 0.5;
	
	        // console.log(lowWidth);
	        // console.log(maxWidth)
	        
	        // 전역 변수 searchJSON에 값 넣어주기
	        searchJSON.widthMin = lowWidth;
	        searchJSON.widthMax = maxWidth;
	        
	        // (평) 넣어주기
	        lowWidth += "<span>(평)</span>";
	        maxWidth += "<span>(평)</span>";
	
	        // 가장 작고 클 때 최소, 최대 출력
	        if(lowWidth == 0.5){
	            lowWidth = "최소<span>(평)</span>";
	              // 기본값으로
	            searchJSON.widthMin = 0;
	        };
	        if(maxWidth == 50){
	            maxWidth = "최대<span>(평)</span>";
	              // 기본값으로
	            searchJSON.widthMax = 100;
	        };
	
	        // 화면에 값 뿌려주기
	        $(".printLowWidth").html(lowWidth);
	        $(".printMaxWidth").html(maxWidth);
	
			// ajax 통신
			fn_getAreaData(swLatlng, neLatlng, searchJSON);
			// 마커 감추기
			hideMarkers();
			// 마커 찍기
			setMarker(0, 0);
	    });
	}
	    
	// 면적 range에 값이 있다면 input_value 클래스 추가, 없다면 삭제
	function fn_mabyRangeVal(target) {
		if(searchJSON.widthMin == 0 && searchJSON.widthMax == 100){
			target.removeClass("value_input");
		}else{
			target.addClass("value_input");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
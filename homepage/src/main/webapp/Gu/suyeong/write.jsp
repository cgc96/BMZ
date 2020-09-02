<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import = "org.justking.homepage.member.db.MemberDTO" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
   $(function(){
      $("#listbtn").click(function(){
         location.href='../suyeong/suyeong';
      })
   })
</script>

 <jsp:include page = "../../header.jsp" /> 
 
 <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
    <style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
 
</head>

<script>
	$(function(){
		$("#writeForm").submit(function(){
			if($("#title").val().length == 0){
				alert("제목을 입력해주세요");
				$("#title").val("").focus();
				return false;
			}
		});
	})
</script>

 <div class="col-lg-12">
      <form role="form" id ="writeForm" method="post" action ="../suyeong/write">
         <div class="box box-primary">
            <div class="box-header with-border">
               <h3 class="box-title"> 게시글작성</h3>
            </div>
            <div class="box-body">
               <div class="form-group">
                  <label for="title"> 제목</label>
                  <input class="form-control" id = "title" name="title" placeholder="제목을 입력하세요..">
               </div>
               <div class="map_wrap">
                <div id="mapp" style="width:50%;height:100%;position:relative;overflow:hidden;"></div>
                <div class="hAddr">
                    <span class="title">지도중심기준 행정동 주소정보</span>
                    <span id="centerAddr"></span>
                </div>
            </div>
            
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ff585150b05b1bca64a36410ece9e8e&libraries=services"></script>
            <script>
            var mapContainer = document.getElementById('mapp'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(35.151632, 129.111407), // 지도의 중심좌표

                    level: 3 // 지도의 확대 레벨
                };  
            
            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 
            
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            
            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
            
            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            
            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                        document.getElementById('map').value = result[0].address.address_name;
                        var content = '<div class="bAddr">' +
                                        '<span class="title">법정동 주소정보</span>' + 
                                        detailAddr + 
                                    '</div>';
                                    
                        // 마커를 클릭한 위치에 표시합니다 
                        marker.setPosition(mouseEvent.latLng);
                        marker.setMap(map);
            
                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    }   
                });
            });
            
            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'idle', function() {
                searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            });
            
            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
            }
            
            function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }
            
            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var infoDiv = document.getElementById('centerAddr');
            
                    for(var i = 0; i < result.length; i++) {
                        // 행정동의 region_type 값은 'H' 이므로
                        if (result[i].region_type === 'H') {
                            infoDiv.innerHTML = result[i].address_name;
                            break;
                        }
                    }
                }    
            }
            </script>
               
               <div class="form-group">
                   <label for="content">내용</label>
                   <textarea class="form-control" name="content" id="content" placeholder="내용 입력.." rows="30"
                          style="resize: none;"></textarea>
                          
                          
                    <input type="hidden" id="map" name="map" >
               </div>
               <div class="form-group">
                   <label for="writer">작성자</label>
                   <%
                   HttpSession session = request.getSession(false);
                   MemberDTO member = (MemberDTO)session.getAttribute("member"); 
                   %>
                   <input class="form-control" name="writer" id="writer" readonly value = <%= member.getId() %> >
               </div>
            </div>
               
            <div class="box-footer">
               <button type="button" class="btn btn-primary" id="listbtn"><i class="fa fa-list"></i> 목록</button>
               <div class="pull-right">
                 <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                  <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 작성</button>
            
               </div>
           </div>
         </div>
      </form>
</div>

</body>

</html>
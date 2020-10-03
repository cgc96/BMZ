<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import = "org.justking.homepage.member.db.MemberDTO" %>
<%@ page import = "org.justking.homepage.board.db.BoardDTO" %>
<%@ page import = "org.springframework.ui.Model" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>부산 맛집</title>

<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <jsp:include page = "../../header.jsp" /> 
 
<style>
ul{
	list-style:none;
}
li{
	float: left;
	margin-right: 50px;
}
</style>
</head>

<body>


<form role="form" method="post">

<input type="hidden" name="articleNo" value="${board.articleNo}">
<input type="hidden" name="page" value="${criteria.page }">
<input type="hidden" name="perPageNum" value="${criteria.perPageNum }">
<input type="hidden" id = "mapp" name="map" value="${board.map}">

</form>

<div class="card"style="width:70%; margin:auto">

  <h3 class="card-header">${board.title}
  <%
    HttpSession session = request.getSession(false);

 	if(session != null && session.getAttribute("member") != null){
       MemberDTO member = (MemberDTO)session.getAttribute("member");
       BoardDTO board = (BoardDTO)request.getAttribute("board");
           		
       if(member.getId().equals(board.getWriter())){%>
		   <div style = "float:right;">
		        <button type="submit" class="btn btn-warning modBtn" ><i class="fa fa-edit"></i> 수정</button>
		        <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
		   </div>
		   <p style="clear:both;"> </p>
		<%}
 	}%>
 	</h3>
  <p></p>
  

  <div id="map" style="height:300px;"></div>
	<p></p><p></p><p></p>
  <div class="card-body">
    <p class="card-text">${board.content} </p>
  </div>
  <p></p><p></p><p></p>
  <%--업로드 파일 정보 영역--%>
  <div class="box-footer uploadFiles">
      <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
  </div>
  <p></p><p></p><p></p>
  <div style = "float:right;">
  &nbsp;&nbsp;
  작성자 : ${board.writer} &nbsp; | &nbsp;
  작성일 : <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${board.regDate}"/></span>  &nbsp; | &nbsp;
  조회수 : ${board.viewCnt}
  </div>
	<p style="clear:both;"></p>

	<div style = "margin : auto;">
	
	    <button type ="submit"  class="btn btn-primary btnRecommend"> 좋아요! </button>
	    <button type ="submit"  class="btn btn-primary btnNonRecommend"> 싫어요! </button>
	</div>
	<div style = "margin : auto;">
    좋아요 : ${board.likes}  &nbsp;
 	싫어요 : ${board.dislikes} 
    </div>
  	<br/><br/>
  	
  	
 	<div class="repliesDiv"></div>
 	
 	<% 
		
		if(session != null && session.getAttribute("member") != null){
			MemberDTO member = (MemberDTO)session.getAttribute("member"); 
			if(member != null){%>
				<div class ="box box-warning" >
				<div class ="box-body" >
					<form class="form-horizontal">
						<div class ="form-group margin">
							<div class="col-sm-10">
								<textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글을 입력하세요" style="resize: none"></textarea>
							</div>
							<div class="col-sm-2">
								<input class="form-control" id = "newReplyWriter" readonly value = "<%= member.getNickName() %>">
							</div>
							<hr/>
							<div class="col-sm-2">
								<button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 작성</button>					
							</div>
						</div>
					</form>	
				</div>
				
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination pagination-sm no-margin">
						
						</ul>
					</div>
				</div>
			 </div>
			<%}
		}
		else{%>
		
			<div class="form-group">
			  <fieldset disabled="">
			    <input class="form-control" id="disabledInput" type="text" placeholder="댓글사용은 로그인 후 이용 가능합니다." disabled="">
			  </fieldset>
			</div>
		<% }%>
		
 	
 </div>

		
		<!--
		<button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록 </button>
        -->
        
         
 			


<!-- 
<div class="box box-success collapsed-box">

	<%-- 댓글 목록 --%>
	

	<%-- 댓글 유무 / 댓글 개수 / 댓글 펼치기, 접기 
	<div class="box-header with-border">
		<a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
		<div class="box-tools">
			<button type="button" class="btn btn-box-tool" data-widget="collapse">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	--%>
	
	
	
</div>
-->




 
 <%--댓글 삭제 modal 영역 --%>
<div class="modal" id="delModal">
   <div class ="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class ="modal-title">댓글 삭제</h4>
            <input type="hidden" class="replyNo"/>
            
         </div>
         <div class="modal-body" data-replyNo>
            <input type="hidden" class="replyNo"/>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니오.</button>
            <button type="button" class="btn btn-primary modalDelBtn">네. 삭제합니다.</button>
            
         </div>
      </div>
   </div>

</div>

<script id="fileTemplate" type="text/x-handlebars-template">
    <li data-src="{{fullName}}">
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
        </div>
    </li>
</script>
<%--게시글 첨부파일 파일 템플릿--%>
<script type="text/javascript" src="../../resources/dist/js/article_file_upload.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ff585150b05b1bca64a36410ece9e8e&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(document.getElementById("mapp").value, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${board.map}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>

<%--댓글 하나의 영역--%>
<script id="replyTemplate" type="text/x-handlebars-template">
	
    {{#each.}}
	<hr>
    <div class="post replyDiv"data-replyNo={{replyNo}}>
		 
		<h5>{{replyWriter}} &nbsp; <small class="text-muted">{{regDate}}</small>
			<a class="replyDelBtn" href="#" data-toggle="modal" data-target="#delModal">
           		<small class="fa fa-times"> 삭제 </small>
        	</a>
		</h5>
		<div class="oldReplytext">{{{escape replyText}}}</div>
		<p></p>
	</div>
    {{/each}}
</script>

<script>
    $(document).ready(function () {
       
       
        // 전역변수 선언
        var articleNo = ${board.articleNo}; // 현재 게시글 번호
        
        /*======================================== 댓글 CRUD 관련 ========================================*/
        // ---------------------------------------- 댓글 목록, 페이징 ----------------------------------------
        // 전역변수 선언
        // 댓글 페이지 번호 초기화
        var replyPageNum = 1;
        // 댓글 내용 : 줄바꿈 / 공백 처리를 위한 문자열 처리
        Handlebars.registerHelper("escape", function (replyText) {
            var text = Handlebars.Utils.escapeExpression(replyText);
            text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
            text = text.replace(/( )/gm, "&nbsp;");
            return new Handlebars.SafeString(text);
        });
        
        // 댓글 등록일자 출력을 위한 날짜/시간 문자열 처리
        Handlebars.registerHelper("prettifyDate", function (timeValue) {
            var dateObj = new Date(timeValue);
            var year = dateObj.getFullYear();
            var month = dateObj.getMonth() + 1;
            var date = dateObj.getDate();
            var hours = dateObj.getHours();
            var minutes = dateObj.getMinutes();
            // 2자리 숫자 맞추기
            month < 10 ? month = '0' + month : month;
            date < 10 ? date = '0' + date : date;
            hours < 10 ? hours = '0' + hours : hours;
            minutes < 10 ? minutes = '0' + minutes : minutes;
            return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
        });
        
        // 첨부파일 목록
        getFiles(articleNo);
        
        //댓글 목록 함수 호출
        getReplies("../../replies/" + articleNo + "/" + replyPageNum);
        
        // 댓글 목록 함수
        function getReplies(repliesUri) {
            // 댓글 목록 가져오기
            $.getJSON(repliesUri, function (data) {

               // 1. 댓글 갯수 출력 함수 호출
                printReplyCount(data.pageMaker.totalCount);
               
                // 2. 댓글 목록 출력 함수 호출
                printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
                // 3. 댓글 하단 페이징 출력 함수 호출
                printReplyPaging(data.pageMaker, $(".pagination"));
                

            });
        };
        
        // 1. 댓글 갯수 출력 / 댓글 유무에 따라 댓글 보기 버튼 활성/비활성
        function printReplyCount(totalCount) {

           var replyCount = $(".replyCount");
           var collapsedBox = $(".collapsed-box");
           
           //댓글이 없으면
           if (totalCount == 0) {
                replyCount.html(" 댓글이 없습니다. 의견을 남겨주세요.");
                collapsedBox.find(".btn-box-tool").remove();
               return;
           }
           
           //댓글이 존재하면
           replyCount.html(" 댓글목록 (" + totalCount + ")");
            collapsedBox.find(".box-tools").html(
               "<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
                + "<i class='fa fa-plus'></i>"
                + "</button>");
        };

        
        // 2. 댓글 목록 출력 함수
        function printReplies(replyArr, targetArea, templateObj) {
            var replyTemplate = Handlebars.compile(templateObj.html());
            var html = replyTemplate(replyArr);
            $(".replyDiv").remove();
            targetArea.html(html);
        };
        
        // 3. 댓글 페이징 출력 함수
        function printReplyPaging(pageMaker, targetArea) {
            var str = "";
            if (pageMaker.prev) {
                str += "<li><a href='" + (pageMaker.startPage - 1) + "'>이전</a></li>";
            }
            for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
                var strClass = pageMaker.criteria.page == i ? "class=active" : "";
                str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
            }
            if (pageMaker.next) {
                str += "<li><a href='" + (pageMaker.endPage + 1) + "'>다음</a></li>"
            }
            targetArea.html(str);
        };

        // 댓글 페이지 번호 클릭 이벤트
        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPageNum = $(this).attr("href");
            getReplies("../../replies/" + articleNo + "/" + replyPageNum);

        });
        // ---------------------------------------- 댓글 입력 ----------------------------------------
        // 댓글 저장 버튼 클릭 이벤트
        $(".replyAddBtn").on("click", function () {
            // 입력 form 선택자
            var replyWriterObj = $("#newReplyWriter");
            var replyTextObj = $("#newReplyText");
            var replyWriter = replyWriterObj.val();
            var replyText = replyTextObj.val();

            // 댓글 입력처리 수행
            $.ajax({
                type: 'POST',
                url: "../../replies",
                headers: {
                    "Content-Type" : "application/json",
                    "X-HTTP-Method-Override" : "POST"
                },
                dataType: "text",
                data: JSON.stringify({
                    articleNo:articleNo,
                    replyWriter:replyWriter,
                    replyText:replyText
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "regSuccess") {
                        alert("댓글이 등록되었습니다.");
                        replyPageNum = 1;  // 페이지 1로 초기화
                        getReplies("../../replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                        replyTextObj.val("");     // 작성자 입력창 공백처리
                        //replyWriterObj.val("");   // 댓글 입력창 공백처리
                    }
                }
            });
        });
        $(".repliesDiv").on("click", ".replyDiv", function (event) {
            var reply = $(this);
            $(".replyNo").val(reply.attr("data-replyNo"));
            $("#replytext").val(reply.find(".oldReplytext").text());
        });
        // ---------------------------------------- 댓글 삭제 ----------------------------------------
        $(".modalDelBtn").on("click", function () {
         var replyNo =  $(".replyNo").val();
            $.ajax({
                type: "delete",
                url: "../../replies/" + replyNo,
                headers: {
                    "Content-Type" : "application/json",
                    "X-HTTP-Method-Override" : "DELETE"
                },
                dataType: "text",
                
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "delSuccess") {
                        alert("댓글이 삭제되었습니다.");
                        getReplies("../../replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                       $("#delModal").modal("hide");
                    }
                }
            });
        });
       


        /*======================================== 게시글 페이지 이동 관련 ========================================*/		
		// form 선택자
        var formObj = $("form[role='form']");
        console.log(formObj);
        
        // 수정버튼 클릭시
        $(".modBtn").on("click", function () {
            formObj.attr("action", "../busanjin/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
        
        // 삭제 버튼 클릭시
        $(".delBtn").on("click", function () {
        	var arr = [];
        	$(".uploadedFileList li").each(function(){
        		arr.push($(this).attr("data-src"));
        	});
        	
        	if(arr.length > 0) {
        		$.post("../../article/file/deleteAll",{files:arr}, function(){
        			
        		});
        	}
            formObj.attr("action", "../busanjin/remove");
            formObj.submit();
        });
        
        // 목록 버튼 클릭시
        $(".listBtn").on("click", function () {
        	formObj.attr("action", "../busanjin/busanjin")
        	formObj.attr("method", "get");

			formObj.submit();            
        });

        $(".btnRecommend").on("click",function(){
        	formObj.attr("action","../busanjin/recommend")
	       	formObj.attr("method", "get");

        	alert("해당 게시물을 추천하였습니다.");
        	
			formObj.submit();            

        });
        $(".btnNonRecommend").on("click",function(){
        	formObj.attr("action","../busanjin/nonrecommend")
	       	formObj.attr("method", "get");

        	alert("해당 게시물을 비추천하였습니다.");
        	
			formObj.submit();            

        });
                
        // 수정 완료시 알림
        var result = "${msg}";
        if (result == "modSucccess") {
            alert("게시글이 수정되었습니다.");
        }

    })
   
</script>
</body>


</html>
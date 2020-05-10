<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>부산 맛집</title>

<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

 <jsp:include page = "../../header.jsp" /> 
</head>

<body>


<div class="jumbotron">
  <h1 class="display-3">namgu 지도자리</h1>
  <p class="lead">준희 화이팅 </p>
</div>

<div class="col-lg-12">
  <div class="box box-primary">
       <div class="box-header with-border">
          <h3 class="box-title">글제목 : ${board.title}</h3>
       </div>
         <div class="box-body" style="height:700px">
             ${board.content} 
       </div>
       <div class="box-footer">
       		<div class="user-block">
                <span class="username">
                    
                    <a href="#">${ member.id }</a>
                </span>
                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${board.regDate}"/></span>
            </div>
       </div>
       
       
       <div class="box-footer">
       	<form role="form" method="post">
       		<input type="hidden" name="articleNo" value="${board.articleNo}">
       		<input type="hidden" name="page" value="${criteria.page }">
       		<input type="hidden" name="perPageNum" value="${criteria.perPageNum }">
       		
		</form>
		
		<button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
       	<c:if test="${member.id == board.writer}">
	       	<div class="pull-right">
	        	<button type="submit" class="btn btn-warning modBtn" ><i class="fa fa-edit"></i> 수정</button>
	        	<button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
	        </div>
	    </c:if>
	    <button type ="submit"  class="btn btn-primary btnRecommend"> 좋아요! </button>
	    <button type ="submit"  class="btn btn-primary btnNonRecommend"> 싫어요! </button>
	    
       </div>
       	
  </div>
  
</div>
<div class ="box box-warning">
 	<div class="box-header with-border">
		<a class="link-black text-lg"><i class="fa fa-pencil"></i>   댓글작성</a>
    </div>
	<div class ="box-body">
		<form class="form-horizontal">
			<div class ="form-group margin">
				<div class="col-sm-10">
					<textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글내용..." style="resize: none"></textarea>
				</div>
				<div class="col-sm-2">
					<input class="form-control" id="newReplyWriter" type="text" placeholder="댓글작성자...">
				</div>
				<hr/>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 작성</button>					
				</div>
			</div>
		</form>	
	</div>
 </div>
 
<div class="box box-success collapsed-box">
	<%-- 댓글 유무 / 댓글 개수 / 댓글 펼치기, 접기 --%>
	<div class="box-header with-border">
		<a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
		<div class="box-tools">
			<button type="button" class="btn btn-box-tool" data-widget="collapse">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	
	<%-- 댓글 목록 --%>
	<div class="box-body repliesDiv">
	
	</div>
	
	<%-- 댓글 페이징 --%>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination pagination-sm no-margin">
			
			</ul>
		</div>
	</div>
</div>
<%--댓글 하나의 영역--%>
<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{replyNo}}>
        <div class="user-block">
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{replyWriter}}</a>
                <%--댓글 삭제 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-times"> 삭제</i>
                </a>
                <%--댓글 수정 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
            </span>
            <%--댓글 작성일자--%>
            <span class="description">{{prettifyDate regDate}}</span>
        </div>
        <%--댓글 내용--%>
        <div class="oldReplytext">{{{escape replyText}}}</div>
        <br/>
        <%--댓글 추천 버튼--%>
        <ul class="list-inline">
            <li>
                <a href="#" class="link-black text-sm">
                    <i class="fa fa-thumbs-o-up margin-r-5"></i> 댓글 추천(0)
                </a>
            </li>
        </ul>
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
        
        //댓글 목록 함수 호출
        getReplies("../replies/" + articleNo + "/" + replyPageNum);
        
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
            getReplies("../replies/" + articleNo + "/" + replyPageNum);

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
                url: "../replies",
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
                        getReplies("../replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                        replyTextObj.val("");     // 작성자 입력창 공백처리
                        replyWriterObj.val("");   // 댓글 입력창 공백처리
                    }
                }
            });
        });
        // ---------------------------------------- 댓글 수정 ----------------------------------------
        // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
        $(".repliesDiv").on("click", ".replyDiv", function (event) {
            var reply = $(this);
            console.log(reply);
            $(".replyNo").val(reply.attr("data-replyNo"));
            $("#replyText").val(reply.find(".oldReplyText").text());
        });
 
        // modal 창의 댓글 수정버튼 클릭 이벤트
        $(".modalModBtn").on("click", function () {
            var replyNo = $(".replyNo").val();
            var replytext = $("#replyText").val();
            $.ajax({
                type: "put",
                url: "../replies/" + replyNo,
                headers: {
                    "Content-Type" : "application/json",
                    "X-HTTP-Method-Override" : "PUT"
                },
                dataType: "text",
                data: JSON.stringify({
                    replyText:replyText
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "modSuccess") {
                        alert("댓글이 수정되었습니다.");
                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                        $("#modModal").modal("hide"); // modal 창 닫기
                    }
                }
            })
        });
        // ---------------------------------------- 댓글 삭제 ----------------------------------------
        $(".modalDelBtn").on("click", function () {
            var replyNo = $(".replyNo").val();
            $.ajax({
                type: "delete",
                url: "../replies/" + replyNo,
                headers: {
                    "Content-Type" : "application/json",
                    "X-HTTP-Method-Override" : "DELETE"
                },
                dataType: "text",
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "delSuccess") {
                        alert("댓글이 삭제되었습니다.");
                        getPage("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                        $("#delModal").modal("hide"); // modal 창 닫기
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
            formObj.attr("action", "../namgu/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
        
        // 삭제 버튼 클릭시
        $(".delBtn").on("click", function () {
            formObj.attr("action", "../namgu/remove");
            formObj.submit();
        });
        
        // 목록 버튼 클릭시
        $(".listBtn").on("click", function () {
        	formObj.attr("action", "../namgu/namgu")
        	formObj.attr("method", "get");

			formObj.submit();            
        });

        $(".btnRecommend").on("click",function(){
        	formObj.attr("action","../namgu/recommend")
	       	formObj.attr("method", "get");

        	alert("해당 게시물을 추천하였습니다.");
        	
			formObj.submit();            

        });
        $(".btnNonRecommend").on("click",function(){
        	formObj.attr("action","../namgu/nonrecommend")
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
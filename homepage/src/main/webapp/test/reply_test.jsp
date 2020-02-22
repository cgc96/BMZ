<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
$(document).ready(function () {

$("#replyAddBtn").on("click", function () {
    // 입력 form 선택자
    var replyWriterObj = $("#newReplyWriter");
    var replyTextObj = $("#newReplyText");
    var replyWriter = replyWriterObj.val();
    var replyText = replyTextObj.val();
    
    // 댓글 입력처리 수행
    $.ajax({
        type: "post",
        url: "/replies",
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
                replyPage = 1;  // 페이지 1로 초기화
                getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
                replyTextObj.val("");     // 작성자 입력창 공백처리
                replyWriterObj.val("");   // 댓글 입력창 공백처리
            }
        }
    });
});
});
</script>

</head>
<body>
<section class="content container-fluid">
<div class="col-lg-12">
<div class ="box box-warning">
 	<div class="box-header with-border">
		<h3 class="box-title">댓글 작성</h3>
    </div>
	<div class ="box-body">
			<div class ="form-group">
				
				<label for="newReplyText">댓글 내용</label>
				<input class="form-control" id="newReplyText" name="replyText" placeholder="댓글내용..." >
			</div>
			<div class="form-group">
				<label for="newReplyWriter">댓글 작성자</label>
			
				<input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글작성자...">
			</div>		
	</div>
	<div class = "box-footer">
		<ul class = "replies">
			
		</ul>
	</div>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination pagination-sm no-margin">
			
			</ul>
		</div>
	</div>
</div>
</div>
 <div class="moal fade" id="modifyModal" role="dialog">
 	<div class="modal-dialog">
 		<div class="modal-content">
 			<div class="modal-header">
 				<button type="button" class="close" data-dismiss="modal">&times;</button>
 				<h4 class="modal-title">댓글 수정창</h4>
 			</div>
 			<div class="modal-body">
 				<div class="form-group">
 					<label for="replyNo">댓글 번호</label>
 					<input class ="form-control" id="replyNo" name="replyNo" readonly>
 				</div>
 				<div class="form-group">
 					<label for="replyText">댓글 내용</label>
 					<input class ="form-control" id="replyText" name="replyText" placeholder="댓글 내용..">
 				
 				</div>
 				<div class="form-group">
 					<label for="replyWriter">댓글 작성자</label>
 					<input class ="form-control" id="replyWriter" name="replyWriter" readonly>
 				
 				</div>
 			</div>
 			<div class="modal-footer">
 			    <button type="button" class="btn btn-default pull-left" data-dismiss="modal" >닫기</button>
        		<button type="button" class="btn btn-success modalModBtn" ><i class="fa fa-edit"></i> 수정</button>
        		<button type="button" class="btn btn-danger modalDelBtn"><i class="fa fa-trash"></i> 삭제</button>
       		</div>
 		</div>
 	</div>
 </div>
</section>

</body>
</html>
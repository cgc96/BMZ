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
    // �Է� form ������
    var replyWriterObj = $("#newReplyWriter");
    var replyTextObj = $("#newReplyText");
    var replyWriter = replyWriterObj.val();
    var replyText = replyTextObj.val();
    
    // ��� �Է�ó�� ����
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
                alert("����� ��ϵǾ����ϴ�.");
                replyPage = 1;  // ������ 1�� �ʱ�ȭ
                getReplies("/replies/" + articleNo + "/" + replyPageNum); // ��� ��� ȣ��
                replyTextObj.val("");     // �ۼ��� �Է�â ����ó��
                replyWriterObj.val("");   // ��� �Է�â ����ó��
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
		<h3 class="box-title">��� �ۼ�</h3>
    </div>
	<div class ="box-body">
			<div class ="form-group">
				
				<label for="newReplyText">��� ����</label>
				<input class="form-control" id="newReplyText" name="replyText" placeholder="��۳���..." >
			</div>
			<div class="form-group">
				<label for="newReplyWriter">��� �ۼ���</label>
			
				<input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="����ۼ���...">
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
 				<h4 class="modal-title">��� ����â</h4>
 			</div>
 			<div class="modal-body">
 				<div class="form-group">
 					<label for="replyNo">��� ��ȣ</label>
 					<input class ="form-control" id="replyNo" name="replyNo" readonly>
 				</div>
 				<div class="form-group">
 					<label for="replyText">��� ����</label>
 					<input class ="form-control" id="replyText" name="replyText" placeholder="��� ����..">
 				
 				</div>
 				<div class="form-group">
 					<label for="replyWriter">��� �ۼ���</label>
 					<input class ="form-control" id="replyWriter" name="replyWriter" readonly>
 				
 				</div>
 			</div>
 			<div class="modal-footer">
 			    <button type="button" class="btn btn-default pull-left" data-dismiss="modal" >�ݱ�</button>
        		<button type="button" class="btn btn-success modalModBtn" ><i class="fa fa-edit"></i> ����</button>
        		<button type="button" class="btn btn-danger modalDelBtn"><i class="fa fa-trash"></i> ����</button>
       		</div>
 		</div>
 	</div>
 </div>
</section>

</body>
</html>
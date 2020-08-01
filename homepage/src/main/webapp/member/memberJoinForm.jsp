<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(function(){
		$("#joinForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			else{
				$(".joinBtn").on("click", function () {
					alert("회원가입에 성공했습니다.");
			    });s
			}
		});
		
		$("#id").keyup(function() {
			$.ajax({
				url : "../member/check_id.do",
				type : "POST",
				data : {
					id : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		$("#nickname").keyup(function() {
			$.ajax({
				url : "../member/check_nickname.do",
				type : "POST",
				data : {
					nickname : $("#nickName").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#nickname_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#nickname_check").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		$("#email").keyup(function(){
			$.ajax({
				url : "./check_email.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});
	    
	})
</script>

<title>회원가입 폼</title>
</head>
<body>

	<div class="card border-secondary mb-3" style = "width : 1000px; margin: 0 auto;">
	  <div class="text-primary" style = "margin: 0 auto;"><h1>회원가입</h1></div>
	  <div class="card-body" style = "margin: 0 auto;">
		
		<form id="joinForm" action="./join_member" method="post">
		  <fieldset>
		  
			 <div class="form-group">
				 <label for="exampleInputPassword1">ID를 입력해주세요</label>
				<input class="form-control" type="text" id="id" name="id" required> 
				<span id="id_check" class="badge badge-primary badge-pill"></span>
			</div>
			
			
			<div class="form-group">
				<label for="exampleInputPassword1">닉네임을 입력해주세요</label> 
				<input class="form-control" type="text" id="nickName" name="nickName" required> 
				<span id="nickname_check" class="badge badge-primary badge-pill"></span>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">비밀번호를 입력해주세요</label> 
				<input class="form-control" id="pw" name="pw" type="password" required>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">비밀번호를 한번 더 입력해주세요</label> 
				<input class="form-control" id="pw2" type="password" required>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">이메일을 입력해주세요</label>
				<input type="email" id="email" name="email"class="form-control" required placeholder="이메일...">
				<span id="email_check" class="badge badge-primary badge-pill"></span>
			</div>

			<p>	
			<button type= "submit" id= "joinBtn" class="btn btn-primary btn-lg joinBtn">회원가입</button>
			<button type= "button" class="btn btn-primary btn-lg" onclick="history.go(-1)">취소</button>
			</p>

		    </fieldset>
		</form>
	</div>
	</div>
	
</body>

</html>

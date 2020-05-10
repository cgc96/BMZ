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
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
		
		if($("#wdForm").submit(function(){
			if(!confirm("정말 탈퇴할까요?")){
				return false;
			}
		}));
	})
</script>
<title>마이페이지</title>
</head>
<body>

	<div class="card border-secondary mb-3" style = "width : 1000px; margin: 0 auto;">
  	<div class="text-primary" style = "margin: 0 auto;"><h1>마이페이지</h1></div>
  	<div class="card-body" style = "margin: 0 auto;">
  
  
	<form id="myForm" action="../member/update_mypage.do" method="post">
		<p>
			<label>ID</label> 
			<input class="form-control" type="text" id="id" name="id" value="${ member.id }" style="width:450px;"> 
		</p>
		<p>
			<label>Email</label> 
			<input class="form-control"  type="text" id="email" name="email" value="${ member.email }" required> 
		</p>
		<p>
			<button type="submit" class="btn btn-primary btn-lg">회원정보 변경</button>
		</p>
	</form>
	<br />
	<form id="pwForm" action="../member/update_pw.do" method="post">	
		<input type="hidden" name="id" value="${ member.id }">
			<p>
				<label>기존 비밀번호</label>
				<input class="form-control" id="old_pw" name="old_pw" type="password" required>
			</p>
			<p>
				<label>신규 비밀번호</label> 
				<input class="form-control" id="pw" name="pw" type="password" required>
			</p>
			<p>
				<label>신규 비밀번호 확인</label>
				<input class="form-control" type="password" id="pw2" type="password" required>
			</p>
			<p>
				<button type="submit" id="joinBtn" class="btn btn-primary btn-lg">비밀번호 변경</button>
			</p>
	</form>
	<br />
	<form id="wdForm" action="../member/withrawal.do" method="post">	
		<input type="hidden" name="id" value="${ member.id }">
			<p>
				<label>비밀번호</label>
				<input class="form-control" id="password" name="pw" required>
					</p>
					<p>
						<button type="submit" id="withdrawalBtn" class="btn btn-primary btn-lg">회원탈퇴</button>
					</p>
				</form>
				<button type="button" onclick="history.go(-1)" class="btn btn-primary btn-lg">뒤로가기</button>

	
	</div>
	</div>
	
</body>
</html>
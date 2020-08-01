<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(function(){
		$("#find_id_btn").click(function(){
			location.href='./find_id_form.do';
		});
	})
	$(function(){
		$("#find_pw_btn").click(function(){
			location.href='./find_pw_form.do';
		});
	})
</script>
<title>Login Form</title>
</head>
<body>


<div class="card border-secondary mb-3" style = "width : 1000px; margin: 0 auto;">
  <div class="text-primary" style = "margin: 0 auto;"><h1>로그인</h1></div>
  <div class="card-body" style = "margin: 0 auto;">
	
<form action="./login.do" method="post">
  <fieldset>
  
	 <div class="form-group">
      <label for="exampleInputPassword1">ID</label>
		<span class="badge badge-primary badge-pill" title="아이디 찾기" id="find_id_btn">!</span>
      <input type="text" class="form-control" id="id" name="id" required>
    </div>
	
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
		<span class="badge badge-primary badge-pill" title="비밀번호 찾기" id="find_pw_btn">!</span>
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password" required>
    </div>
	
	<p>
	<button type= "submit" class="btn btn-primary btn-lg">Log in</button>
	<button type= "button" class="btn btn-primary btn-lg" onclick="history.go(-1)">Cancel</button>
	</p>
    </fieldset>
</form>
</div>
</div>
</body>
</html>

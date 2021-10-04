<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>k-shin</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">掲示板ウェブサイト</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li> <a href="main">Main</a></li>
				<li><a href="board">Board</a></li>
				<li><a href="mail">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login">ログイン</a></li>
						<li><a href="join">会員登録</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="loginServlet" method="post">
					<h3 style="text-align: center;">ログイン画面</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PASSWORD"
							name="userPassword" maxlength="20" id=showPassword>
					</div>
					<div class="form-group">
						<input type="checkbox" onclick="myFunction()">Show
						Password
					</div>
					<script>
						function myFunction() {
							var x = document.getElementById("showPassword");
							if (x.type === "password") {
								x.type = "text";
							} else {
								x.type = "password";
							}
						}
					</script>
					<div class="form-group">
						<input type="submit" class="btn btn-primary form-control"
							value="ログイン">
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary form-control"
							onclick="location.href='join.jsp'" value="会員登録へ">
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
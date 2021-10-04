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
				<li><a href="main.jsp">Main</a></li>
				<li><a href="bbs.jsp">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Menu<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">ログイン</a></li>
						<li class="active"><a href="join.jsp">会員登録</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action=joinServlet method="post">
					<h3 style="text-align: center;">会員登録</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID入力"
							name="userID" maxlength="20" pattern="^([a-z0-9_]){6,20}$"
							title="英語と数字だけで6~20以内">
					</div>
					<div class="form-group">
						<input data-toggle="password" type="password" class="form-control"
							placeholder="パスワード入力" id="showPassword" name="userPassword"
							maxlength="20" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
							title="大文字と小文字をいれてください。8~20以内">
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
						<input data-toggle="password" type="password" class="form-control"
							placeholder="パスワード再入力" name="rePassword" maxlength="20">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="名前を入力"
							name="userName" maxlength="20"
							pattern="[^!@#$%^&*()_-+=[]{}~?:;`|/<>']+" title="英語と数字だけで6~20以内">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="MALE" checked>MALE
							</label>
						</div>
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="FEMAIL" checked>FEMAIL
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="メールを入力"
							name="userEmail" maxlength="30" title="メールの形式が正しくありません">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary form-control"
							value="会員登録">
					</div>
					<div class="form-group" style="text-align: center;">
						<button type="button" class="btn btn-primary"
							onclick="history.back()">戻る</button>

					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="js/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</body>
</html>
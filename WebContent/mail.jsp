<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板ウェブサイト</title>
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
				<li><a href="board">Board</a></li>
				<li class="active"><a href="mail">Contact</a></li>
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
				<form id="gform" method="POST" data-email="shinkunworld@gmail.com"
					action="https://script.google.com/macros/s/AKfycbxAuZg8rCafSo8SVUcVGtCZRiBijwiL4LjXCAEM/exec">
					<h3 style="text-align: center;">contact us</h3>
					<div class="form-group">
						<input id="tatle" class="form-control" maxlength="20" name="tatle"
							placeholder="タイトルを入力してください" />
					</div>
					<div class="form-group">
						<textarea class="form-control" id="message" name="message"
							rows="10" placeholder="内容を入力してください"></textarea>
					</div>
					<div class="form-group">
						<input class="form-control" id="email" name="email" type="email"
							placeholder="メールアドレスを入力してください" maxlength="20">
					</div>

					<button class="button-success pure-button button-xlarge">

						<i class="fa fa-paper-plane"></i>&nbsp;Send
					</button>

				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="js/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dao.boardDao"%>
<%@ page import="bean.boardBean"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>k-shin</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

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
				<li class="active"><a href="board">Board</a></li>
				<li><a href="mail">Contact</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<script>
				alert('ログイン以降、使えます。ログインしてください');
				location.href = 'login';
			</script>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">会員管理<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">ログアウト</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">番号</th>
						<th style="background-color: #eeeeee; text-align: center;">タイトル</th>
						<th style="background-color: #eeeeee; text-align: center;">作成者</th>
						<th style="background-color: #eeeeee; text-align: center;">作成日</th>
					</tr>
				</thead>
				<tbody>
					<%
					boardDao dao = new boardDao();
					ArrayList<boardBean> list = dao.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><a
							href="view?tableNumber=
						<%=list.get(i).getTableNumber()%>"><%=list.get(i).getTableNumber()%></a></td>
						<td><a
							href="view?tableNumber=<%=list.get(i).getTableNumber()%>"><%=list.get(i).getTableTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getUpdateTime().substring(0, 11) + list.get(i).getUpdateTime().substring(11, 13) + "時"
		+ list.get(i).getUpdateTime().substring(14, 16) + "分"%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
			<a href="board?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">以前へ</a>
			<%
			}
			if (dao.nextPage(pageNumber + 1)) {
			%>
			<a href="board?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">次へ</a>
			<%
			}
			%>
			<a href="write" class="btn btn-primary pull-right">作成</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
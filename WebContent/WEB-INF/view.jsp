<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dao.boardDao"%>
<%@ page import="bean.boardBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>k-shin</title>
</head>
<body>
  <%
  	String userID = null;
  	if (session.getAttribute("userID") != null) {
  		userID = (String) session.getAttribute("userID");
  	}
  	int tableNumber = 0;
  	if (request.getParameter("tableNumber") != null) {
  		tableNumber = Integer.parseInt(request.getParameter("tableNumber"));
  	}
  	if (tableNumber == 0) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('存在しません')");
  		script.println("location.href = 'board.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	}
  	boardBean bean = new boardDao().getTableNumber(tableNumber);

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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">掲示板</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">タイトル</td>
						<td colspan="2"><%= bean.getTableTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>作成者</td>
						<td colspan="2"><%= bean.getUserID() %></td>
					</tr>
					<tr>
						<td>作成日</td>
						<td colspan="2"><%= bean.getUpdateTime().substring(0, 11) + bean.getUpdateTime().substring(11, 13) + "시" + bean.getUpdateTime().substring(14, 16) + "분 " %></td>
					</tr>
					<tr>
						<td>内容</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bean.getTableContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="board" class="btn btn-primary">戻る</a>
			<%
				if (userID != null && userID.equals(bean.getUserID())) {
			%>
					<a href="update?tableNumber=<%= tableNumber %>" class="btn btn-primary">修正</a>
					<a onclick="return confirm('削除しますか?')" href="deleteServlet?tableNumber=<%= tableNumber %>" class="btn btn-primary">削除</a>
			<%
				}
			%>		
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
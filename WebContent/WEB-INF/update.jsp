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
  	
  	boardBean bean = new boardDao().getTableNumber(tableNumber);
  	if(!userID.equals(bean.getUserID())){%>
		<script>
		alert('권한이 없습니다');
		</script>	<%	
	
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
			<form action=boardServlet?tableNumber?tableNumber=<%=tableNumber %> method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">掲示板</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="タイトル " name="tableTitle" maxlength="50" value="<%=bean.getTableTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="内容"
									name="tableContent" maxlength="2048" style="height: 350px;"><%=bean.getTableContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" >
			</form>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
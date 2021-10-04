package survlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/joinServlet")
public class joinSurvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public joinSurvlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		userDao dao = new userDao();
		String getUserID = request.getParameter("userID");
		String getUserPassword = request.getParameter("userPassword");
		String getRePassword = request.getParameter("rePassword");
		String getUserName = request.getParameter("userName");
		String getUserGender = request.getParameter("userGender");
		String getUserEmail = request.getParameter("userEmail");

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();

		// getUserID=null;
		if (session.getAttribute("userID") != null) {
			getUserID = (String) session.getAttribute("userID");
		}

		if (getUserID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('IDを入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		} else if (getUserPassword == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('パスワードを入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		} else if (getUserName == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('名前を入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (getUserGender == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('性別を選択してください。')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (getUserEmail == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('メールを入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		} else if (!getUserPassword.equals(getRePassword)) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('入力したパスワードは一致してません。')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			int result = dao.join(getUserID, getUserPassword, getUserName, getUserGender, getUserEmail);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", getUserID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

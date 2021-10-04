package survlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDao;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/boardServlet")
public class boardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public boardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		boardDao dao = new boardDao();
		String getTableTitle = request.getParameter("tableTitle");
		String getTableContent = request.getParameter("tableContent");
		HttpSession session = request.getSession();
		String getUserID = (String) session.getAttribute("userID");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		if (getTableTitle == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('タイトルを入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		} else if (getTableContent == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('内容を入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			int result = dao.write(getTableTitle, getUserID, getTableContent);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('登録に失敗しました。')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board'");
				script.println("</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

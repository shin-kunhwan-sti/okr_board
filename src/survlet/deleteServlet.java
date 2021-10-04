package survlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.boardBean;

import dao.boardDao;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int getTableNumber = Integer.parseInt(request.getParameter("tableNumber"));
		HttpSession session = request.getSession();
		String getUserID = (String) session.getAttribute("userID");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		boardBean bean = new boardDao().getTableNumber(getTableNumber);
		if (!getUserID.equals(bean.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board'");
			script.println("history.back()");
			script.println("</script>");
		} else {
					boardDao dao = new boardDao();
					int result = dao.delete(getTableNumber);
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 실패 했습니다.')");
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

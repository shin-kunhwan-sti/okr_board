package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.boardBean;

public class boardDao {

	private Connection conn;
	private ResultSet rs;

	public boardDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "6574";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()"; // 現座時間
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() { // タイトル
		String SQL = "SELECT tableNumber FROM board ORDER BY tableNumber DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // はじめの場合
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // databaseError
	}

	public int write(String getTableTitle, String getUserID, String getTableContent) {
		String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, getTableTitle);
			pstmt.setString(3, getUserID);
			pstmt.setString(4, getTableContent);
			pstmt.setInt(5, 1);
			pstmt.setString(6, getDate());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int update(int getTableNumber, String getTableTitle, String getTableContent) {
		String SQL = "UPDATE BOARD SET tableTitle = ? , tableContent = ? where tableNumber = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, getTableTitle);
			pstmt.setString(2, getTableContent);
			pstmt.setInt(3, getTableNumber);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<boardBean> getList(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE tableNumber < ? AND flag = 1 ORDER BY tableNumber DESC LIMIT 10";
		ArrayList<boardBean> list = new ArrayList<boardBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardBean board = new boardBean();
				board.setTableNumber(rs.getInt(1));
				board.setTableTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setTableContent(rs.getString(4));
				board.setFlag(rs.getInt(5));
				board.setUpdateTime(rs.getString(6));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE tableNumber < ? AND flag = 1";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boardBean getTableNumber(int tableNumber) {
		String SQL = "SELECT * FROM board WHERE tableNumber = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tableNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardBean bean = new boardBean();
				bean.setTableNumber(rs.getInt(1));
				bean.setTableTitle(rs.getString(2));
				bean.setUserID(rs.getString(3));
				bean.setTableContent(rs.getString(4));
				bean.setFlag(rs.getInt(5));
				bean.setUpdateTime(rs.getString(6));
				return bean;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int delete(int tableNumber) {
		String SQL = "UPDATE board SET flag = 0 WHERE tableNumber = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tableNumber);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}

package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.userBean;

public class userDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public userDao() {
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

	public int login(String userID, String userPassword) {
		String query = "SELECT userPassword FROM USER WHERE userID =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // «í«°«¤«óà÷Íí
				else
					return 0;// «Ñ«¹«ï«ÉÜôìéöÈ

			}
			return -1; // IDª¬ª¢ªêªÞª»ªó¡£
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// DATABASE«¨«é
	}

	public int join(String getUserID, String getUserPassword, String getUserName, String getUserGender,
			String getUserEmail) {
		String query = "INSERT INTO USER VALUES (?, ?, ?, ?, ?,now())";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, getUserID);
			pstmt.setString(2, getUserPassword);
			pstmt.setString(3, getUserName);
			pstmt.setString(4, getUserGender);
			pstmt.setString(5, getUserEmail);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

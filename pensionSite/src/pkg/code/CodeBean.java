package pkg.code;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pkg.pension.PensionTable;
import mypkg.dbConnect;

public class CodeBean{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// MySQL 연결정보
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jsp_db";
	
	// DB 연결 메서드
	void connect() {
		try{
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"jspbook","930218");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	void disconnect(){
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e){
				e.printStackTrace();
				}
			}
		}
	
	// local_code 로 loca_name 불러오기
	public LocalTable getLocalNameByLocalCode(String local_code){
		connect();

		String sql = " select local_name from localtable where local_code ="+local_code;
		ResultSet rs = null;
		
		LocalTable localtable = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				localtable = new LocalTable();
				localtable.setLocal_name(rs.getString(1));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			disconnect();
		}

		return localtable;
	}
	
	
	// thema_code 로 thema_name 불러오기
	public ThemaTable getThemaNameByThemaCode(String thema_code){
		connect();

		String sql = " select thema_name from thematable where thema_code ="+thema_code;
		ResultSet rs = null;
		
		ThemaTable thematable = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				while(rs.next()) {
					
					
					thematable = new ThemaTable();
					thematable.setThema_name(rs.getString(1));
				}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			disconnect();
		}

		return thematable;
	}
	
	
	// tour_code 로 tour_name 불러오기
	public TourTable getTouraNameByTourCode(String tour_code){
		connect();

		String sql = " select thema_name from TourTable where thema_code ="+tour_code;
		ResultSet rs = null;
		
		TourTable tourtable = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				while(rs.next()) {
					
					
					tourtable = new TourTable();
					tourtable.setTour_name(rs.getString(1));
				}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			disconnect();
		}

		return tourtable;
	}
	
}
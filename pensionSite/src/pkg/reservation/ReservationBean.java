package pkg.reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pkg.member.MemberTable;
import pkg.pension.PensionTable;
import mypkg.dbConnect;

public class ReservationBean{
	
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
	
	
	// reservation list 불러오기
	public ArrayList<ReservationTable> getReservatonList(){
		connect();
		
		ResultSet rs = null ;		
		
		String sql = "select * from ReservationTable" ; //db MemberTable 불러오기
		
		ArrayList<ReservationTable> lists = new ArrayList<ReservationTable>();
		
		try {
			pstmt = conn.prepareStatement(sql) ;	
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				
				ReservationTable reservation = new ReservationTable() ;
				
				reservation.setMember_id(rs.getString("member_id")) ;
				reservation.setPension_number(rs.getString("pension_number")) ;
				lists.add(reservation) ;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return lists ;
	}
	
	
	public int InsertReservation(ReservationTable reservation){
		//멤버 빈 객체를 입력 받아서 DB에 데이터를 인서트 시킨다.
		connect();
		
		String sql = " insert into reservationtable value (?, ?, null, null);"; 
		
		int cnt = -1 ; 
		
		try {
			conn.setAutoCommit(false) ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, reservation.getMember_id());
			pstmt.setString(2, reservation.getPension_number());
			
			cnt = pstmt.executeUpdate() ;
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally{
			try {
				
				if(pstmt != null){ pstmt.close() ; }
				if(conn != null){ conn.close() ; }
				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		return cnt  ; //처리한 로우 개수 반환
	}
	
	// member_id를 이용하여 reservation list 불러오기
		public ArrayList<ReservationTable> getReservatonListByMemberId(String member_id){
			connect();
			
			ResultSet rs = null ;		
			
			String sql = "select * from reservationtable where member_id ='"+ member_id+"'"; //db MemberTable 불러오기
			
			ArrayList<ReservationTable> lists = new ArrayList<ReservationTable>();
			
			try {
				pstmt = conn.prepareStatement(sql) ;	
				rs = pstmt.executeQuery() ;
				
				while( rs.next() ){
					
					ReservationTable reservation = new ReservationTable() ;
					
					reservation.setMember_id(rs.getString(1)) ;
					reservation.setPension_number(rs.getString(2)) ;
					lists.add(reservation) ;
				}
				
			} catch (SQLException e) {			
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return lists ;
		}
}
	
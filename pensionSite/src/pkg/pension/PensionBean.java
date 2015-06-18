package pkg.pension;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mypkg.dbConnect;

public class PensionBean{
	
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
	
	// pension list 불러오기
	public ArrayList<PensionTable> getPenisionList(){
		connect();
		
		ResultSet rs = null ;		
		
		String sql = "select * from PensionTable" ; //db MemberTable 불러오기
		
		ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
		
		try {
			pstmt = conn.prepareStatement(sql) ;	
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				
				PensionTable pension = new PensionTable() ;
				
				pension.setPension_number(rs.getString("pension_number")) ;
				pension.setPension_name(rs.getString("pension_name")) ;
				pension.setLocal_code(rs.getString("local_code")) ;
				pension.setThema_code(rs.getString("thema_code")) ;
				pension.setTour_code(rs.getString("tour_code")) ;
				
				pension.setDay_code(rs.getString("day_code")) ;
				pension.setPay_code(rs.getString("pay_code")) ;
				pension.setRoom_user(rs.getString("room_user")) ;
				pension.setPension_photo(rs.getString("pension_photo")) ;
				pension.setLike_code(rs.getString("like_code")) ;
				
				pension.setAddress_code(rs.getString("address_code")) ;
				pension.setPhonenumber_code(rs.getString("phonenumber_code")) ;
				
				lists.add(pension) ;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return lists ;
	}
	
	// pension local code 별 list 불러오기
	public ArrayList<PensionTable> getPensionListByLocalCode(String local_code){
		connect();
		
		ResultSet rs = null ;
		
		String sql = " select * from PensionTable where local_code ="+local_code;
		
		ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
		
		try {
			pstmt = conn.prepareStatement(sql) ;	
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				
				PensionTable pension = new PensionTable() ;
				
				// DB 구현후 컬럼이름 수정했음.
				pension.setPension_number(rs.getString("pension_number")) ;
				pension.setPension_name(rs.getString("pension_name")) ;
				pension.setLocal_code(rs.getString("local_code")) ;
				pension.setThema_code(rs.getString("thema_code")) ;
				pension.setTour_code(rs.getString("tour_code")) ;
				
				pension.setDay_code(rs.getString("day_code")) ;
				pension.setPay_code(rs.getString("pay_code")) ;
				pension.setRoom_user(rs.getString("room_user")) ;
				pension.setPension_photo(rs.getString("pension_photo")) ;
				pension.setLike_code(rs.getString("like_code")) ;
				
				pension.setAddress_code(rs.getString("address_code")) ;
				pension.setPhonenumber_code(rs.getString("phonenumber_code")) ;

				
				lists.add(pension) ;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return lists ;
	}
	
	// pension thema code 별 list 불러오기
		public ArrayList<PensionTable> getPensionListByThemaCode(String thema_code){
			connect();
			
			ResultSet rs = null ;
			
			String sql = " select * from PensionTable where local_code ="+thema_code;
			
			ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
			
			try {
				pstmt = conn.prepareStatement(sql) ;	
				rs = pstmt.executeQuery() ;
				
				while( rs.next() ){
					
					PensionTable pension = new PensionTable() ;
					
					// DB 구현후 컬럼이름 수정했음.
					pension.setPension_number(rs.getString("pension_number")) ;
					pension.setPension_name(rs.getString("pension_name")) ;
					pension.setLocal_code(rs.getString("local_code")) ;
					pension.setThema_code(rs.getString("thema_code")) ;
					pension.setTour_code(rs.getString("tour_code")) ;
					
					pension.setDay_code(rs.getString("day_code")) ;
					pension.setPay_code(rs.getString("pay_code")) ;
					pension.setRoom_user(rs.getString("room_user")) ;
					pension.setPension_photo(rs.getString("pension_photo")) ;
					pension.setLike_code(rs.getString("like_code")) ;
					
					pension.setAddress_code(rs.getString("address_code")) ;
					pension.setPhonenumber_code(rs.getString("phonenumber_code")) ;

					
					lists.add(pension) ;
				}
				
			} catch (SQLException e) {			
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return lists ;
		}
	
		// pension tour code 별 list 불러오기
				public ArrayList<PensionTable> getPensionListByTourCode(String tour_code){
					connect();
					
					ResultSet rs = null ;
					
					String sql = " select * from PensionTable where local_code ="+tour_code;
					
					ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
					
					try {
						pstmt = conn.prepareStatement(sql) ;	
						rs = pstmt.executeQuery() ;
						
						while( rs.next() ){
							
							PensionTable pension = new PensionTable() ;
							
							// DB 구현후 컬럼이름 수정했음.
							pension.setPension_number(rs.getString("pension_number")) ;
							pension.setPension_name(rs.getString("pension_name")) ;
							pension.setLocal_code(rs.getString("local_code")) ;
							pension.setThema_code(rs.getString("thema_code")) ;
							pension.setTour_code(rs.getString("tour_code")) ;
							
							pension.setDay_code(rs.getString("day_code")) ;
							pension.setPay_code(rs.getString("pay_code")) ;
							pension.setRoom_user(rs.getString("room_user")) ;
							pension.setPension_photo(rs.getString("pension_photo")) ;
							pension.setLike_code(rs.getString("like_code")) ;
							
							pension.setAddress_code(rs.getString("address_code")) ;
							pension.setPhonenumber_code(rs.getString("phonenumber_code")) ;

							
							lists.add(pension) ;
						}
						
					} catch (SQLException e) {			
						e.printStackTrace();
					} finally {
						disconnect();
					}
					
					return lists ;
				}
	
	// pension 검색바 결과 list 불러오기
	public ArrayList<PensionTable> getPensionListBysearch(PensionTable pension){
		connect();
		
		String sql = " select * from PensionTable where local_code = ?, pay_code = ?, room_user = ?";
		// , stay_date = ? 두번째에 잠깐 뻈음
		ResultSet rs = null ;
		
		ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
		
		try {
			pstmt = conn.prepareStatement( sql ) ;
			pstmt.setString(1, pension.getLocal_code()) ;
			//pstmt.setString(2, pension.getStay_date()) ;
			pstmt.setString(2, pension.getPay_code()) ;
			pstmt.setString(3, pension.getRoom_user()) ;
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				
				PensionTable searchPension = new PensionTable() ;
				
				searchPension.setPension_number(rs.getString("pension_number")) ;
				searchPension.setPension_name(rs.getString("pension_name")) ;
				searchPension.setLocal_code(rs.getString("local_code")) ;
				searchPension.setThema_code(rs.getString("thema_code")) ;
				searchPension.setTour_code(rs.getString("tour_code")) ;
				
				searchPension.setDay_code(rs.getString("day_code")) ;
				searchPension.setPay_code(rs.getString("pay_code")) ;
				searchPension.setRoom_user(rs.getString("room_user")) ;
				searchPension.setPension_photo(rs.getString("pension_photo")) ;
				searchPension.setLike_code(rs.getString("like_code")) ;
				
				searchPension.setAddress_code(rs.getString("address_code")) ;
				searchPension.setPhonenumber_code(rs.getString("phonenumber_code")) ;
				
				lists.add(searchPension) ;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return lists ;
	}
	
	
	// 가져온 pension_name 파라미터로 pension DB 불러오기
	public PensionTable getPensionInfoByPensionName(String pension_name){
		connect();

		String sql = " select * from PensionTable where pension_name = ?";
		ResultSet rs = null;
		PensionTable pension = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pension_name) ;
			rs = pstmt.executeQuery();
			
//			while (rs.next()) {
				rs.first();

				pension = new PensionTable();

				// DB 구현후 컬럼이름 수정했음.
				pension.setPension_number(rs.getString("pension_number"));
				pension.setPension_name(rs.getString("pension_name"));
				pension.setLocal_code(rs.getString("local_code"));
				pension.setThema_code(rs.getString("thema_code"));
				pension.setTour_code(rs.getString("tour_code"));

				pension.setDay_code(rs.getString("day_code"));
				pension.setPay_code(rs.getString("pay_code"));
				pension.setRoom_user(rs.getString("room_user"));
				pension.setPension_photo(rs.getString("pension_photo"));
				pension.setLike_code(rs.getString("like_code"));

				pension.setAddress_code(rs.getString("address_code"));
				pension.setPhonenumber_code(rs.getString("phonenumber_code"));

//			}
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
		}

		return pension;
	}
	
	
	// 가져온 local_code 파라미터와 like_code로 DB 불러오기   *like code max값 가져오는거 다시 구현하기
		public PensionTable getPensionInfoByLikeCode(String local_code){
			connect();

			String sql = " select * from PensionTable where pension_name = ?";
			ResultSet rs = null;
			PensionTable pension = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, local_code) ;
				rs = pstmt.executeQuery();
				
//				while (rs.next()) {
					rs.first();

					pension = new PensionTable();

					// DB 구현후 컬럼이름 수정했음.
					pension.setPension_number(rs.getString("pension_number"));
					pension.setPension_name(rs.getString("pension_name"));
					pension.setLocal_code(rs.getString("local_code"));
					pension.setThema_code(rs.getString("thema_code"));
					pension.setTour_code(rs.getString("tour_code"));

					pension.setDay_code(rs.getString("day_code"));
					pension.setPay_code(rs.getString("pay_code"));
					pension.setRoom_user(rs.getString("room_user"));
					pension.setPension_photo(rs.getString("pension_photo"));
					pension.setLike_code(rs.getString("like_code"));

					pension.setAddress_code(rs.getString("address_code"));
					pension.setPhonenumber_code(rs.getString("phonenumber_code"));

//				}
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
			}

			return pension;
		}
		
		
		// 가져온 pension_name 파라미터로 pension Number 불러오기
		public PensionTable getPensionNumberByPensionName(String pension_name){
			connect();

			String sql = " select pension_number from PensionTable where pension_name = ?";
			ResultSet rs = null;
			PensionTable pension = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pension_name) ;
				rs = pstmt.executeQuery();
				
//				while (rs.next()) {
					rs.first();

					pension = new PensionTable();

					// DB 구현후 컬럼이름 수정했음.
					pension.setPension_number(rs.getString("pension_number"));

//				}
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
			}

			return pension;
		}
	
}
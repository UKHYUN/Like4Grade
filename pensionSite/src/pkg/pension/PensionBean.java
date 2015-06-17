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
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb";
	
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
				
				pension.setId(rs.getString("id")) ;
				pension.setName(rs.getString("name")) ;
				pension.setPassword(rs.getString("password")) ;					
				pension.setHiredate(String.valueOf(rs.getDate("hiredate"))) ;
				pension.setGender(rs.getString("gender")) ;				
				pension.setEmail1(rs.getString("email1")) ;
				pension.setEmail2(rs.getString("email2")) ;
				
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
			
			String sql = " select * from PensionTable where local_code = ? ";
			
			ArrayList<PensionTable> lists = new ArrayList<PensionTable>();
			
			try {
				pstmt = conn.prepareStatement(sql) ;	
				rs = pstmt.executeQuery() ;
				
				while( rs.next() ){
					
					PensionTable pension = new PensionTable() ;
					
					// DB 구현후 컬럼이름 수정하기.
					pension.setPension_name(rs.getString("id")) ;
					pension.setLocal_code(rs.getString("name")) ;
//					pension.setPassword(rs.getString("password")) ;					
//					pension.setHiredate(String.valueOf(rs.getDate("hiredate"))) ;
//					pension.setGender(rs.getString("gender")) ;				
//					pension.setEmail1(rs.getString("email1")) ;
//					pension.setEmail2(rs.getString("email2")) ;
					
					lists.add(pension) ;
				}
				
			} catch (SQLException e) {			
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return lists ;
		}
	
	
}
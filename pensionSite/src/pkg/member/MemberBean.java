package pkg.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mypkg.dbConnect;

public class MemberBean{
	
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
	
	// member list 불러오기 (구현 잘되있는 상태)
	public ArrayList<MemberTable> getMemberList(){
		connect();
		
		ResultSet rs = null ;		
		
		String sql = "select * from MemberTable" ; //db MemberTable 불러오기
		
		ArrayList<MemberTable> lists = new ArrayList<MemberTable>();
		
		try {
			pstmt = conn.prepareStatement(sql) ;	
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				
				MemberTable member = new MemberTable() ;
				
				member.setId(rs.getString("id")) ;
				member.setName(rs.getString("name")) ;
				member.setPassword(rs.getString("password")) ;					
				member.setHiredate(String.valueOf(rs.getDate("hiredate"))) ;
				member.setGender(rs.getString("gender")) ;				
				member.setEmail1(rs.getString("email1")) ;
				member.setEmail2(rs.getString("email2")) ;
				
				lists.add(member) ;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return lists ;
	}
	
	
	public int getSelectByMember(MemberTable member){
		connect();
		
		String sql = "select password from membertable where id = ? "; 
		
		ResultSet rs = null ;
		
		int cnt = -1;
		
		try {
			pstmt = conn.prepareStatement( sql ) ;
			pstmt.setString(1, member.getId()) ;
			rs = pstmt.executeQuery() ;
			
			if(rs.next()){	//아이디 존재
				if( rs.getString("password").equals(member.getPassword())){
					cnt = 1 ;
				}else{
					cnt = 0 ;
				}
			}else{ //존재하지 않는 회원
				//코딩할 필요 없음
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){rs.close() ; }
				if(pstmt != null){pstmt.close() ; }
				if(conn != null){conn.close() ; }
			} catch (Exception e2) {
				e2.printStackTrace() ;
			}
		}
		
		return cnt  ;
	}

	
	public MemberTable getMemberById( String id ){
		//해당 아이디를 가지고 멤버 빈 객체를 리턴한다.
		connect();
		
		String sql = " select * from membertable where id = ? ";
		ResultSet rs = null ;
		MemberTable member = null ;
		
		try {
			pstmt = conn.prepareStatement( sql ) ;
			
			pstmt.setString(1, id) ;
			rs = pstmt.executeQuery() ; 
			
			if( rs.next() ){
				member = new MemberTable() ;
				
				member.setId(rs.getString("id")) ;
				member.setName(rs.getString("name")) ;
				member.setPassword(rs.getString("password")) ;					
				member.setHiredate(String.valueOf(rs.getDate("hiredate"))) ;
				member.setGender(rs.getString("gender")) ;				
				member.setEmail1(rs.getString("email1")) ;
				member.setEmail2(rs.getString("email2")) ;	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if( rs != null ){rs.close() ;}
				if( pstmt != null ){pstmt.close() ;}
				if( conn != null ){conn.close() ;}	
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return member ;
	}
	
	public int InsertMember(MemberTable member){
		//멤버 빈 객체를 입력 받아서 DB에 데이터를 인서트 시킨다.
		connect();
		
		String sql = " insert into membertable(id,name,password,hiredate,gender,email1,email2)" ;
		sql += " values(?, ?, ?, ?, ?, ?, ?)" ; 
		
		int cnt = -1 ; 
		
		try {
			conn.setAutoCommit(false) ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());	
			pstmt.setString(4, member.getHiredate());			
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail1());
			pstmt.setString(7, member.getEmail2());
			
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
}

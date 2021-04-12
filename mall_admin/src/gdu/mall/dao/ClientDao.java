package gdu.mall.dao;
import gdu.mall.util.*;
import gdu.mall.vo.*;
import java.util.*;
import java.sql.*;

public class ClientDao {
	
	// 전체 행의 수
	public static int totalCount(String searchWord) throws Exception {
		Connection conn = DBUtil.getConnection();
		
		//sql
		String sql = "";
		int totalRow = 0;
		System.out.println(searchWord + " <-- clientDao.java에서 totalCount()의 searchWord");	
		if(searchWord == null ) { //searchWord가 null이면
			//SELECT client_mail clientMail, client_date clientDate FROM client WHERE client_mail LIKE ? ORDER BY client_date DESC LIMIT ?,?
			//전체행 갯수
			sql = "SELECT COUNT(*) cnt FROM client";		
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//쿼리 실행
			ResultSet rs = stmt.executeQuery();
			
			//전체행 갯수 totalRow변수에 대입
			if(rs.next()) {
				totalRow = rs.getInt("cnt"); 
			}
			//totalRow변수 디버깅
			System.out.println(totalRow + " <-- clientDao.java에서 totalCount()의 searchWord가 공백일때 totalRow");	
		} else { //searchWord가 null 이 아니면
			//검색값 갯수 가져오는 쿼리
			sql = "SELECT COUNT(*) cnt FROM client WHERE client_mail LIKE ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1,"%"+searchWord+"%");
			
			//디버깅		
			System.out.println(stmt + " <-- clientDao.java에서 totalCount()의 stmt");
			
			//쿼리 실행
			ResultSet rs = stmt.executeQuery();
			
			//검색된 행 갯수 totalRow변수에 대입
			if(rs.next()) {
				totalRow = rs.getInt("cnt"); 
			}
			//totalRow변수 디버깅
			System.out.println(totalRow + " <-- clientDao.java에서 totalCount()의 searchWord가 공백이 아닐때 totalRow");
			
		}
		//리턴
		return totalRow;
	}

	//목록
	public static ArrayList<Client> selectClientListByPage(int rowPerPage, int beginRow, String searchWord) throws Exception {	
		
		
		//반환할 리스트 초기화
		ArrayList<Client> list = new ArrayList<>();
		
		//db처리
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = null;
		//sql
		String sql = "";
		if(searchWord == null) { //searchWord 가 없으면
			sql="SELECT client_mail clientMail, client_date clientDate FROM client ORDER BY client_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);	
			stmt.setInt(1,beginRow);
			stmt.setInt(2,rowPerPage);
		}	else { //searchWord 가 있으면
			sql="SELECT client_mail clientMail, client_date clientDate FROM client WHERE client_mail LIKE ? ORDER BY client_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);	
			stmt.setString(1,"%"+searchWord+"%");
			stmt.setInt(2,beginRow);
			stmt.setInt(3,rowPerPage);
		}
	
		//stmt디버깅
		System.out.println(stmt + " <-- clientDao.java에서 selectClientListByPage()의 stmt");
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//반복문 돌면 ResultSet을 ArrayList<Client>로 변환
		while(rs.next()) {
			Client c = new Client();
			c.setClientMail(rs.getString("clientMail"));
			c.setClientDate(rs.getString("clientDate"));
			list.add(c);
		}
		
		//리턴
		return list;
	}
	
	//클라이언트 비밀번호 변경
	public static void updateClient(String clientMail, String clientPw) throws Exception {
		//sql
		String sql = "UPDATE client SET client_pw = PASSWORD(?) WHERE client_mail=?";
		
		//처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,clientPw);
		stmt.setString(2,clientMail);
		//stmt디버깅
		System.out.println(stmt + " <-- ClientDao.java에서 updateClient()의 stmt");
		
		//수정실행
		stmt.executeUpdate();
	}
	
	//클라이언트 삭제
	public static void deleteClient(String clientMail) throws Exception {
		//sql
		String sql = "DELETE FROM client WHERE client_mail = ?";
		
		//처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,clientMail);
		//stmt디버깅
		System.out.println(stmt + "<-- ClientDao.java에서 deleteClient() stmt");
		
		//삭제실행
		stmt.executeUpdate();
	}
}
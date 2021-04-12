package gdu.mall.dao;

import java.sql.*;
import java.util.*;
import gdu.mall.util.*;
import gdu.mall.vo.*;

public class EbookDao {
	public static int totalCount(String categoryName) throws Exception {
		Connection conn = DBUtil.getConnection();
		
		//sql
		String sql = "";
		int totalRow = 0;
		if(categoryName == null) { //categoryName이 null이면
			//전체행 갯수
			sql = "SELECT COUNT(*) cnt FROM ebook";		
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//쿼리 실행
			ResultSet rs = stmt.executeQuery();
			
			//전체행 갯수 totalRow변수에 대입
			if(rs.next()) {
				totalRow = rs.getInt("cnt"); 
			}
			//totalRow변수 디버깅
			System.out.println(totalRow + " <-- EbookDao.java에서 totalCount()의 categoryName이 공백일때 totalRow");	
		} else { //categoryName이 null 이 아니면
			//검색값 갯수 가져오는 쿼리
			sql = "SELECT COUNT(*) cnt FROM ebook WHERE category_name = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1,categoryName);
			
			//디버깅		
			System.out.println(stmt + " <-- EbookDao.java에서 totalCount()의 stmt");
			
			//쿼리 실행
			ResultSet rs = stmt.executeQuery();
			
			//검색된 행 갯수 totalRow변수에 대입
			if(rs.next()) {
				totalRow = rs.getInt("cnt"); 
			}
			//totalRow변수 디버깅
			System.out.println(totalRow + " <-- EbookDao.java에서 totalCount()의 categoryName이 공백이 아닐때 totalRow");
		}
		//리턴
		return totalRow;
	}
	
	//ebookno를 사용해서 ebookISBN가져오기
	public static String matchEbookISBN(int ebookNo) throws Exception{
		String sql = "SELECT ebook_isbn ebookISBN FROM ebook WHERE ebook_no = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 matchEbookISBN()의 stmt");
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery();
		
		String ebookISBN = "";
		if(rs.next()) { //없을일은 없겠지만 혹시 모르니
			ebookISBN = rs.getString("ebookISBN");
		}

		return ebookISBN;
	}
	
	
	//ebook 삭제
	public static void deleteEbook(String ebookISBN) throws Exception{
		//sql
		String sql = "DELETE FROM ebook WHERE ebook_isbn = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,ebookISBN);
		
		//stmt디버깅
		System.out.println(stmt + "<-- EbookDao.java에서 deleteEbook() stmt");
		
		//삭제실행
		stmt.executeUpdate();
	}
	
	//state 업데이트
	public static void updateEbookState(Ebook ebook) throws Exception {
		String sql = "UPDATE ebook SET ebook_state = ? WHERE ebook_isbn = ?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookState());
		stmt.setString(2, ebook.getEbookISBN());
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 updateEbookState()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	//summary업데이트
	public static void updateEbookSummary(Ebook ebook) throws Exception {
		//sql
		String sql = "UPDATE ebook SET ebook_summary = ? WHERE ebook_isbn = ?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookSummary());
		stmt.setString(2, ebook.getEbookISBN());
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 updateEbookSummary()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	
	//img업데이트
	public static void updateEbookImg(Ebook ebook) throws Exception {
		String sql="UPDATE ebook SET ebook_img=? WHERE ebook_isbn = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookImg());
		stmt.setString(2, ebook.getEbookISBN());
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 updateEbookImg()의 stmt");
		
		stmt.executeUpdate();
	}
	//ISBN중복체크
	public static int checkISBN (String EbookISBN) throws Exception {
		String sql = "SELECT ebook_isbn ebookISBN FROM ebook WHERE ebook_isbn = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, EbookISBN);
		
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 checkISBN()의 stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { //중복되는게 있으면
			return 0;
		}
		//중복되는게 없으면
		return 1;
	}
	//ebook보여주기
	public static Ebook selectEbookOne(String ebookISBN) throws Exception {
		String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_company ebookCompany, ebook_page_count ebookPageCount, ebook_price ebookPrice, ebook_summary ebookSummary, ebook_img ebookImg, ebook_date ebookDate, ebook_state ebookState FROM ebook WHERE ebook_isbn = ?";
		Ebook ebook = new Ebook();
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebookISBN);
		
		//디버깅 
		System.out.println(stmt + "<--- EbookDao.java에서 selectEbookOne()의 stmt");
		
		//가져온 데이터 담기
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			ebook.setEbookNo(rs.getInt("ebookNo"));
			ebook.setEbookISBN(rs.getString("ebookISBN"));
			ebook.setCategoryName(rs.getString("categoryName"));
			ebook.setEbookTitle(rs.getString("ebookTitle"));
			ebook.setEbookAuthor(rs.getString("ebookAuthor"));
			ebook.setEbookCompany(rs.getString("ebookCompany")); 
			ebook.setEbookPageCount(rs.getInt("ebookPageCount")); 
			ebook.setEbookPrice(rs.getInt("ebookPrice"));
			ebook.setEbookImg(rs.getString("ebookImg"));
			ebook.setEbookSummary(rs.getString("ebookSummary"));
			ebook.setEbookDate(rs.getString("ebookDate"));
			ebook.setEbookState(rs.getString("ebookState"));
		}
		
		return ebook;
	}
	//입력메서드
	public static int insertEbook(Ebook ebook) throws Exception{
		/*
		 * INSERT INTO ebook(
		 * 		ebook_isbn,
		 *      category_name,
		 *      ebook_title,
		 *      ebook_autor,
		 *      ebook_company,
		 *      ebook_page_count,
		 *      ebook_price,  
		 *      ebook_summary,
		 *      ebook_img,
		 *      ebook_date,
		 *      ebook_state
		 *) VALUES (
		 *		?,?,?,?,?,?,?,?,'default.jpg',now(),'판매중'
		 *)                        
		 */
		String sql= "INSERT INTO ebook(ebook_isbn, category_name, ebook_title, ebook_author, ebook_company, ebook_page_count, ebook_price, ebook_summary, ebook_img, ebook_date, ebook_state) VALUES (?,?,?,?,?,?,?,?,'default.jpg',now(),'판매중')";
		int rowCnt = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookISBN() );
		stmt.setString(2, ebook.getCategoryName() );
		stmt.setString(3, ebook.getEbookTitle() );
		stmt.setString(4, ebook.getEbookAuthor() );
		stmt.setString(5, ebook.getEbookCompany() );
		stmt.setInt(6, ebook.getEbookPageCount() );
		stmt.setInt(7, ebook.getEbookPrice() );
		stmt.setString(8, ebook.getEbookSummary() );
		System.out.println(stmt + "<--- EbookDao.java에서 insertEbook()의 stmt");
		
		rowCnt = stmt.executeUpdate();
		return rowCnt;
	}
	
	public static ArrayList<Ebook> selectEbook(int rowPerPage, int beginRow, String categoryName) throws Exception{
		//반환할 리스트 초기화
		ArrayList<Ebook> list = new ArrayList<>();
		//db연결
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = null;
		//sql
		String sql ="";
		if(categoryName == null) { //카테고리 네임이 nㅕll이면
			sql = "SELECT category_name categoryName, ebook_isbn ebookISBN, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_date ebookDate, ebook_price ebookPrice FROM ebook  ORDER BY ebook_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow);
			stmt.setInt(2,rowPerPage);
			//디버깅
			System.out.println(stmt + " <-- EbookDao.java에서 selectEbook()의 stmt");
		} else { //카테고리 네임이 null이 아니면 해당 카테고리만 가져옴
			sql = "SELECT category_name categoryName, ebook_isbn ebookISBN, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_date ebookDate, ebook_price ebookPrice FROM ebook WHERE category_name = ? ORDER BY ebook_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,categoryName);
			stmt.setInt(2,beginRow);
			stmt.setInt(3,rowPerPage);
			//디버깅
			System.out.println(stmt + " <-- EbookDao.java에서 selectEbook()의 stmt");
		}

		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//반복문 돌면서 ResultSet을 ArrayList<Ebook>로 변환
		while(rs.next()) {
			Ebook e = new Ebook();
			e.setCategoryName(rs.getString("categoryName"));
			e.setEbookISBN(rs.getString("ebookISBN"));
			e.setEbookTitle(rs.getString("ebookTitle"));
			e.setEbookAuthor(rs.getString("ebookAuthor"));
			e.setEbookDate(rs.getString("ebookDate"));
			e.setEbookPrice(rs.getInt("ebookPrice"));
			list.add(e);
		}
		
		//리턴
		return list;
	}
}
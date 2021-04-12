package gdu.mall.dao;

import java.sql.*;
import java.util.*;
import gdu.mall.util.*;
import gdu.mall.vo.*;

public class NoticeDao {
	//공지글 삭제
	public static void deleteNotice(int noticeNo) throws Exception {
		//sql
		String sql = "DELETE FROM notice WHERE notice_no = ?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		//디버깅 
		System.out.println(stmt + "<--- NoticeDao.java에서 deleteNotice()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	//공지글 추가
	public static void insertNotice(Notice notice) throws Exception {
		//sql
		String sql = "INSERT INTO notice(notice_title, notice_content, manager_id, notice_date) VALUE(?,?,?,now())";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, notice.getManagerId());
		//디버깅 
		System.out.println(stmt + "<--- NoticeDao.java에서 insertNotice()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	//공지글 수정
	public static void updateNotice(Notice notice) throws Exception {
		//sql
		String sql = "UPDATE notice SET notice_title = ?, notice_content = ? WHERE notice_no = ?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeNo());
		//디버깅 
		System.out.println(stmt + "<--- NoticeDao.java에서 updateNotice()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	//공지 글 하나 가져오기
	public static Notice selectNoticeOne(int noticeNo) throws Exception {
		//sql
		String sql = "SELECT notice_no noticeNo, notice_title noticeTitle, notice_content noticeContent, notice_date noticeDate, manager_id managerId  FROM notice WHERE notice_no = ?";
		Notice notice = new Notice();
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		
		//디버깅 
		System.out.println(stmt + "<--- NoticeDao.java에서 selectNoticeOne()의 stmt");
		
		//가져온 데이터 담기
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice.setNoticeNo(rs.getInt("noticeNo"));
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setNoticeContent(rs.getString("noticeContent"));
			notice.setManagerId(rs.getString("managerId"));
			notice.setNoticeDate(rs.getString("noticeDate"));
		}
		return notice;
	}
	
	//리스트 가져오기
	public static ArrayList<Notice> selectNotice(int rowPerPage, int beginRow) throws Exception{
		//반환할 리스트 초기화
		ArrayList<Notice> list = new ArrayList<>();
		
		//sql
		String sql = "SELECT notice_no noticeNo, notice_title noticeTitle, notice_date noticeDate, manager_id managerId FROM notice ORDER BY notice_date DESC LIMIT ?,?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,beginRow);
		stmt.setInt(2,rowPerPage);
		
		//디버깅
		System.out.println(stmt + " <-- NoticeDao.java에서 selectNotice()의 stmt");
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//반복문 돌면서 ResultSet을 ArrayList<Ebook>로 변환
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeNo(rs.getInt("noticeNo"));
			n.setNoticeTitle(rs.getString("noticeTitle"));
			n.setManagerId(rs.getString("managerId"));
			n.setNoticeDate(rs.getString("noticeDate"));
			list.add(n);
		}
		//리턴
		return list;
	}
	
	// 전체 행의 수
	public static int totalCount() throws Exception {
		Connection conn = DBUtil.getConnection();
		
		//sql
		String sql = "SELECT COUNT(*) cnt FROM notice";
		
		int totalRow = 0;

		//전체행 갯수	
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//전체행 갯수 totalRow변수에 대입
		if(rs.next()) {
			totalRow = rs.getInt("cnt"); 
		}
		//totalRow변수 디버깅
		System.out.println(totalRow + " <-- NoticeDao.java에서 totalCount()의 totalRow");	
		//리턴
		return totalRow;
	}

}

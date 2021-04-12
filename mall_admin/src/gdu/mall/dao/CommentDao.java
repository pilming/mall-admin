package gdu.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import gdu.mall.util.*;
import gdu.mall.vo.*;

public class CommentDao {
	public static int selectCommentCnt(int noticeNo) throws Exception{
		//sql
		String sql = "SELECT COUNT(*) cnt from comment where notice_no =?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		
		//디버깅 
		System.out.println(stmt + "<--- CommentDao.java에서 selectCommentCnt()의 stmt");
		
		//가져온 데이터 담기
		int rowCnt = 0;
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			rowCnt = rs.getInt("cnt");
		}
		System.out.println(rowCnt + "<--- CommentDao.java에서 selectCommentCnt()의 rowCnt");
		return rowCnt;
	}
	
	public static int insertComment(Comment comment) throws Exception{
		//sql
		String sql = "INSERT INTO comment(notice_no, manager_id, comment_content, comment_date) VALUE(?,?,?,now())";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, comment.getNotice_no());
		stmt.setString(2, comment.getManager_id());
		stmt.setString(3, comment.getComment_content());
		
		//디버깅
		System.out.println(stmt + "<--- CommentDao.java에서 insertComment()의 stmt");
		
		//추가실행
		
		//0실패 1 성공
		int rowCnt = stmt.executeUpdate();
		
		return rowCnt;
	}
	
	//댓글 가져오기 (나중에 페이징 하려면 매개변수로 int beginRow, int rowPerPage 받아서 쿼리 수정)
	public static ArrayList<Comment> selectCommentListByNoticeNo(int noticeNo) throws Exception{
		//select * from comment where notice_no = ?
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		//sql
		String sql = "SELECT comment_no commentNo, manager_id managerId, comment_content commentContent, comment_date commentDate from comment where notice_no =? ORDER BY comment_date DESC";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		
		//디버깅 
		System.out.println(stmt + "<--- CommentDao.java에서 selectCommentListByNoticeNo()의 stmt");
		
		//가져온 데이터 담기
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Comment c = new Comment();
			c.setComment_no(rs.getInt("commentNo"));
			c.setManager_id(rs.getString("managerId"));
			c.setComment_content(rs.getString("commentContent"));
			c.setComment_date(rs.getString("commentDate"));
			list.add(c);
		}

		return list;
	}

	//deleteComment 메서드 오버로딩
	public static int deleteComment(int commentNo) throws Exception{ //
		//delete from comment where comment_no=?
		//sql
		String sql = "DELETE from comment where comment_no = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, commentNo);
		
		//디버깅 
		System.out.println(stmt + "<--- CommentDao.java에서 deleteComment()의 stmt");
		
		//0실패 1 성공
		int rowCnt = stmt.executeUpdate();
		
		return rowCnt;
	}
	
	public static int deleteComment(int commentNo, String managerId) throws Exception{ //
		//delete from comment where comment_no=?
		//delete from comment where comment_no=? and managerId = ?
		String sql = "DELETE from comment where comment_no = ? AND manager_id = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, commentNo);
		stmt.setString(2, managerId);
		
		//디버깅 
		System.out.println(stmt + "<--- CommentDao.java에서 deleteComment()의 stmt");
		
		//0실패 1 성공
		int rowCnt = stmt.executeUpdate();
		
		return rowCnt;

	}
}

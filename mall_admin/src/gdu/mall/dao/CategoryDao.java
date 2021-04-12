package gdu.mall.dao;

import java.sql.*;
import java.util.*;
import gdu.mall.util.*;
import gdu.mall.vo.*;


public class CategoryDao {
	public static ArrayList<String> categoryNameList() throws Exception{
		
		//반환할 리스트 초기화
		ArrayList<String> list = new ArrayList<>();
		//db처리
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = null;
		//sql
		String sql = "SELECT category_name categoryName FROM category";
		stmt = conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt + " <-- CategoryDao.java에서 selectEbookCategory()의 stmt");
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//반복문 돌면서 ResultSet을 ArrayList<Category>로 변환
		while(rs.next()) {
			String tempCategory = rs.getString("categoryName");
			list.add(tempCategory);
		}

		return list;
	}
	public static ArrayList<Category> selectCategory() throws Exception{
		
		//반환할 리스트 초기화
		ArrayList<Category> list = new ArrayList<>();
		//db처리
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = null;
		//sql
		String sql = "SELECT category_name categoryName, category_weight categoryWeight FROM category ORDER BY category_date DESC";
		stmt = conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt + " <-- CategoryDao.java에서 selectCategory()의 stmt");
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//반복문 돌면서 ResultSet을 ArrayList<Category>로 변환
		while(rs.next()) {
			Category tempCategory = new Category();
			tempCategory.setCategoryName(rs.getString("categoryName"));
			tempCategory.setCategoryWeight(rs.getInt("categoryWeight"));
			list.add(tempCategory);
		}
		
		return list;
	}
	
	public static void deleteCategory(String categoryName) throws Exception{
		//sql
		String sql = "DELETE FROM category WHERE category_name = ?";
		
		//처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,categoryName);
		
		//stmt디버깅
		System.out.println(stmt + "<-- CategoryDao.java에서 deleteCategory() stmt");
		
		//삭제실행
		stmt.executeUpdate();
	}
	
	public static String selectCategoryName(String categoryName) throws Exception {
		// 1. sql문
		String sql = "SELECT category_name categoryName FROM category WHERE category_name = ?";
		// 2. 리턴타입 초기화
		String returnCategoryName = null;
		//3.db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		System.out.println(stmt + "<-- CategoryDao.java에서 selectCategoryName()에서 stmt");
		
		ResultSet rs = stmt.executeQuery();		
		if(rs.next()) {
			returnCategoryName = rs.getString("categoryName");
		}
		return returnCategoryName;
	}
	
	public static int insertCategory(String categoryName, int categoryWeight) throws Exception{
		//1
		String sql = "INSERT INTO category(category_name, category_weight, category_date) VALUES(?,?,now())";
		//2.
		int rowCount = 0; //입력성공시 1, 실패시 0;
		//3
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, categoryWeight);
		System.out.println(stmt + "<-- CategoryDao.java에서 insertCategory()에서 stmt");
		rowCount = stmt.executeUpdate();
		
		return rowCount;
	}
	
	public static void updateCategoryWeight(String categoryName, int categoryWeight) throws Exception {
		//sql
		String sql = "UPDATE category SET category_weight = ? WHERE category_name=?";
		
		//처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,categoryWeight);
		stmt.setString(2,categoryName);
		//stmt디버깅
		System.out.println(stmt + " <-- CategoryDao.java에서 updateCategoryWeight()의 stmt");
		//수정실행
		stmt.executeUpdate();
	}
}
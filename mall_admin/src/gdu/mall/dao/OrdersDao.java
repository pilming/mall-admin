package gdu.mall.dao;
import gdu.mall.vo.*;
import gdu.mall.util.*;
import java.util.*;
import java.sql.*;

public class OrdersDao {
	//주문상태 수정 메서드
	public static void updateOrdersState(Orders orders) throws Exception{
		String sql = "UPDATE orders SET orders_state = ? WHERE orders_no = ?";
		
		//db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrdersState());
		stmt.setInt(2, orders.getOrdersNo());
		
		//디버깅 
		System.out.println(stmt + "<--- OrdersDao.java에서 updateOrdersState()의 stmt");
		
		//업데이트 실행
		stmt.executeUpdate();
	}
	
	//총 주문갯수 알아내기
	public static int totalCount() throws Exception{
		
		//반환할 총 행
		int totalRow = 0;

		//sql
		String sql = "SELECT COUNT(*) cnt FROM orders";		
		
		//db
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		//전체행 갯수 totalRow변수에 대입
		if(rs.next()) {
			totalRow = rs.getInt("cnt"); 
		}
		//totalRow변수 디버깅
		System.out.println(totalRow + " <-- OrdersDao.java에서 totalCount()의 totalRow");	
		
		//리턴
		return totalRow;
	}
	//oreders리스트 아님 --> orders join ebook join client 리스트임
	public static ArrayList<OrdersAndEbookAndClient> selectOrdersListByPage(int rowPerPage, int beginRow) throws Exception{
		/*
		 * select
		 * o.oders_no ordersNo,
		 *
		 * 
		*/
		ArrayList<OrdersAndEbookAndClient> list = new ArrayList<>();
		String sql = "SELECT o.orders_no ordersNo,o.ebook_no ebookNo,e.ebook_title ebookTitle,o.client_no clientNo,c.client_mail clientMail,o.orders_date ordersDate,o.orders_state ordersState FROM orders o INNER JOIN ebook e INNER JOIN client c ON o.ebook_no = e.ebook_no AND o.client_no=c.client_no ORDER BY o.orders_date DESC LIMIT ?,?";
		
		//db
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,beginRow);
		stmt.setInt(2,rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			OrdersAndEbookAndClient oec = new OrdersAndEbookAndClient();
			Orders o = new Orders();
			o.setOrdersNo(rs.getInt("ordersNo"));
			o.setEbookNo(rs.getInt("ebookNo"));
			o.setClientNo(rs.getInt("clientNo"));
			o.setOrdersDate(rs.getString("ordersDate"));
			o.setOrdersState(rs.getString("ordersState"));
			oec.setOrders(o);
			Ebook e = new Ebook();
			e.setEbookTitle(rs.getString("ebookTitle"));
			oec.setEbook(e);
			Client c = new Client();
			c.setClientMail(rs.getString("clientMail"));
			oec.setClient(c);
			list.add(oec);
		}
		return list;
	}
}

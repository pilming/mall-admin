<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//updateOrdersStateAction.jsp
	
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//값수집
	request.setCharacterEncoding("utf-8");//한글깨짐방지 인코딩
	int ordersNo = Integer.parseInt(request.getParameter("ordersNo"));
	String ordersState = request.getParameter("ordersState");
	//페이징을 유지하기위해서 마지막 리다이렉션에서 get방식으로 전달해줄거임. 그래서 int로 변환할 필요 없음
	String rowPerPage = request.getParameter("rowPerPage");
	String currentPage = request.getParameter("currentPage");
	
	//수집 된 값 디버깅
	System.out.println(ordersNo + "<--updateOrdersStateAction.jsp 에서 ordersNo");
	System.out.println(ordersState + "<--updateOrdersStateAction.jsp 에서 ordersState");
	
	//새로운 객체 생성 (메서드 매개변수에 사용하기위함)
	Orders orders = new Orders();
	orders.setOrdersNo(ordersNo);
	orders.setOrdersState(ordersState);
	
	//업데이트 실행
	OrdersDao.updateOrdersState(orders);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/orders/ordersList.jsp?rowPerPage="+rowPerPage+"&currentPage="+currentPage);
	
	return;
	
	
%>
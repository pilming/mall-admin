<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="java.sql.*" %>
<%
	//세션확인후 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//데이터 수집
	request.setCharacterEncoding("utf-8"); //한글깨짐 방지 인코딩
	String categoryName = request.getParameter("categoryName");
	int categoryWeight = Integer.parseInt(request.getParameter("categoryWeight"));
	//수집된 데이터 디버깅
	System.out.println(categoryName + "<-- updateCategoryweightAction에서 categoryName");
	System.out.println(categoryWeight + "<-- updateCategoryweightAction에서 categoryWeight");
	
	//수정메서드
	CategoryDao.updateCategoryWeight(categoryName, categoryWeight);
	
	//리스트로 리다이렉션
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
	
%>
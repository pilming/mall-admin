<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//deleteCategoryAction
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//값 수집
    request.setCharacterEncoding("utf-8"); //한글깨짐 방지 인코딩
	String categoryName = request.getParameter("categoryName");
	
	//디버깅
	System.out.println(categoryName + "<-- deleteCategoryAction.jsp에서 categoryName");
	
	//삭제실행
	CategoryDao.deleteCategory(categoryName);
	
	//categoryList로 리다이렉션
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
	
%>
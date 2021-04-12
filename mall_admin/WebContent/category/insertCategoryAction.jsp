<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="gdu.mall.vo.*" %>

<%
	//insertCategoryAction
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	// 1. 수집
	request.setCharacterEncoding("utf-8"); //한글깨짐 방지 인코딩
	String categoryName = request.getParameter("categoryName");
	int categoryWeight = Integer.parseInt(request.getParameter("categoryWeight")); 
	
	//수집된 값 디버깅
	System.out.println(categoryName+"<-- insertCategoryAction categoryName");
	System.out.println(categoryWeight+"<-- insertCategoryAction categoryWeight");
	
	// 중복된 카테고리가 있는지...null이면 사용가능 else 사용불가 -> 폼으로...
	String returnCategoryName = CategoryDao.selectCategoryName(categoryName);
	if(returnCategoryName != null) { //이미 아이디가 존재한다
		System.out.println("이미 존재하는 카테고리 입니다");
		response.sendRedirect(request.getContextPath()+"/category/insertCategoryForm.jsp");
		return;
	} else { //중복된 카테고리가 없음 등록 가능
		CategoryDao.insertCategory(categoryName, categoryWeight);
	}
	//categoryList로 리다이렉션
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>
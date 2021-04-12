<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
<%
	//매니저 레벨 검사
	Manager manager = (Manager)(session.getAttribute("sessionManager"));
	if(manager == null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if(manager.getManagerLevel() < 2) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	//레벨검사완료
	
	//managerList에서 넘겨준 no값 받아오기
	int managerNo = Integer.parseInt(request.getParameter("managerNo"));
	String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
	String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로
	
	//디버깅
	System.out.println(managerNo+"<--deleteManagerLevel.jsp 에서 managerNo");
	System.out.println(rowPerPage + "<-- deleteManagerLevel.jsp 에서 rowPerPage");
    System.out.println(currentPage + "<-- deleteManagerLevel.jsp 에서 currentPage");
	//dao 삭제 메소드 호출. 리턴값 0->일치하지 않으므로 삭제실패, 1->삭제성공
	int rowCnt = ManagerDao.deleteManager(managerNo);
	System.out.println(rowCnt+"=delete(1:삭제완료, 0:삭제실패)");
	response.sendRedirect(request.getContextPath()+"/manager/managerList.jsp?rowPerPage="+rowPerPage+"&currentPage="+currentPage);
%>
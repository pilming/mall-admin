<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//deleteClientAction
	//세션확인후 레벨에 해당하지않으면 adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//값 수집
	String clientMail = request.getParameter("clientMail");
	int currentPage =Integer.parseInt(request.getParameter("currentPage")) ;
	int rowPerPage =Integer.parseInt(request.getParameter("rowPerPage"));
	String searchWord =request.getParameter("searchWord");
	
	//값 디버깅
	System.out.println(clientMail + "<-- deleteClientAction.jsp에서 clientMail");
	System.out.println(currentPage + "<-- deleteClientAction.jsp에서 currentPage");
	System.out.println(rowPerPage + "<-- deleteClientAction.jsp에서 rowPerPage");
	System.out.println(searchWord + "<-- deleteClientAction.jsp에서 searchWord");
	
	//삭제 실행
	ClientDao.deleteClient(clientMail);
	
	// clientList.jsp로 리다이렉션
	if(searchWord != null) {
		response.sendRedirect(request.getContextPath()+"/client/clientList.jsp?currentPage="+currentPage+"&rowPerPage="+rowPerPage+"&searchWord=" + searchWord);

	} else {
		response.sendRedirect(request.getContextPath()+"/client/clientList.jsp?currentPage="+currentPage+"&rowPerPage="+rowPerPage);
	}
%>
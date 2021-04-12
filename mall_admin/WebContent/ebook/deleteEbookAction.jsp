<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	
	
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	//레벨검사 완료
	
	//deleteEbookAction.jsp
	//값 수집
	String ebookISBN = request.getParameter("ebookISBN");

	//값 디버깅
	System.out.println(ebookISBN + "<-- deleteEbookAction.jsp에서 ebookISBN");
	
	//삭제실행
	EbookDao.deleteEbook(ebookISBN);
	
	//리스트로 리다이렉션
	response.sendRedirect(request.getContextPath()+"/ebook/ebookList.jsp");
%>
    
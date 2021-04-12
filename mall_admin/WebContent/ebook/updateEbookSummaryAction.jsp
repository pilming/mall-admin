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
	
	
	//값수집
	request.setCharacterEncoding("utf-8");//한글깨짐방지 인코딩
	String ebookISBN = request.getParameter("ebookISBN");
	String newEbookSummary = request.getParameter("newEbookSummary");
	//값 디버깅
	System.out.println(ebookISBN + "<--- updateEbookSummaryAction.java에서 ebookISBN");
	System.out.println(newEbookSummary + "<--- updateEbookSummaryAction.java에서 newEbookSummary");
	
	//ebook객체 생성 (메서드에 사용하기위함)
	Ebook ebook = new Ebook();
	ebook.setEbookISBN(ebookISBN);
	ebook.setEbookSummary(newEbookSummary);
	
	//업데이트 실행
	EbookDao.updateEbookSummary(ebook);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/ebook/ebookOne.jsp?ebookISBN="+ebookISBN);

%>
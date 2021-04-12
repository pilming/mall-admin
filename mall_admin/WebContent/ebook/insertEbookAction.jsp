<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import = "gdu.mall.vo.*" %>
<%
	//관리자 인증
	
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	
	//값수집
	request.setCharacterEncoding("utf-8"); //한글깨짐 방지 인코딩
	
	String ebookISBN = request.getParameter("ebookISBN");
	if(EbookDao.checkISBN(ebookISBN) == 0) { //중복체크
		response.sendRedirect(request.getContextPath()+"/ebook/ebookList.jsp");
		System.out.println("이미 중복된 ebookISBN 입니다");
		return;
	}
	
	//여기까지 진행되면 중복없음.
	String categoryName = request.getParameter("categoryName");
	String ebookTitle = request.getParameter("ebookTitle");
	String ebookAuthor = request.getParameter("ebookAuthor");
	String ebookCompany = request.getParameter("ebookCompany");
	int ebookPageCount = Integer.parseInt(request.getParameter("ebookPageCount"));
	int ebookPrice = Integer.parseInt(request.getParameter("ebookPrice"));
	String ebookSummary = request.getParameter("ebookSummary");
	
	//디버깅 ->확인
	System.out.println(categoryName + "<--insertEbookAction.jsp 에서 categoryName");
	System.out.println(ebookISBN + "<--insertEbookAction.jsp 에서 ebookISBN");
	System.out.println(ebookTitle + "<--insertEbookAction.jsp 에서 ebookTitle");
	System.out.println(ebookAuthor + "<--insertEbookAction.jsp 에서 ebookAuthor");
	System.out.println(ebookCompany + "<--insertEbookAction.jsp 에서 ebookCompany");
	System.out.println(ebookPageCount + "<--insertEbookAction.jsp 에서 ebookPageCount");
	System.out.println(ebookPrice + "<--insertEbookAction.jsp 에서 ebookPrice");
	System.out.println(ebookSummary + "<--insertEbookAction.jsp 에서 ebookSummary");
	
	//전처리
	Ebook ebook = new Ebook();
	ebook.setCategoryName(categoryName);
	ebook.setEbookISBN(ebookISBN);
	ebook.setEbookTitle(ebookTitle);
	ebook.setEbookAuthor(ebookAuthor);
	ebook.setEbookCompany(ebookCompany);
	ebook.setEbookPageCount(ebookPageCount);
	ebook.setEbookPrice(ebookPrice);
	ebook.setEbookSummary(ebookSummary);
	
	//추가 실헹
	EbookDao.insertEbook(ebook);
	
	// ebookList.jsp로 리다이렉션
	response.sendRedirect(request.getContextPath()+"/ebook/ebookList.jsp");

%>
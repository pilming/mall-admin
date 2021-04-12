<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>

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
	
	
	/*
	String ebookISBN = request.getParameter("ebookISBN"); 이런식으로 하면 multipart/form-data를 받을수없음
	String ebookImg = request.getParameter("ebookImg");
	System.out.println(ebookISBN + "<--updateEbookImgAction.jsp 에서 ebookISBN");
	System.out.println(ebookImg + "<--updateEbookImgAction.jsp 에서 ebookImg");
	*/
	
	//넘겨받은 이미지 파일을 다운받을 위치 (img폴더)
	//String path = application.getRealPath("img");// img라는 폴더의 os상의 실제폴더위치를 알려줌
	String path = "C:/GOODEE/web/mall_admin/WebContent/img";
	System.out.println(path + "<--updateEbookImgAction.jsp 에서 path");
	
	int size = 1024 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8",new DefaultFileRenamePolicy());
	
	String ebookISBN = multi.getParameter("ebookISBN");
	String ebookImg = multi.getFilesystemName("ebookImg");
	System.out.println(ebookISBN + "<--updateEbookImgAction.jsp 에서 ebookISBN");
	System.out.println(ebookImg + "<--updateEbookImgAction.jsp 에서 ebookImg");
	
	Ebook ebook = new Ebook();
	ebook.setEbookISBN(ebookISBN);
	ebook.setEbookImg(ebookImg);
	EbookDao.updateEbookImg(ebook);
	
	response.sendRedirect(request.getContextPath()+"/ebook/ebookOne.jsp?ebookISBN="+ebookISBN);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//updateNoticeAction
	
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 2) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//여기까지 진행된다면 매니저 레벨검증 완료
	
	//값수집
	request.setCharacterEncoding("utf-8");//한글깨짐방지 인코딩
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
	String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로
	//값 디버 
    System.out.println(rowPerPage + "<-- updateNoticeAction.jsp 에서 rowPerPage");
    System.out.println(currentPage + "<-- updateNoticeAction.jsp 에서 currentPage");
	System.out.println(noticeNo + "<--- updateNoticeAction.java에서 noticeNo");
	System.out.println(noticeTitle + "<--- updateNoticeAction.java에서 noticeTitle");
	System.out.println(noticeContent + "<--- updateNoticeAction.java에서 noticeContent");
	
	//ebook객체 생성 (메서드에 사용하기위함)
	Notice notice = new Notice();
	notice.setNoticeNo(noticeNo);
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	
	//업데이트 실행
	NoticeDao.updateNotice(notice);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo="+noticeNo+"&rowPerPage="+rowPerPage+"&currentPage="+currentPage);
%>
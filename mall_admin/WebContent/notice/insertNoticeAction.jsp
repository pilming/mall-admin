<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//insertNoticeAction

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
	request.setCharacterEncoding("utf-8");
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	//값 디버깅
	System.out.println(noticeTitle + "<--insertNoticeAction.jsp 에서 noticeTitle");
	System.out.println(noticeContent + "<--insertNoticeAction.jsp 에서 noticeContent");
	
	//매개변수로 넘겨주기 위한 객체
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	notice.setManagerId(manager.getManagerId());
	
	//공지글 추가 실행
	NoticeDao.insertNotice(notice);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>
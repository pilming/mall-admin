<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//deleteNoticeAction
	
	//세션확인후 레벨에 해당하지않으면 /adminIndex.jsp로
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager ==null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if (manager.getManagerLevel() < 2) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	//여기까지 진행되면 레벨검사 완료
	
	//값수집
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
	String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로
	//값 디버깅
    System.out.println(rowPerPage + "<-- noticeOne.jsp 에서 rowPerPage");
    System.out.println(currentPage + "<-- noticeOne.jsp 에서 currentPage");
	System.out.println(noticeNo + "<--- deleteNoticeAction.jsp에서 noticeNo");
	
	//공지글에 댓글이 있는지 여부
	int rowCnt = CommentDao.selectCommentCnt(noticeNo);
	if (rowCnt != 0) {
		//리다이렉션
		System.out.println(noticeNo + "공지글의 댓글이"+rowCnt+"개 있습니다.");
		response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo="+noticeNo+"&rowPerPage="+rowPerPage+"&currentPage="+currentPage);
		return;
	}
	
	//삭제 메서드
	NoticeDao.deleteNotice(noticeNo);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCommentAction</title>
</head>
<body>
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
		//여기까지 진행되면 메니저 확인 끝
		
		
		//값수집
		request.setCharacterEncoding("utf-8");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String managerId = manager.getManagerId();	
		String noticeNo = request.getParameter("noticeNo");//페이지 유지위해 전달값으로만 쓰이므로 String으로
		String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
		String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로
		
		//값디버깅
		System.out.println(commentNo + "<-- deleteCommentAction.jsp 에서 commentNo");
		System.out.println(managerId + "<-- deleteCommentAction.jsp 에서 managerId");
		System.out.println(rowPerPage + "<-- deleteCommentAction.jsp 에서 rowPerPage");
	    System.out.println(currentPage + "<-- deleteCommentAction.jsp 에서 currentPage");
	    System.out.println(noticeNo + "<-- deleteCommentAction.jsp 에서 noticeNo");
	    
		if(manager.getManagerLevel() > 1) { //최고관리자면 그냥 삭제
			//삭제실행
			CommentDao.deleteComment(commentNo);
		} else if(manager.getManagerLevel() > 0) { //일반관리자이면 자신의 코멘트인지 확인필요
			//자신의 코멘트 삭제 실행
			CommentDao.deleteComment(commentNo, managerId);
		}
		
		//리다이렉션
		response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo="+noticeNo+"&rowPerPage="+rowPerPage+"&currentPage="+currentPage);
	
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertCommentAction</title>
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
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String managerId = manager.getManagerId();
		String commentContent = request.getParameter("commentContent");
		String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
		String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로

		//값디버깅
		System.out.println(noticeNo + "<-- insertCommentAction.jsp 에서 noticeNo");
		System.out.println(managerId + "<-- insertCommentAction.jsp 에서 managerId");
		System.out.println(commentContent + "<-- insertCommentAction.jsp 에서 commentContent");
		System.out.println(rowPerPage + "<-- insertCommentAction.jsp 에서 rowPerPage");
	    System.out.println(currentPage + "<-- insertCommentAction.jsp 에서 currentPage");
	    
		//새로운 객체 생성
		Comment comment = new Comment();
		
		comment.setNotice_no(noticeNo);
		comment.setManager_id(managerId);
		comment.setComment_content(commentContent);
		
		//댓글 추가
		CommentDao.insertComment(comment);
		
		//리다이렉션
		response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo="+noticeNo+"&rowPerPage="+rowPerPage+"&currentPage="+currentPage);
	
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
<%
	Manager manager = (Manager)(session.getAttribute("sessionManager"));
	if(manager == null) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if(manager.getManagerLevel() < 2) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//수정할 때 보낸 no, level 값 넘겨받기
	int managerNo = Integer.parseInt(request.getParameter("managerNo"));
	int managerLevel = Integer.parseInt(request.getParameter("managerLevel"));
	String rowPerPage = request.getParameter("rowPerPage"); //페이지 유지위해 전달값으로만 쓰이므로 String으로
	String currentPage = request.getParameter("currentPage");//페이지 유지위해 전달값으로만 쓰이므로 String으로
	
	//값 디버깅
    System.out.println(rowPerPage + "<-- updateManagerLevel.jsp 에서 rowPerPage");
    System.out.println(currentPage + "<-- updateManagerLevel.jsp 에서 currentPage");
	System.out.println(managerNo+"<--updateManagerLevel.jsp에서 managerNo");
	System.out.println(managerLevel+"<--updateManagerLevel.jsp에서 managerLevel");
	
	//dao 수정 메소드 호출. 받아온 값 넣어주기. 리턴값 0->수정실패 또는 1->수정완료
	int rowCnt = ManagerDao.updateManagerLevel(managerNo, managerLevel);
	
	//결과 내보내기
	System.out.println(rowCnt+"=update(1:수정완료, 0:수정실패)");
	System.out.printf("관리자 레벨 : %s", managerLevel);
	response.sendRedirect(request.getContextPath()+"/manager/managerList.jsp?rowPerPage="+rowPerPage+"&currentPage="+currentPage);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>GOODEE-BOOK</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="<%=request.getContextPath()%>/image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/wave/waves.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/notika-custom-icon.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<%
	//매니저 레벨 검사
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
    <!-- Start Header Top Area -->
    <div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="logo-area">
                    	<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/img/logo.png" style="width: 200px; height: 50px"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top Area -->
    <!-- Mobile Menu start -->
    <div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mobile-menu">
                        <nav id="dropdown">
                            <ul class="mobile-menu-nav">
                                <li><a href="<%=request.getContextPath()%>/index.jsp">운영자홈</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/manager/managerList.jsp">운영자관리</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/client/clientList.jsp">고객관리</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/category/categoryList.jsp">상품카테고리관리</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/ebook/ebookList.jsp">E-book관리</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/orders/ordersList.jsp">주문관리</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/notice/noticeList.jsp">공지관리</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu end -->
    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a  href="<%=request.getContextPath()%>/index.jsp"><i class="notika-icon notika-house"></i>운영자홈</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/manager/managerList.jsp"><i class="notika-icon notika-mail"></i> 운영자관리</a>
                        </li>
                        <li class="active"><a  href="<%=request.getContextPath()%>/client/clientList.jsp"><i class="notika-icon notika-edit"></i>고객관리</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/category/categoryList.jsp"><i class="notika-icon notika-bar-chart"></i>상품카테고리관리</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/ebook/ebookList.jsp"><i class="notika-icon notika-windows"></i>E-book관리</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/orders/ordersList.jsp"><i class="notika-icon notika-form"></i>주문관리</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/notice/noticeList.jsp"><i class="notika-icon notika-app"></i>공지관리</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->
 <%
 	//자료수집
 	//현재 페이지
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
       System.out.println(currentPage  + "<-- clientList.jsp에서 currentPage ");
	
	//페이지당 행의 수
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null) {
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	System.out.println(rowPerPage + "<-- clientList.jsp에서 rowPerPage");
	
	//검색어
	String searchWord= null;
	if(request.getParameter("searchWord") != null) {
		searchWord = request.getParameter("searchWord");
	}
	System.out.println(searchWord + "<-- clientList.jsp에서 searchWord");
	
	//시작 행
	int beginRow = (currentPage - 1) * rowPerPage;
	System.out.println(beginRow + "<-- clientList.jsp에서 beginRow");
	
	//보여줄 목록 가져오기
	ArrayList<Client> list = ClientDao.selectClientListByPage(rowPerPage, beginRow, searchWord);		
 %>
 	
	
    <!-- Normal Table area Start-->
    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list mg-t-30">
                        <div class="basic-tb-hd">
                            <h2>clientList</h2>
                        </div>
                        <!-- rowPerPage dropDown -->
					 	<form action="<%=request.getContextPath() %>/client/clientList.jsp" style="text-align: right;">
						<%
							if(searchWord != null) {
						%>
								<input type = "hidden" name="searchWord" value ="<%=searchWord%>">
						<%		
							}
						%>	
							
						
							<select name = "rowPerPage" style="width:80px;height:25px;">
								<%
									for(int i = 10; i <= 30; i += 5) {
										if(rowPerPage == i) {
								%>
											<option value ="<%=i%>" selected="selected"><%=i%>개씩</option>
								<%			
										} else {
								%>
											<option value ="<%=i%>"><%=i%>개씩</option>
								<%			
										}
									}
								%>
							</select>
							<button type="submit" class="btn btn-secondary">보기</button>
						</form>
                        <div class="bsc-tbl-cds">
                            <table class="table table-condensed">
                                <thead>
									<tr>
										<th>고객 E-mail</th>
										<th>생성일시</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
								<%
									for(Client c : list) {
								%>
										<tr>
											<td><%=c.getClientMail() %></td>
											<td><%=c.getClientDate().substring(0, 11) %></td>
						                    <td>
												<form action = "<%=request.getContextPath()%>/client/updateClientForm.jsp" method = "post">
													<input type = "hidden" name="clientMail" value ="<%=c.getClientMail()%>">
													<input type = "hidden" name="currentPage" value ="<%=currentPage%>">
													<input type = "hidden" name="rowPerPage" value ="<%=rowPerPage%>">
													<%
														if(searchWord != null) {
													%>
															<input type = "hidden" name="searchWord" value ="<%=searchWord%>">
													<%
														}
													%>
													<button type = "submit" class="btn btn-secondary">수정</button>
												</form>
											</td>
											<td>
												<form action = "<%=request.getContextPath()%>/client/deleteClientAction.jsp" method = "post">
													<input type = "hidden" name="clientMail" value ="<%=c.getClientMail()%>">
													<input type = "hidden" name="currentPage" value ="<%=currentPage%>">
													<input type = "hidden" name="rowPerPage" value ="<%=rowPerPage%>">
													<%
														if(searchWord != null) {
													%>
															<input type = "hidden" name="searchWord" value ="<%=searchWord%>">
													<%
														}
													%>
													<button type = "submit" class="btn btn-secondary">삭제</button>
												</form>
											</td>
										</tr>
								<%			
									}
								%>
								</tbody>
                            </table>
                            <!--검색폼-->
							<div style="text-align: center;">
								<form action = "<%=request.getContextPath()%>/client/clientList.jsp?" method="post">
									<input type="hidden" name = rowPerPage value ="<%=rowPerPage%>">
									<div>
										clientMail :
										<input type = "text" name = "searchWord">
										<button type = "submit" class="btn btn-secondary">검색</button>
									</div> 
								
								</form>
							</div>
							<div class="paging" style="text-align:center;">
								<ul class="pagination">
							<%
								int totalRow = 0;
								
								//마지막 페이지(나머지가 있으면 다 보여주기 위해서 올림계산)
								int lastPage = 0; 
	
								////페이징하기위한 범위
								int pageRange = 0;
								//검색어가 있을때와 없을때 페이징을 달리함.	
								if(request.getParameter("searchWord") != null) {//검색어가 있다면
									//전체 페이지
									totalRow = ClientDao.totalCount(searchWord);
									
									//마지막 페이지(나머지가 있으면 다 보여주기 위해서 올림계산)
									lastPage = (int)Math.ceil((double)totalRow /rowPerPage) ; 
									//디버깅
									System.out.println(lastPage + "<-- clientList.jsp에서 lastPage");
									////페이징하기위한 범위
									pageRange = (currentPage - 1) / 10;
									
									//페이지가 1일경우 이전버튼 생성안함
									if(currentPage > 1) { //페이지1이 아닐경우
										//rowPerPage로 받은값이 없을경우
										if(request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage - 1%>&searchWord=<%=searchWord%>">&lt;이전</a></li>	
							<%
						
										} else {////rowPerPage로 받은값이 있을경우 		
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage - 1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>">&lt;이전</a></li>
							<%
										}
									}
									for (int i = 1; i <= 10; i += 1) {
										if ((pageRange * 10) + i == lastPage + 1) {
											break;
										}
										//rowPerPage로 받은값이 없을경우
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=(pageRange*10)+i%>&searchWord=<%=searchWord%>"><%=(pageRange*10)+i%></a></li>
							<%		
										} else {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=(pageRange*10)+i%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><%=(pageRange*10)+i%></a></li>
							<%
										}	
										
									}
										//마지막페이지면 다음 안나오게하기
									if (currentPage < lastPage) {
										//rowPerPage로 받은값이 없을경우
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage + 1%>&searchWord=<%=searchWord%>">다음&gt;</a></li>
							<%
										} else { ////rowPerPage로 받은값이 있을경우 	
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage + 1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>">다음&gt;</a></li>
							<%
										}
									}
										
								}else {//검색어가 없다면
									//전체 페이지
									totalRow = ClientDao.totalCount(searchWord);
									
									//마지막 페이지(나머지가 있으면 다 보여주기 위해서 올림계산)
									lastPage = (int)Math.ceil((double)totalRow /rowPerPage) ; 
									//디버깅
									System.out.println(lastPage + "<-- clientList.jsp에서 lastPage");
									////페이징하기위한 범위
									pageRange = (currentPage - 1) / 10;
									
									//페이지가 1일경우 이전버튼 생성안함
									if(currentPage > 1) { //페이지1이 아닐경우
										//rowPerPage로 받은값이 없을경우
										if(request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage - 1%>">&lt;이전</a></li>
							<%
						
										} else {////rowPerPage로 받은값이 있을경우 		
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage - 1%>&rowPerPage=<%=rowPerPage%>">&lt;이전</a></li>
							<%
										}
									}
									
									for (int i = 1; i <= 10; i += 1) {
										if ((pageRange * 10) + i == lastPage + 1) {
											break;
										}
										//rowPerPage로 받은값이 없을경우
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=(pageRange*10)+i%>"><%=(pageRange*10)+i%></a></li>
							<%		
										} else {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=(pageRange*10)+i%>&rowPerPage=<%=rowPerPage%>"><%=(pageRange*10)+i%></a></li>
							<%
										}	
										
									}
										//마지막페이지면 다음 안나오게하기
									if (currentPage < lastPage) {
										//rowPerPage로 받은값이 없을경우
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage + 1%>">다음&gt;</a></li>
							<%
										} else { ////rowPerPage로 받은값이 있을경우 	
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage + 1%>&rowPerPage=<%=rowPerPage%>">다음&gt;</a></li>
							<%
										}
									}
								}
							%>
							</ul>
							</div>		
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Normal Table area End-->
    
    <!-- jquery
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>ㄹ
    <!-- scrollUp JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/counterup/jquery.counterup.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/counterup/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/sparkline/sparkline-active.js"></script>
    <!-- flot JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/js/flot/jquery.flot.resize.js"></script>
    <script src="<%=request.getContextPath()%>/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/knob/jquery.knob.js"></script>
    <script src="<%=request.getContextPath()%>/js/knob/jquery.appear.js"></script>
    <script src="<%=request.getContextPath()%>/js/knob/knob-active.js"></script>
    <!--  Chat JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/chat/jquery.chat.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/todo/jquery.todo.js"></script>
	<!--  wave JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/wave/waves.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/wave/wave-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
	<!-- tawk chat JS
		============================================ -->
</body>

</html>
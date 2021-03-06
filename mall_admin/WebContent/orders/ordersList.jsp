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
    <style type="text/css">
    	.paging {
    		text-align: center;
    	}
    </style>
</head>
<body>
<%
	//????????? ?????? ??????
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
                                <li><a href="<%=request.getContextPath()%>/index.jsp">????????????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/manager/managerList.jsp">???????????????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/client/clientList.jsp">????????????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/category/categoryList.jsp">????????????????????????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/ebook/ebookList.jsp">E-book??????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/orders/ordersList.jsp">????????????</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/notice/noticeList.jsp">????????????</a>
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
                        <li><a  href="<%=request.getContextPath()%>/index.jsp"><i class="notika-icon notika-house"></i>????????????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/manager/managerList.jsp"><i class="notika-icon notika-mail"></i> ???????????????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/client/clientList.jsp"><i class="notika-icon notika-edit"></i>????????????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/category/categoryList.jsp"><i class="notika-icon notika-bar-chart"></i>????????????????????????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/ebook/ebookList.jsp"><i class="notika-icon notika-windows"></i>E-book??????</a>
                        </li>
                        <li class="active"><a  href="<%=request.getContextPath()%>/orders/ordersList.jsp"><i class="notika-icon notika-form"></i>????????????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/notice/noticeList.jsp"><i class="notika-icon notika-app"></i>????????????</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->
 <%
 	//????????????
	//?????? ?????????
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
    System.out.println(currentPage  + "<-- ordersList.jsp?????? currentPage ");
	
	//???????????? ?????? ???
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null) {
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	System.out.println(rowPerPage + "<-- ordersList.jsp?????? rowPerPage");
	
	//?????? ???
	int beginRow = (currentPage - 1) * rowPerPage;
	System.out.println(beginRow + "<-- ordersList.jsp?????? beginRow");
	
	//????????? ????????? ????????????
	ArrayList<OrdersAndEbookAndClient> list = OrdersDao.selectOrdersListByPage(rowPerPage, beginRow);
	
	String[] ordersStateList = {"????????????", "????????????"};
 %>
 	
	
    <!-- Normal Table area Start-->
    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list mg-t-30">
                        <div class="basic-tb-hd">
                            <h2>orderList</h2>
                        </div>
                        <div class="bsc-tbl-cds">
                            <table class="table table-condensed">
                                <thead>
									<tr>
										<th>??????<br>??????</th>
										<th>??????<br>??????</th>
										<th>?????? E-mail</th>
										<th>E-book<br>??????</th>
										<th>E-book??????</th>
										<th>????????????</th>
										<th>????????????</th>
										<th>???????????? ??????</th>		
									<tr>
								</thead>
								<tbody>
								<%
									for(OrdersAndEbookAndClient oec : list) {
									%>
										<tr>
											<td><%=oec.getOrders().getOrdersNo() %></td>
											<td><%=oec.getOrders().getClientNo() %></td>
											<td><%=oec.getClient().getClientMail() %></td>
											<td><%=oec.getOrders().getEbookNo() %></td>
										<%
											String ebookISBN = EbookDao.matchEbookISBN(oec.getOrders().getEbookNo());
										%>
											<td>
												<a href ="<%=request.getContextPath()%>/ebook/ebookOne.jsp?ebookISBN=<%=ebookISBN%>"><%=oec.getEbook().getEbookTitle() %></a>
											</td>
											<td><%=oec.getOrders().getOrdersDate() %></td>
											<!-- ???????????? ???????????? ??? -->
											<form action ="<%=request.getContextPath()%>/orders/updateOrdersStateAction.jsp" method="post">
												<td>
													<input type= "hidden" value = "<%=oec.getOrders().getOrdersNo() %>" name = "ordersNo">
													<input type= "hidden" value = "<%=rowPerPage%>" name = "rowPerPage">
													<input type= "hidden" value = "<%=currentPage%>" name = "currentPage">
													<select name = "ordersState" style="width:80px;height:30px;">
													<%
														for(int i = 0; i < ordersStateList.length; i++) {
															if(ordersStateList[i].equals(oec.getOrders().getOrdersState())) {
															%>
																<option value="<%=ordersStateList[i]%>" selected = "selected"><%=ordersStateList[i]%></option>
															<%
															} else {
															%>
																<option value="<%=ordersStateList[i]%>"><%=ordersStateList[i]%></option>
															<%
															}
														}
													%>
													</select>
												</td>							
												<td>
													<button type="submit" class="btn btn-secondary">???????????? ??????</button>
												</td>
											</form>	
										</tr>
									<%	
									}
								%>
								</tbody>
                            </table>
							<div class="paging">
								<ul class="pagination">
							<%
									//?????? ?????????
									int totalRow = 0;
		
									//????????? ?????????(???????????? ????????? ??? ???????????? ????????? ????????????)
									int lastPage = 0; 
							
									////????????????????????? ??????
									int pageRange = 0;
									
									//?????? ?????????
									totalRow = OrdersDao.totalCount();
									
									//????????? ?????????(???????????? ????????? ??? ???????????? ????????? ????????????)
									lastPage = (int)Math.ceil((double)totalRow /rowPerPage) ; 
									//?????????
									System.out.println(lastPage + "<-- ordersList.jsp?????? lastPage");
									////????????????????????? ??????
									pageRange = (currentPage - 1) / 10;
									
									//???????????? 1????????? ???????????? ????????????
									if(currentPage > 1) { //?????????1??? ????????????
										//rowPerPage??? ???????????? ????????????
										if(request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=currentPage - 1%>">&lt;??????</a></li>		
							<%

										} else {////rowPerPage??? ???????????? ???????????? 		
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=currentPage - 1%>&rowPerPage=<%=rowPerPage%>"><button type="button">&lt;??????</a></li>???</button></a>	
							<%
										}
									}
									
									for (int i = 1; i <= 10; i += 1) {
										if ((pageRange * 10) + i == lastPage + 1) {
											break;
										}
										//rowPerPage??? ???????????? ????????????
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=(pageRange*10)+i%>"><%=(pageRange*10)+i%></a></li>
							<%		
										} else {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=(pageRange*10)+i%>&rowPerPage=<%=rowPerPage%>"><%=(pageRange*10)+i%></a></li>
							<%
										}	
										
									}
										//????????????????????? ?????? ??????????????????
									if (currentPage < lastPage) {
										//rowPerPage??? ???????????? ????????????
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=currentPage + 1%>">??????&gt;</a></li>
							<%
										} else { ////rowPerPage??? ???????????? ???????????? 	
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp?currentPage=<%=currentPage + 1%>&rowPerPage=<%=rowPerPage%>">??????&gt;</a></li>

							<%
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
    <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>???
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
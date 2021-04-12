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
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="<%=request.getContextPath()%>/image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <!-- Bootstrap CSS
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
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- jvectormap CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jvectormap/jquery-jvectormap-2.0.3.css">
    <!-- notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/notika-custom-icon.css">
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/wave/waves.min.css">
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
    <script src="<%=request.getContextPath()%>/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<%
	if(session.getAttribute("sessionManager") == null) { //로그인 전
%>
		<div class="container">
				<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Manager Page</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(images/bg-1.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
							<div class="d-flex">
								<div class="w-100">
									<h3 class="mb-4">Login</h3>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/manager/loginManagerAction.jsp" method="post" class="signin-form">
								<div class="form-group mt-3">
									<input type="text" class="form-control" name = "managerId" required> <label class="form-control-placeholder" for="username">Username</label>
								</div>
								<div class="form-group">
									<input id="password-field" type="password" name = "managerPw" class="form-control"required> <label class="form-control-placeholder" for="password">Password</label> 
									<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
								<div class="form-group">
									<button type="submit"class="form-control btn btn-primary rounded submit px-3">Login</button>
								</div>
								<div class="form-group d-md-flex">
							</form>
							<p class="text-center">
								아이디가 없으십니까? <a href="<%=request.getContextPath()%>/manager/insertManagerForm.jsp">Manager가입</a>
							</p>
						</div>
						<h5 class="mb-4">승인대기중인 매니저 목록</h3>
						<table class = "table table-bordered">
							<thead>
								<tr>
									<th>managerId</th>
									<th>singUpDate</th>
								</tr>
							</thead>
							<tbody>
				<%		
								ArrayList<Manager> list = ManagerDao.selectManagerListByZero();		
								for(Manager m : list) {
				%>
									<tr>
										<td><%=m.getManagerId() %></td>
										<td><%=m.getManagerDate().substring(0,10)%></td>
									</tr>
				<%
								}
				%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>	

<%
	} else {
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
	                        <li class="active"><a  href="<%=request.getContextPath()%>/index.jsp"><i class="notika-icon notika-house"></i>운영자홈</a>
	                        </li>
	                        <li><a  href="<%=request.getContextPath()%>/manager/managerList.jsp"><i class="notika-icon notika-mail"></i> 운영자관리</a>
	                        </li>
	                        <li><a  href="<%=request.getContextPath()%>/client/clientList.jsp"><i class="notika-icon notika-edit"></i>고객관리</a>
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
	 	//데이터 가져오기
		Manager manager = (Manager)(session.getAttribute("sessionManager"));
		ArrayList<Notice> noticeList = NoticeDao.selectNotice(5, 0);
		ArrayList<Manager> managerList = ManagerDao.selectManagerList(5,0);
		ArrayList<Client> clientList = ClientDao.selectClientListByPage(5, 0, "");
		ArrayList<Ebook> ebookList = EbookDao.selectEbook(5, 0, null);
		ArrayList<OrdersAndEbookAndClient> oecList = OrdersDao.selectOrdersListByPage(5, 0);
	 %>
	    
	    
	    
	    <!-- Start Status area -->
	    <div style="text-align: center;">
			<h3>
				<%=manager.getManagerName()%>님 반갑습니다.
				레벨 : <%=manager.getManagerLevel()%>
				<a href="<%=request.getContextPath()%>/manager/logoutManagerAction.jsp">로그아웃</a>
			</h3>
		</div>
	    <div class="notika-status-area">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
	                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
	                        <div class="managerCount">
	                            <h2><%=ManagerDao.totalCount() %>명</h2>
	                            <p>승인대기매니저</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
	                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
	                        <div class="clientCount">
	                            <h2><%=ClientDao.totalCount(null) %>명</h2>
	                            <p>고객수</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
	                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
	                        <div class="ebookCount">
	                            <h2><%=EbookDao.totalCount(null) %>권</h2>
	                            <p>E-book수</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
	                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
	                        <div class="orderCount">
	                            <h2><%=OrdersDao.totalCount()%>건</h2>
	                            <p>누적주문수</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Status area-->
	    <!-- Start Sale Statistic area-->
	    <div class="sale-statistic-area">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12 col-md-10 col-sm-8 col-xs-12">
	                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
	                        <div class="normal-table-list mg-t-30">
		                        <div class="basic-tb-hd">
		                            <h2>orderList</h2>
		                            <a href = "<%=request.getContextPath()%>/orders/ordersList.jsp">more</a>
		                        </div>
		                        <div class="bsc-tbl-cds">
		                            <table class="table table-condensed">
		                                <thead>
					    				<tr>
											<td>주문번호</td>
											<td>고객번호</td>
											<td>고객 E-mail</td>
											<td>E-book번호</td>
											<td>E-book제목</td>
											<td>주문일시</td>
											<td>주문상태</td>	
										</tr>                
					                </thead>
					                <tbody>
									<%
										for(OrdersAndEbookAndClient oec : oecList) {
										%>
											<tr>
												<td><%=oec.getOrders().getOrdersNo() %></td>
												<td><%=oec.getOrders().getClientNo() %></td>
												<td><%=oec.getClient().getClientMail() %></td>
												<td><%=oec.getOrders().getEbookNo() %></td>
												<td><%=oec.getEbook().getEbookTitle() %></td>
												<td><%=oec.getOrders().getOrdersDate() %></td>
												<td><%=oec.getOrders().getOrdersState() %></td>
											</tr>
										<%	
										}
									%>
									</tbody>
		                            </table>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="sale-statistic-area">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
	                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
	                        <div class="normal-table-list mg-t-30">
		                        <div class="basic-tb-hd">
		                            <h2>ebookList</h2>
		                            <a href = "<%=request.getContextPath()%>/ebook/ebookList.jsp">more</a>
		                        </div>
		                        <div class="bsc-tbl-cds">
		                            <table class="table table-condensed">
		                                <thead>
					    				<tr>
											<th>categoryName</th>
											<th>ebookISBN</th>
											<th>ebookTitle</th>
											<th>ebookAuthor</th>
											<th>ebookDate</th>
											<th>ebookPrice</th>
										</tr>                
					                </thead>
					                <tbody>
									<%
										for(Ebook e : ebookList) {
									%>
											<tr>
												<td><%=e.getCategoryName() %></td>
												<%System.out.println("############"+ e.getCategoryName()); %>
												<td><%=e.getEbookISBN() %></td>
												<td><%=e.getEbookTitle() %></td>
												<td><%=e.getEbookAuthor() %></td>
												<td><%=e.getEbookDate() %></td>
												<td><%=e.getEbookPrice() %></td>
											</tr>
									<%
										}
									%>
									</tbody>
		                            </table>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-8 col-sm-7 col-xs-12">
	                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
	                        <div class="normal-table-list mg-t-30">
		                        <div class="basic-tb-hd">
		                            <h2>clientList</h2>
		                            <a href = "<%=request.getContextPath()%>/client/clientList.jsp">more</a>
		                        </div>
		                        <div class="bsc-tbl-cds">
		                            <table class="table table-condensed">
		                                <thead>
					    				<tr>
											<th>고객 E-mail</th>
											<th>생성일시</th>
										</tr>              
					                </thead>
					                <tbody>
									<%
										for(Client c : clientList) {
									%>
											<tr>
												<td><%=c.getClientMail() %></td>
												<td><%=c.getClientDate().substring(0, 11) %></td>
											</tr>
									<%			
										}
									%>
									</tbody>
		                            </table>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Sale Statistic area-->
	    <div class="sale-statistic-area">
	        <div class="container">
	            <div class="row">
	            	<div class="col-lg-6 col-md-8 col-sm-7 col-xs-12">
	                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
	                        <div class="normal-table-list mg-t-30">
		                        <div class="basic-tb-hd">
		                            <h2>noticeList</h2>
		                            <a href = "<%=request.getContextPath()%>/notice/noticeList.jsp">more</a>
		                        </div>
		                        <div class="bsc-tbl-cds">
		                            <table class="table table-condensed">
		                                <thead>
					    				<tr>
											<th>noticeNo</th>
											<th>noticeTitle</th>
											<th>managerId</th>
											<th>noticeDate</th>
										</tr>                
					                </thead>
					                <tbody>
									<%
										for(Notice n : noticeList) {
									%>
											<tr>
												<td><%=n.getNoticeNo()%></td>
												<td><%=n.getNoticeTitle()%></td>
												<td><%=n.getManagerId() %></td>
												<td><%=n.getNoticeDate() %></td>
											</tr>
									<%
										}
									%>
									</tbody>
		                            </table>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-8 col-sm-7 col-xs-12">
	                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
	                        <div class="normal-table-list mg-t-30">
		                        <div class="basic-tb-hd">
		                            <h2>managerList</h2>
		                            <a href = "<%=request.getContextPath()%>/manager/managerList.jsp">more</a>
		                        </div>
		                        <div class="bsc-tbl-cds">
		                            <table class="table table-condensed">
		                                <thead>
					    				<tr>
											<th>managerNo</th>
											<th>managerId</th>
											<th>managerName</th>
											<th>managerDate</th>
											<th>managerLevel</th>
										</tr>                
					                </thead>
					                <tbody>
									<%
										for(Manager m : managerList) {
									%>
											<tr>
												<td><%=m.getManagerNo()%></td>
												<td><%=m.getManagerId()%></td>
												<td><%=m.getManagerName()%></td>
												<td><%=m.getManagerDate()%></td>
												<td><%=m.getManagerLevel()%></td>
											<tr>
									<%		
										}
									%>
									</tbody>
		                            </table>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	
	            </div>
	        </div>
	    </div>
<%
	}
%>

    
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
    <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
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
    <!-- jvectormap JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="<%=request.getContextPath()%>/js/jvectormap/jvectormap-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/sparkline/sparkline-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/js/flot/jquery.flot.resize.js"></script>
    <script src="<%=request.getContextPath()%>/js/flot/curvedLines.js"></script>
    <script src="<%=request.getContextPath()%>/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/knob/jquery.knob.js"></script>
    <script src="<%=request.getContextPath()%>/js/knob/jquery.appear.js"></script>
    <script src="<%=request.getContextPath()%>/js/knob/knob-active.js"></script>
    <!--  wave JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/wave/waves.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/wave/wave-active.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/todo/jquery.todo.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<!--  Chat JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/chat/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/chat/jquery.chat.js"></script>
    <!-- main JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
	<!-- tawk chat JS
		============================================ -->
</body>

</html>
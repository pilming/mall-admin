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
                        <li class="active"><a  href="<%=request.getContextPath()%>/ebook/ebookList.jsp"><i class="notika-icon notika-windows"></i>E-book??????</a>
                        </li>
                        <li><a  href="<%=request.getContextPath()%>/orders/ordersList.jsp"><i class="notika-icon notika-form"></i>????????????</a>
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
		//??? ??????
		String ebookISBN = request.getParameter("ebookISBN");
		//??? ?????????
		System.out.println(ebookISBN + "<---ebookOne.jsp ?????? ebookISBN");
		
		//????????? ????????????
		Ebook ebookOne = EbookDao.selectEbookOne(ebookISBN);
		
		//???????????? ????????? ????????????
		ArrayList<String> categoryNameList = CategoryDao.categoryNameList();
		
		String[] ebookStateList = {"?????????", "??????", "??????", "????????????"};
	%> 
    
    <!-- Normal Table area Start-->
    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list mg-t-30">
                        <div class="basic-tb-hd">
                            <h2>EbookOne</h2>
                        </div>
                        <div class="bsc-tbl-cds">
                        	<form action="<%=request.getContextPath()%>/ebook/updateEbookStateAction.jsp" method="post">
                            <table class="table table-condensed">
                                <tr>
									<td>ebookNo</td>
									<td><%=ebookOne.getEbookNo() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookISBN</td>
									<td><%=ebookOne.getEbookISBN() %></td>
									<td></td>
								</tr>
								<tr>
									<td>categoryName</td>
									<td><%=ebookOne.getCategoryName() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookTitle</td>
									<td><%=ebookOne.getEbookTitle() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookAuthor</td>
									<td><%=ebookOne.getEbookAuthor() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookCompany</td>
									<td><%=ebookOne.getEbookCompany() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookPageCount</td>
									<td><%=ebookOne.getEbookPageCount() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookPrice</td>
									<td><%=ebookOne.getEbookPrice() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookImg</td>
									<td>
										<img src="<%=request.getContextPath()%>/img/<%=ebookOne.getEbookImg() %>" style="width: 500px; height: 500px;">
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/ebook/updateEbookImgForm.jsp?ebookISBN=<%=ebookOne.getEbookISBN()%>">
											<button type="button" class = "btn btn-secondary">????????? ??????</button>
										</a>
									</td>
								</tr>
								<tr>
									<td>ebookSummary</td>
									<td><%=ebookOne.getEbookSummary()%></td>
									<td>
										<a href="<%=request.getContextPath()%>/ebook/updateEbookSummaryForm.jsp?ebookISBN=<%=ebookOne.getEbookISBN()%>">
											<button type="button" class = "btn btn-secondary">????????? ??????</button>
										</a>
									</td>
								</tr>
								<tr>
									<td>ebookDate</td>
									<td><%=ebookOne.getEbookDate() %></td>
									<td></td>
								</tr>
								<tr>
									<td>ebookState</td>
									<td><%=ebookOne.getEbookState() %></td>
									<td>
										<input type = "hidden" name = "ebookISBN" value = "<%=ebookISBN%>">
										<select name="ebookState" style="width:100px;height:27px;">
											<%
												for(int i = 0; i < ebookStateList.length; i++) {
													if(ebookStateList[i].equals(ebookOne.getEbookState())) {
											%>
														<option value="<%=ebookStateList[i]%>" selected = "selected"><%=ebookStateList[i]%></option>
											<%			
													} else {
											%>
														<option value="<%=ebookStateList[i]%>"><%=ebookStateList[i]%></option>
											<%
													}
											
												}
											%>
										</select>
									</td>
								</tr>
                            </table>
                       		<div style="text-align: center;">
								<button type="submit" class = "btn btn-secondary">????????????</button>
							</div>
						</form>
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
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
    	ul li {
    		float: left;
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
 	//????????????
 	//???????????? ??????
	String categoryName =null;
	if(request.getParameter("categoryName") != null) {
		categoryName = request.getParameter("categoryName");
	}
		
	//?????? ?????????
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println(currentPage  + "<-- ebookList.jsp?????? currentPage ");
	
	//???????????? ?????? ???
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null) {
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	System.out.println(rowPerPage + "<-- ebookList.jsp?????? rowPerPage");
	
	
	//?????? ???
	int beginRow = (currentPage - 1) * rowPerPage;
	System.out.println(beginRow + "<-- ebookList.jsp?????? beginRow");
	
	//????????? ???????????? ?????? ????????????
	ArrayList<Ebook> ebookList = EbookDao.selectEbook(rowPerPage, beginRow, categoryName);
	
	//???????????? ?????? ????????????
	ArrayList<String> categoryNameList = CategoryDao.categoryNameList();
 %>
 	
	
    <!-- Normal Table area Start-->
    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list mg-t-30">
                        <div class="basic-tb-hd">
                            <h2>ebookList</h2>
                        </div>
                        <!-- ???????????? -->
					 	<ul class="nav">
							<li class="nav-item">
								<a class="nav-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp">????????????</a>
							</li>
						<%
							for(String c : categoryNameList) {
						%>
								<li class="nav-item">
									<a class="nav-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?categoryName=<%=c%>"><%=c%></a>
								</li>
						<%
							}
						%>
						</ul>
						<form action="<%=request.getContextPath() %>/ebook/ebookList.jsp" style="text-align: right;">
						<%
							if(categoryName != null) { //????????? ??????????????? ????????? ????????????????????? ?????????
						%>
								<input type = "hidden" name = "categoryName" value = "<%=categoryName%>">
						<%		
							}
						%>
							<select name = "rowPerPage" style="width:80px;height:25px;">
								<%
									for(int i = 10; i <= 30; i += 5) {
										if(rowPerPage == i) {
								%>
											<option value ="<%=i%>" selected="selected"><%=i%>??????</option>
								<%			
										} else {
								%>
											<option value ="<%=i%>"><%=i%>??????</option>
								<%			
										}
									}
								%>
							</select>
							<button type="submit" class="btn btn-secondary">??????</button>
						</form>
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
											<td><%=e.getEbookISBN() %></td>
											<!-- ????????? ????????? ???????????? ????????? -->
											<td><a href = "<%=request.getContextPath()%>/ebook/ebookOne.jsp?ebookISBN=<%=e.getEbookISBN()%>"><%=e.getEbookTitle() %></a></td>
											<td><%=e.getEbookAuthor() %></td>
											<td><%=e.getEbookDate() %></td>
											<td><%=e.getEbookPrice() %></td>
										</tr>
								<%
									}
								%>
								</tbody>
                            </table>
							<!-- rowPerPage??? ????????? -->
							<%
								////////?????????	
								
								//?????? ?????????
								int totalRow = 0;
								
								//????????? ?????????(???????????? ????????? ??? ???????????? ????????? ????????????)
								int lastPage = 0; 
						
								////????????????????????? ??????
								int pageRange = 0;
								
							%>
								<div style="text-align: center;">
								<ul class="pagination">
							<%
								
								if(categoryName != null) { //????????? ??????????????? ?????????
									//?????? ?????????
									totalRow = EbookDao.totalCount(categoryName);
								
									//????????? ?????????(???????????? ????????? ??? ???????????? ????????? ????????????)
									lastPage = (int)Math.ceil((double)totalRow /rowPerPage) ; 
									//?????????
									
									System.out.println(lastPage + "<-- ebookList.jsp?????? lastPage");
									////????????????????????? ??????
									pageRange = (currentPage - 1) / 10;
							
									//???????????? 1????????? ???????????? ????????????
									if(currentPage > 1) { //?????????1??? ????????????
										//rowPerPage??? ???????????? ????????????
										if(request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage - 1%>&categoryName=<%=categoryName%>">&lt;??????</a></li>					
							<%
						
										} else {////rowPerPage??? ???????????? ???????????? 		
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage - 1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>">&lt;??????</a></li>	
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
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=(pageRange*10)+i%>&categoryName=<%=categoryName%>"><%=(pageRange*10)+i%></a></li>
							<%		
										} else {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=(pageRange*10)+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>"><%=(pageRange*10)+i%></a></li>
							<%
										}	
										
									}
										//????????????????????? ?????? ??????????????????
									if (currentPage < lastPage) {
										//rowPerPage??? ???????????? ????????????
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage + 1%>&categoryName=<%=categoryName%>">??????&gt;</a></li>
							<%
										} else { ////rowPerPage??? ???????????? ???????????? 	
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage + 1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>">??????&gt;</a></li>
							<%
										}
									}		
									
								} else { //????????? ??????????????? ?????????
									//?????? ?????????
									totalRow = ClientDao.totalCount(categoryName);
									
									//????????? ?????????(???????????? ????????? ??? ???????????? ????????? ????????????)
									lastPage = (int)Math.ceil((double)totalRow /rowPerPage) ; 
									//?????????
									System.out.println(lastPage + "<-- ebookList.jsp?????? lastPage");
									////????????????????????? ??????
									pageRange = (currentPage - 1) / 10;
									
									//???????????? 1????????? ???????????? ????????????
									if(currentPage > 1) { //?????????1??? ????????????
										//rowPerPage??? ???????????? ????????????
										if(request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage - 1%>">&lt;??????</a></li>
							<%
						
										} else {////rowPerPage??? ???????????? ???????????? 		
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage - 1%>&rowPerPage=<%=rowPerPage%>">&lt;??????</a></li>
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
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=(pageRange*10)+i%>"><%=(pageRange*10)+i%></a></li>
							<%		
										} else {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=(pageRange*10)+i%>&rowPerPage=<%=rowPerPage%>"><%=(pageRange*10)+i%></a></li>
							<%
										}	
										
									}
										//????????????????????? ?????? ??????????????????
									if (currentPage < lastPage) {
										//rowPerPage??? ???????????? ????????????
										if (request.getParameter("rowPerPage") == null) {
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage + 1%>">??????&gt;</a></li>
							<%
										} else { ////rowPerPage??? ???????????? ???????????? 	
							%>
											<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp?currentPage=<%=currentPage + 1%>&rowPerPage=<%=rowPerPage%>">??????&gt;</a></li>
							<%
										}
									}			
								}
							%>	
							</ul>
							</div>
							<div style="text-align: right;">
								<a href="<%=request.getContextPath()%>/ebook/insertEbookForm.jsp"><button type="button" class="btn btn-secondary">Ebook??????</button></a>
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
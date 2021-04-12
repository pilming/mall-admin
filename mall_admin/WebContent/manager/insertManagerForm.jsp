<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
   <!-- Required meta tags-->
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Colorlib Templates">
   <meta name="author" content="Colorlib">
   <meta name="keywords" content="Colorlib Templates">

   <!-- Title Page-->
   <title>GOODEE-BOOK</title>
   <!-- Icons font CSS-->
   <link href="<%=request.getContextPath()%>/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
   <link href="<%=request.getContextPath()%>/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
   <!-- Font special for pages-->
   <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
   <!-- Vendor CSS-->
   <link href="<%=request.getContextPath()%>/vendor/select2/select2.min.css" rel="stylesheet" media="all">
   <link href="<%=request.getContextPath()%>/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
   <!-- Main CSS-->
   <link href="<%=request.getContextPath()%>/css/main2.css" rel="stylesheet" media="all">
</head>
<body>
    <div class="page-wrapper bg-color p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Manager SingUp</h2>
                    <form action="<%=request.getContextPath()%>/manager/insertManagerAction.jsp" method="POST">
                        <div class="input-group">
                            <input class="input--style-1" type="text" placeholder="ID" name="managerId">
                        </div>
                        <div class="input-group">
                            <input class="input--style-1" type="password" placeholder="PASSWORD" name="managerPw">
                        </div>
                        <div class="input-group">
                            <input class="input--style-1" type="text" placeholder="NAME" name="managerName">
                        </div>
                        <div class="p-t-20">
                            <button class="btn btn--radius btn--green" type="submit">가입신청</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datepicker/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="<%=request.getContextPath()%>/js/global.js"></script>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- MENU SIDEBAR-->
<!--     <body class="animsition"> -->
<!--     <div class="page-wrapper"> -->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="<c:url value='/Home/ToHomePage.hst'/>">
                    <img src="<c:url value="/images/logo1.png"/>" alt="홈스피탈" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="<c:url value='/Admin/Index.hst'/>">
                                <i class="fas fa-tachometer-alt"></i>개요</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Chart.hst'/>">
                                <i class="fas fa-chart-bar"></i>통계</a>
                        </li>
                         <li>
                            <a href="<c:url value='/Admin/HosAuth.hst'/>">
                                <i class="fas fa-table"></i>병원 제휴 관리</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Accounts.hst'/>">
                                <i class="fas fa-table"></i>회원 관리</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Appointment.hst'/>">
                                <i class="fas fa-table"></i>예약 관리</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Corona_Map.hst'/>">
                                <i class="fas fa-map-marker-alt"></i>확진자 동선</a>
                        </li>
                      
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

    
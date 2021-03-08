9<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	
body{
	padding-top: 100px;
}


</style>

<div class="container" id="container">
	<div class="form-container sign-in-container">
			<h1>의약품</h1>
			<span>${medi_name}</span>
			<h1>기간</h1>
			<span>${duration}일</span>
			<h1>조제일</h1>
			<span>${pres_date}</span>
			<h1>병원</h1>
			<span>${hospital}</span>
			<h1>복용횟수</h1>
			<span>${count}</span>
	</div>
</div>


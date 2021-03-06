<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Homespital_Admin</title>
	<meta name="description" content="">
	<meta name="author" content="">
	
  </head>

  <body>
  
	<!-- top부분 -->
	<tiles:insertAttribute name="top"/>
	
	<!-- sidebar부분 -->
	<tiles:insertAttribute name="sidebar"/>
	
    <!-- body부분 --> 
    <tiles:insertAttribute name="body"/> 
    
    <!-- footer부분 -->
    <tiles:insertAttribute name="footer"/>  
    
  </body>
  
</html>
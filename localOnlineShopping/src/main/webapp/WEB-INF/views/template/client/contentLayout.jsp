<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<head>
	
	  	<!-- Bootstrap core CSS -->
	    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

	    <!-- Custom styles for this template -->
	    <link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="/resources/include/dist/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</head>
  <title><tiles:getAsString name="title" /></title>
	<div id="header">
	<tiles:insertAttribute name="header" />
	</div>
	
	
	<div id="content">
	<tiles:insertAttribute name="body" />
	</div>
	
	<div id="footer">
	<tiles:insertAttribute name="footer" />
	</div>
    
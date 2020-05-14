<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<title><tiles:getAsString name="title" /></title>
	<div id="header">
	<tiles:insertAttribute name="header" />
	</div>
	
	<div id="content">
	<tiles:insertAttribute name="content" />
	</div>
	
	<div id="footer">
	<tiles:insertAttribute name="footer" />
	</div>


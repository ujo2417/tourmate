<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title><tiles:getAsString name="title" /></title>
    </head>
    <body>

 	<div class="header"><tiles:insertAttribute name="header"/></div>
	<div class=""><tiles:insertAttribute name="center"/></div>
	<div class="footer"><tiles:insertAttribute name="footer"/></div>


    </body>
</html>
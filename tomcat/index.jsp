<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index Page </title>
</head>

<%
        Integer ival = (Integer)session.getAttribute("_session_counter");
        if(ival==null) {
		ival = new Integer(1);
	} else {
		ival = new Integer(ival.intValue() + 1);
	}

	session.setAttribute("_session_counter", ival);

	Date date = new Date();
%>
<body>

<h2>Session Information</h2>
Session Count: <%= ival %> <br>
Session ID: <%= request.getRequestedSessionId() %> <br>
Data : <%=date.toString() %> <p/>

<h2>Header Information</h2>
	<%
		Enumeration headerenum = request.getHeaderNames();
		while(headerenum.hasMoreElements()){
			String headerName = (String)headerenum.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%= headerName %> = <%= headerValue %> <br />
	<%
		}
	%>

<h2>Attribute Information</h2>
	<%
		headerenum = request.getAttributeNames();
		while(headerenum.hasMoreElements()){
			String headerName = (String)headerenum.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%= headerName %> = <%= headerValue %> <br />
	<%
		}
	%>

<h2>Server Information</h2>
Server Info: <%=application.getServerInfo() %> <br>
</body>
</html>

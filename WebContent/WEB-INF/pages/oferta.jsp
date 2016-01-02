<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<title>Polisafe - Dodawanie użytkownika</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/navbar.css" />" type="text/css"
	rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form-elements.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form.css" />" type="text/css"
	rel="stylesheet">
<link href="<c:url value="/bootstrap/css/checkbox.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/well.css" />" type="text/css"
	rel="stylesheet">

<script src="<c:url value="/bootstrap/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/jquery.backstretch.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/scripts.js" />"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

</head>
<body>
	<div class="row text-center">
		<h1>Oferta towarzystwa ${oferta.towarzystwo}</h1>
	</div>

	<hr>
</body>
</html>
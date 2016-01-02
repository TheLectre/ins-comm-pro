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

<script src="<c:url value="/bootstrap/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/jquery.backstretch.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/scripts.js" />"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

</head>
<body>
	<form action="<c:url value="/logout" />" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<!-- logout function -->
	<script>
		function logoutSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<nav class="navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="<c:url value="/home" />">Strona
					główna</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">

				<ul class="nav navbar-nav">
					<li><a href="#">Link1</a></li>
					<li><a href="#">Link2</a></li>
					<li><a href="#">Link3</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">

					<li><a href="<c:url value="/change-password" />"><span
							class="glyphicon glyphicon-wrench"></span>Zmień hasło</a></li>

					<li><a href="javascript:logoutSubmit()"><span
							class="glyphicon glyphicon-log-in"></span> Wyloguj</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row text-center">
			<h1>Opis produktów</h1>
		</div>
		
		<hr>
		
		<c:if test="${result == 'success'}">
			<div class="row text-center">
				<div class="alert alert-success">
					<strong>Sukces!</strong> Pomyślnie dokonano zmian.
				</div>
				<hr>
			</div>
		</c:if>
		
		<c:if test="${result == 'error'}">
			<div class="row text-center">
				<div class="alert alert-danger">
					<strong>Błąd!</strong> Edycja nie powiodła się.
				</div>
				<hr>
			</div>
		</c:if>

		<div class="col-md-6">
			<div class="well">
				<h2>Rodzaje ryzyk</h2>
				<br>
				<p>Zdefiniuj opis danych rodzajów ryzyk</p>
				<a class="btn btn-lg btn-warning"
					href="<c:url value="/rodzaje-ryzyk" />">Dalej</a>
			</div>
		</div>
		
		<div class="col-md-6">
					<div class="well">
						<h2>Rodzaje pojazdów</h2>
						<br>
						<p>Dodaj lub usuń rodzaje pojazdów</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/rodzaje-pojazdow" />">Dalej</a>
					</div>
				</div>
	</div>
</body>
</html>
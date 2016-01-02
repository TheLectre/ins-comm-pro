<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Polisafe - Dodawanie użytkownika</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/navbar.css" />" type="text/css"
	rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form.css" />" type="text/css"
	rel="stylesheet">

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


					<li><a href="<c:url value="/kontakt" />"><span
							class="glyphicon glyphicon-envelope"></span>Kontakt</a></li>

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
			<div class="col-md-12">
				<h1>Witamy w systemie Polisafe</h1>
				<h2>Zalogowany jako: ${pageContext.request.userPrincipal.name}</h2>
			</div>
		</div>

		<hr>

		<div class="row text-center">
			<sec:authorize access="hasRole('ROLE_ADDUSER')">
				<div class="col-md-6">
					<div class="well">
						<h2>Dodaj użytkownika</h2>
						<br>
						<p>Wybierz uprawnienia i wypełnij formularz.</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/adduser" />">Dalej</a>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_VIEWUSERS')">
				<div class="col-md-6">
					<div class="well">
						<h2>Lista użytkowników</h2>
						<br>
						<p>Przeglądaj lub modyfikuj istniejących użytkowników.</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/user-list" />">Dalej</a>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADDTOWARZYSTWO')">
				<div class="col-md-6">
					<div class="well">
						<h2>Dodaj TU</h2>
						<br>
						<p>Wypełnij formularz i załącz logo towarzystwa.</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/add-towarzystwo" />">Dalej</a>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_CHANGEDESCRIPTION')">
				<div class="col-md-6">
					<div class="well">
						<h2>Opis produktów</h2>
						<br>
						<p>Zdefiniuj rodzaje ryzyk i rodzaje pojazdów</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/opis-produktow" />">Dalej</a>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_MANAGECLIENTS')">
				<div class="col-md-6">
					<div class="well">
						<h2>Klienci</h2>
						<br>
						<p>Przejrzyj twoją bazę klientów</p>
						<a class="btn btn-lg btn-warning"
							href="<c:url value="/baza-klientow" />">Dalej</a>
					</div>
				</div>
			</sec:authorize>
		</div>
	</div>

</body>
</html>
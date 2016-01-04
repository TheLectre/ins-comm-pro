<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link
	href="<c:url value="/bootstrap/css/form-elements-modified2.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form-modified.css" />"
	type="text/css" rel="stylesheet">
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
			<h1>Podgląd oferty</h1>
		</div>

		<hr>

		<div class="row text-center">
			<div class="row">

				<div class="col-md-4">
					<strong class="text-success">${oferta.towarzystwo}</strong> <br>
					<c:if test="${oferta.towarzystwo != 'Aktualne Towarzystwo'}">
						<img
							src="<c:url value="/images/towarzystwa/${oferta.towarzystwo}.png"/>"
							height="160" />
					</c:if>
				</div>

				<div class="col-md-4">
					<strong class="text-success">Data</strong> <br>
					<div class="row">
						<div class="col-md-4">
							<label>Rok</label> <br>
							<h3>${oferta.rok}</h3>
						</div>

						<div class="col-md-4">
							<label>Miesiąc</label> <br>
							<h3>${oferta.miesiac}</h3>
						</div>

						<div class="col-md-4">
							<label>Dzień</label> <br>
							<h3>${oferta.dzien}</h3>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<strong class="text-success">PDF</strong> <br> <label>plik</label>
					<form action="<c:url value="/oferta/download/${oferta.id}.pdf" />"
						method="POST">
						<input type="submit" class="btn btn-lg btn-warning"
							value="Pobierz"> <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			</div>

			<hr>

			<div class="row">
				<c:forEach items="${ryzyka}" var="ryzyko" varStatus="outerLoop">
					<div class="col-md-3">

						<strong class="text-success">${ryzyko.skrot}</strong>
						<table class="table table-bordered table-hover">
							<thead>
								<tr class="success">
									<th>Pojazd</th>
									<c:if test="${ryzyko.rodzaj == 'standard'}">
										<th>ilość</th>
										<th>suma</th>
									</c:if>
									<c:if test="${ryzyko.rodzaj == 'procent'}">
										<th>wartość</th>
										<th>suma</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pojazdy}" var="pojazd" varStatus="innerLoop">

									<c:set var="index"
										value="${fn:length(pojazdy) * outerLoop.index + innerLoop.index}" />
									<c:set var="entry" value="${oferta.szczegoly}" />


									<tr class="success">
										<td>${pojazd.nazwaRodzaju}</td>
										<td>${entry[index].wartosc_pierwsza}</td>
										<td>${entry[index].wartosc_druga}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>

			<div class="row">
				<form action="<c:url value="/baza-klientow/klient" />">
					<input type="hidden" value="${klient.email}" name="kli"> <input
						type="submit" class="btn btn-lg btn-warning" value="Powrót">
				</form>
			</div>

			<br> <br>
		</div>



	</div>
</body>
</html>
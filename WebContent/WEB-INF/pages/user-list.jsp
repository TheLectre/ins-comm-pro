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
				<h1>Lista użytkowników</h1>
				<h2>Według typu</h2>
			</div>
		</div>

		<hr>

		<c:if test="${result == 'success'}">
			<div class="row text-center">
				<div class="alert alert-success">
					<strong>Sukces!</strong> Pomyślnie zedytowano użytkownika.
				</div>
				<hr>
			</div>
		</c:if>

		<div class="row text-center">
			<h2 class="text-info">Administratorzy</h2>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="success">
						<th>Email</th>
						<th>Imię</th>
						<th>Nazwisko</th>
						<sec:authorize access="hasRole('ROLE_EDITUSER')">
							<th>Edycja</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listValue" items="${admins}">
						<tr class="warning">
							<td>${listValue.email}</td>
							<td>${listValue.imie}</td>
							<td>${listValue.nazwisko}</td>

							<td><form action="<c:url value="/user-list/edit-user" />"
									method="POST">
									<input type="hidden" value="${listValue.email}" name="email">
									<input type="submit" class="btn btn-warning" value="Edytuj">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row text-center">
			<h2 class="text-info">Agenci</h2>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="success">
						<th>Email</th>
						<th>Imię</th>
						<th>Nazwisko</th>
						<sec:authorize access="hasRole('ROLE_EDITUSER')">
							<th>Edycja</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listValue" items="${agents}">
						<tr class="warning">
							<td>${listValue.email}</td>
							<td>${listValue.imie}</td>
							<td>${listValue.nazwisko}</td>

							<td><form action="<c:url value="/user-list/edit-user" />"
									method="POST">
									<input type="hidden" value="${listValue.email}" name="email">
									<input type="submit" class="btn btn-warning" value="Edytuj">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row text-center">
			<h2 class="text-info">Klienci</h2>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="success">
						<th>Email</th>
						<th>Imię</th>
						<th>Nazwisko</th>
						<th>Firma</th>
						<th>Telefon</th>
						<th>Ulica</th>
						<th>Kod pocztowy</th>
						<th>Miasto</th>
						<th>Region</th>
						<th>NIP</th>
						<sec:authorize access="hasRole('ROLE_EDITUSER')">
							<th>Edycja</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listValue" items="${clients}">
						<tr class="warning">
							<td>${listValue.email}</td>
							<td>${listValue.imie}</td>
							<td>${listValue.nazwisko}</td>
							<td>${listValue.firma}</td>
							<td>${listValue.telefon}</td>
							<td>${listValue.ulica}</td>
							<td>${listValue.kod}</td>
							<td>${listValue.miasto}</td>
							<td>${listValue.region}</td>
							<td>${listValue.nip}</td>

							<td><form action="<c:url value="/user-list/edit-user" />"
									method="POST">
									<input type="hidden" value="${listValue.email}" name="email">
									<input type="submit" class="btn btn-warning" value="Edytuj">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row text-center">
			<h2 class="text-info">Pracownicy towarzystwa</h2>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="success">
						<th>Email</th>
						<th>Imię</th>
						<th>Nazwisko</th>
						<th>Towarzystwo</th>
						<th>Telefon</th>
						<th>Ulica</th>
						<th>Kod pocztowy</th>
						<th>Miasto</th>
						<th>Region</th>
						<th>NIP</th>
						<sec:authorize access="hasRole('ROLE_EDITUSER')">
							<th>Edycja</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listValue" items="${tus}">
						<tr class="warning">
							<td>${listValue.email}</td>
							<td>${listValue.imie}</td>
							<td>${listValue.nazwisko}</td>
							<td>${listValue.towarzystwo}</td>
							<td>${listValue.telefon}</td>
							<td>${listValue.ulica}</td>
							<td>${listValue.kod}</td>
							<td>${listValue.miasto}</td>
							<td>${listValue.region}</td>
							<td>${listValue.nip}</td>

							<td><form action="<c:url value="/user-list/edit-user" />"
									method="POST">
									<input type="hidden" value="${listValue.email}" name="email">
									<input type="submit" class="btn btn-warning" value="Edytuj">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>

</body>
</html>
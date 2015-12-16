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
				<h1>Edycja użytkownika</h1>
				<h2>${user.email}</h2>
			</div>
		</div>

		<hr>

		<c:set var="type" value="${user.typ}" scope="page" />
		<c:url value="/user-list/edit-user/proceed" var="processUrl" />

		<c:if test="${type == 'admin'}">
			<div class="inner-bg">
				<div class="row text-center"></div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>

						<div class="form-bottom">
							<form:form name="addUserForm" action="${processUrl}"
								method="POST" modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" value="${user.imie }" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" value="${user.nazwisko}" />
								</div>
								<button type="submit" class="btn">Zatwierdź edycję</button>

								<form:input type="hidden" path="email" value="${user.email}" />

								<form:input type="hidden" path="typ" value="${user.typ}" />

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${type == 'agent'}">
			<div class="inner-bg">
				<div class="row text-center"></div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form:form name="addUserForm" action="${processUrl}"
								method="POST" modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" value="${user.imie}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" value="${user.nazwisko}" />
								</div>

								<button type="submit" class="btn">Zatwierdź edycję</button>

								<form:input type="hidden" path="email" value="${user.email}" />

								<form:input type="hidden" path="typ" value="${user.typ}" />

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${type == 'klient'}">
			<div class="inner-bg">
				<div class="row text-center"></div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form:form name="addUserForm" action="${processUrl}"
								method="POST" modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" value="${user.imie}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" value="${user.nazwisko}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="telefon"
										placeholder="Numer telefonu" class="form-control"
										value="${user.telefon}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="ulica" placeholder="Ulica"
										class="form-control" value="${user.ulica}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="kod" placeholder="Kod pocztowy"
										class="form-control" value="${user.kod}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="miasto" placeholder="Miasto"
										class="form-control" value="${user.miasto}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="region" placeholder="Region"
										class="form-control" value="${user.region}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nip" placeholder="NIP"
										class="form-control" value="${user.nip}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="firma" placeholder="Firma"
										class="form-control" value="${user.firma}" />
								</div>
								<div class="form-group">
									<div class="text-center">
										<span class="text-info"><strong>Agent zarządzający</strong></span>
									</div>
									<form:select class="form-control" path="agent" value="${user.agent}">
										<c:forEach var="listValue" items="${agenci}">
											<option>${listValue}</option>
										</c:forEach>
									</form:select>
								</div>
								

								<button type="submit" class="btn">Zatwierdź edycję</button>

								<form:input type="hidden" path="email" value="${user.email}" />

								<form:input type="hidden" path="typ" value="${user.typ}" />

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${type == 'towarzystwo'}">
			<div class="inner-bg">
				<div class="row text-center"></div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form:form name="addUserForm" action="${processUrl}"
								method="POST" modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" value="${user.imie}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" value="${user.nazwisko}" />
								</div>
								<div class="form-group">
									<form:input type="text" path="telefon"
										placeholder="Numer telefonu" class="form-control"
										value="${user.telefon}" />
								</div>

								<button type="submit" class="btn">Zatwierdź edycję</button>

								<form:input type="hidden" path="email" value="${user.email}" />

								<form:input type="hidden" path="towarzystwo"
									value="${user.towarzystwo}" />

								<form:input type="hidden" path="typ" value="${user.typ}" />

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Polisafe - Dodawanie użytkownika</title>
<meta charset="utf-8">
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
		function formSubmit() {
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

					<li><a href="javascript:formSubmit()"><span
							class="glyphicon glyphicon-log-in"></span> Wyloguj</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">

		<div class="row text-center">
			<h1>Dodawanie użytkownika</h1>
			<c:if test="${type == null}">
				<h3>Wybierz typ użytkownika</h3>
			</c:if>
			<c:if test="${type == 'admin'}">
				<h3>Uzupełnij dane nowego administatora</h3>
			</c:if>
			<c:if test="${type == 'agent'}">
				<h3>Uzupełnij dane nowego agenta</h3>
			</c:if>
			<c:if test="${type == 'klient'}">
				<h3>Uzupełnij dane nowego klienta</h3>
			</c:if>
			<c:if test="${type == 'towarzystwo'}">
				<h3>Uzupełnij dane nowego pracownika towarzystwa</h3>
			</c:if>
		</div>

		<hr>

		<c:if test="${type == null}">

			<div class="row text-center">
				<div class="col-md-3">
					<div class="well">
						<h3>Administrator</h3>
						<br> <a class="btn btn-lg btn-warning"
							href="<c:url value="/adduser">
						<c:param name="type" value="admin" />
						</c:url>">Dalej</a>
					</div>
				</div>

				<div class="col-md-3">
					<div class="well">
						<h3>Agent</h3>
						<br> <a class="btn btn-lg btn-warning"
							href="<c:url value="/adduser">
						<c:param name="type" value="agent" />
						</c:url>">Dalej</a>
					</div>
				</div>

				<div class="col-md-3">
					<div class="well">
						<h3>Klient</h3>
						<br> <a class="btn btn-lg btn-warning"
							href="<c:url value="/adduser">
						<c:param name="type" value="klient" />
						</c:url>">Dalej</a>
					</div>
				</div>

				<div class="col-md-3">
					<div class="well">
						<h3>Pracownik TU</h3>
						<br> <a class="btn btn-lg btn-warning"
							href="<c:url value="/adduser">
						<c:param name="type" value="towarzystwo" />
						</c:url>">Dalej</a>
					</div>
				</div>
			</div>

		</c:if>

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
							<form:form name="addUserForm"
								action="<c:url value='adduser/validate' />" method="POST"
								modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Email jest niezbędny do
										zalogowania się</span>
								</div>
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" />
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>

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
							<form:form name="addUserForm"
								action="<c:url value='adduser/validate' />" method="POST"
								modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Email jest niezbędny do
										zalogowania się</span>
								</div>
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" />
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>

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
							<form:form name="addUserForm"
								action="<c:url value='adduser/validate' />" method="POST"
								modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Email jest niezbędny do
										zalogowania się</span>
								</div>
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="firma" placeholder="Firma"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="telefon"
										placeholder="Numer telefonu" class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="ulica" placeholder="Ulica"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="kod" placeholder="Kod pocztowy"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="miasto" placeholder="Miasto"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="region" placeholder="Region"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nip" placeholder="NIP"
										class="form-control" />
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>

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
							<form:form name="addUserForm"
								action="<c:url value='adduser/validate' />" method="POST"
								modelAttribute="user">
								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Email jest niezbędny do
										zalogowania się</span>
								</div>
								<div class="form-group">
									<form:input type="text" path="imie" placeholder="Imię"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nazwisko" placeholder="Nazwisko"
										class="form-control" />
								</div>
								<div class="form-group">
									<select class="form-control"> <!-- TODOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!!!!!! -->
										<option>TU1</option>
										<option>TU2</option>
										<option>TU3</option>
									</select>
								</div>
								<div class="form-group">
									<form:input type="text" path="telefon"
										placeholder="Numer telefonu" class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="ulica" placeholder="Ulica"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="kod" placeholder="Kod pocztowy"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="miasto" placeholder="Miasto"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="region" placeholder="Region"
										class="form-control" />
								</div>
								<div class="form-group">
									<form:input type="text" path="nip" placeholder="NIP"
										class="form-control" />
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</div>

	<c:if test="${type == 'admin'}">

	</c:if>

</body>
</html>
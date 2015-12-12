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
				<h1>Zmiana hasła</h1>
				<h2>Wybierz nowe hasło</h2>
			</div>
		</div>

		<hr>

		<c:if test="${result != null}">
			<c:if test="${result == 'systemError'}">
				<div class="row text-center">
					<div class="alert alert-danger">
						<strong>Błąd systemu!</strong> Nie można odnaleźć użytkownika.
					</div>
					<hr>
				</div>
			</c:if>

			<c:if test="${result == 'unknown'}">
				<div class="row text-center">
					<div class="alert alert-danger">
						<strong>Błąd systemu!</strong> Brak detali.
					</div>
					<hr>
				</div>
			</c:if>

			<c:if test="${result == 'newNewMatching'}">
				<div class="row text-center">
					<div class="alert alert-danger">
						<strong>Błąd!</strong> Hasła muszą być jednakowe.
					</div>
					<hr>
				</div>
			</c:if>

			<c:if test="${result == 'oldNewMatching'}">
				<div class="row text-center">
					<div class="alert alert-danger">
						<strong>Błąd!</strong> Złe hasło.
					</div>
					<hr>
				</div>
			</c:if>

			<c:if test="${result == 'empty'}">
				<div class="row text-center">
					<div class="alert alert-danger">
						<strong>Błąd!</strong> Hasło nie może być puste.
					</div>
					<hr>
				</div>
			</c:if>

			<c:if test="${result == 'success'}">
				<div class="row text-center">
					<div class="alert alert-success">
						<strong>Sukces!</strong> Hasło zmienione.
					</div>
					<hr>
				</div>
			</c:if>


		</c:if>

		<div class="inner-bg">
			<div class="row text-center"></div>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 form-box">
					<div class="form-top">
						<div class="form-top-right">
							<i class="fa fa-lock"></i>
						</div>
					</div>
					<c:url value="/change-password/proceed" var="changePasswordUrl" />

					<div class="form-bottom">
						<form name="changePasswordForm" action="${changePasswordUrl}"
							method="POST">
							<div class="form-group">
								<input type="password" placeholder="Aktualne hasło"
									class="form-control" name="currentPassword" />
							</div>
							<div class="form-group">
								<input type="password" placeholder="Nowe hasło"
									class="form-control" name="newPassword" />
							</div>
							<div class="form-group">
								<input type="password" placeholder="Powtórz nowe hasło"
									class="form-control" name="repeatPassword" />
							</div>
							<button type="submit" class="btn">Zmień hasło</button>

							<input type="hidden" name="email"
								value="${pageContext.request.userPrincipal.name}" /> <input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
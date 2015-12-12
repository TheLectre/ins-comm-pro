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
				<h1>Dodawanie Towarzystwa Ubezpieczeniowego</h1>
				<h2>Podaj dane towarzystwa</h2>
			</div>
		</div>

		<hr>
		
		<c:if test="${result == 'success'}">
			<div class="row text-center">
				<div class="alert alert-success">
					<strong>Sukces!</strong> Pomyślnie dodano towarzystwo.
				</div>
				<hr>
			</div>
		</c:if>

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3 form-box">
				<div class="form-top">
					<div class="form-top-right">
						<i class="fa fa-lock"></i>
					</div>
				</div>
				<div class="form-bottom">
					<form name="addForm"
						action="<c:url value="/add-towarzystwo/upload?${_csrf.parameterName}=${_csrf.token}" />"
						method="POST" class="login-form" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" name="nazwa" placeholder="Nazwa"
								class="form-username form-control">
						</div>

						<div class="form-group">
							<input type="text" name="oc" placeholder="Poziom szkodowy OC w %"
								class="form-password form-control">
						</div>

						<div class="form-group">
							<input type="text" name="ac" placeholder="Poziom szkodowy AC w %"
								class="form-password form-control">
						</div>

						<div class="form-group">
							<input type="file" name="logo" placeholder="Logo"
								class="form-password form-control" style="height: 50px">
							<span class="text-danger">Brak pliku może skutkować błędami. Plik musi być obrazkiem.</span> <br>

						</div>

						<button type="submit" class="btn">Zatwierdź</button>
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
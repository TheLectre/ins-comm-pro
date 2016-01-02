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
			<h1>Rodzaje ryzyk</h1>
		</div>

		<c:forEach items="${ryzyka}" var="ryzyko">
			<div class="col-md-4">

				<hr>

				<form name="ryzykaForm ${ryzyko.skrot}"
					action="<c:url value="/rodzaje-ryzyk/proceed" />" method="POST">

					<div class="form-group">

						<label>skrót:</label> <input class="form-control input-lg"
							value="${ryzyko.skrot}" name="skrot" /> <label>nazwa:</label> <input
							class="form-control input-lg" value="${ryzyko.nazwa}"
							name="nazwa" /> <label>opis:</label>
						<textarea name="opis" class="form-control noresize">${ryzyko.opis}</textarea>
					</div>


					<strong><label>naliczanie <c:if
							test="${ryzyko.rodzaj == 'standard'}">
					standardowe
				</c:if> <c:if test="${ryzyko.rodzaj == 'procent'}">
					od wartości pojazdów
				</c:if>
					</label></strong>
					
					<br><br>

					<button type="submit" class="btn btn-lg btn-warning">Zatwierdź
						zmiany</button>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" name="id"
						value="${ryzyko.id}" /> <input type="hidden" name="rodzaj"
						value="${ryzyko.rodzaj}" />


				</form>

				<br>

				<form name="usunForm"
					action="<c:url value="/rodzaje-ryzyk/delete" />" method="POST">
					<input type="hidden" name="id" value="${ryzyko.id}"> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

					<button type="submit" class="btn btn-lg btn-warning">Usuń
						ryzyko</button>
				</form>

			</div>
		</c:forEach>

		<form name="dodajRyzykoForm"
			action="<c:url value="/rodzaje-ryzyk/add" />" method="POST">

			<div class="col-md-4">

				<hr>

				<div class="form-group">

					<label>skrót:</label> <input class="form-control input-lg"
						name="skrot" /> <label>nazwa:</label> <input
						class="form-control input-lg" name="nazwa" /> <label>opis:</label>
					<textarea name="opis" class="form-control noresize"></textarea>

					<br> <input type="checkbox" id="rodzajCheckbox" name="rodzaj" />
					<div class="btn-group">
						<label for="rodzajCheckbox" class="btn btn-success"> <span
							class="glyphicon glyphicon-ok"></span> <span> </span>
						</label> <label for="rodzajCheckbox" class="btn btn-default active">
							Naliczane od wartości pojazdów, w % </label>
					</div>
				</div>

				<button type="submit" class="btn btn-lg btn-warning">Dodaj
					nowe ryzyko</button>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</div>

		</form>



	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<title>Polisafe - zaloguj się</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />"
	type="text/css" rel="stylesheet">
<link
	href="<c:url value="/bootstrap/font-awesome/css/font-awesome.min.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form-elements.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/form.css" />" type="text/css"
	rel="stylesheet">

<script src="<c:url value="bootstrap/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="bootstrap/js/jquery.backstretch.min.js" />"></script>
<script src="<c:url value="bootstrap/js/scripts.js" />"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

</head>
<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row text-center">
					<h1>Polisafe</h1>
					<p>Wpisz email i hasło by się zalogować.</p>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form name="loginForm" accept-charset="UTF-8" action="<c:url value='/login' />"
								method="POST" class="login-form">
								<div class="form-group">
									<input type="text" name="email" placeholder="Email..."
										class="form-username form-control">
								</div>
								<div class="form-group">
									<input type="password" name="password" placeholder="Hasło..."
										class="form-password form-control">
								</div>
								<c:if test="${error == true}">
									<div class="alert alert-danger">
										<strong>Błąd!</strong> Podany email lub hasło są niepoprawne.
									</div>
								</c:if>
								<c:if test="${logout == true}">
									<div class="alert alert-success">
										<strong>Sukces!</strong> Zostałeś wylogowany z systemu.
									</div>
								</c:if>
								<button type="submit" class="btn">Zaloguj!</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign in page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/bootstrap/css/login-form.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />"
	type="text/css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>
</head>
<body>



	<div class="container">
		<div class="row">
			<div class="col-md-offset-5 col-md-3">
				<div class="form-login">
					<h4>Zaloguj się</h4>
					<form name='loginForm' action="<c:url value='/login' />"
						method='POST'>
						<input type="text" name="email"
							class="form-control input-sm chat-input" placeholder="email" />
						</br> <input type="password" name="password"
							class="form-control input-sm chat-input" placeholder="password" />
						</br>
						<div class="wrapper">
							<span class="group-btn"> <input
								class="btn btn-primary btn-md" type="submit" value="Zatwierdź" />
							</span> <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
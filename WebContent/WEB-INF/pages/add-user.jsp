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

		<c:if test="${result == 'error'}">
			<div class="row text-center">
				<div class="alert alert-danger">
					<strong>Błąd!</strong> Użytkownik z takim emailem już istnieje!
				</div>
				<hr>
			</div>
		</c:if>

		<c:if test="${result == 'success'}">
			<div class="row text-center">
				<div class="alert alert-success">
					<strong>Sukces!</strong> Pomyślnie dodano użytkownika.
				</div>
				<hr>
			</div>
		</c:if>

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

		<c:url value="adduser/validate" var="validate_url" />

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
							<form:form name="addUserForm" action="${validate_url}"
								method="POST" modelAttribute="user">

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Dane</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Błędny adres email uniemożliwi
										korzystanie z systemu</span>
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
								<span class="text-danger">Przed dodaniem upewnij się o
									poprawności danych</span>

								<input type="hidden" name="type" value="${type}" />

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
							<form:form name="addUserForm" action="${validate_url}"
								method="POST" modelAttribute="user">

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Dane</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Błędny adres email uniemożliwi
										korzystanie z systemu</span>
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
								<span class="text-danger">Przed dodaniem upewnij się o
									poprawności danych</span>

								<input type="hidden" name="type" value="${type}" />

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


						<script type="text/javascript">
							function onSubmit() {
								document.getElementById('hiddenfloty').value = document
										.getElementById('floty-checkbox').value;
								document.getElementById('hiddengwarancje').value = document
										.getElementById('gwarancje-checkbox').value;
								document.getElementById('hiddenmajatek').value = document
										.getElementById('majatek-checkbox').value;
								document.getElementById('hiddengrupowe').value = document
										.getElementById('grupowe-checkbox').value;

								alert(document.getElementById('hiddenfloty').value);
							}
						</script>


						<div class="form-bottom">
							<form:form name="addUserForm" action="${validate_url}"
								method="POST" modelAttribute="user" onsubmit="onSubmit();">

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Dane</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Błędny adres email uniemożliwi
										korzystanie z systemu</span>
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

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Ubezpieczenia</strong></span>
								</div>
								<br>

								<div class="form-group">
									<input type="checkbox" name="floty-checkbox"
										id="floty-checkbox" autocomplete="off" name="floty" />
									<div class="btn-group">
										<label for="floty-checkbox" class="btn btn-success"> <span
											class="glyphicon glyphicon-ok"></span> <span> </span>
										</label> <label for="floty-checkbox" class="btn btn-default active">
											Floty </label>
									</div>
								</div>

								<div class="form-group">
									<input type="checkbox" name="gwarancje-checkbox"
										id="gwarancje-checkbox" autocomplete="off" name="gwarancje" />
									<div class="btn-group">
										<label for="gwarancje-checkbox" class="btn btn-success">
											<span class="glyphicon glyphicon-ok"></span> <span> </span>
										</label> <label for="gwarancje-checkbox"
											class="btn btn-default active"> Gwarancje </label>
									</div>
								</div>

								<div class="form-group">
									<input type="checkbox" name="majatek-checkbox"
										id="majatek-checkbox" autocomplete="off" name="majatekIOc" />
									<div class="btn-group">
										<label for="majatek-checkbox" class="btn btn-success">
											<span class="glyphicon glyphicon-ok"></span> <span> </span>
										</label> <label for="majatek-checkbox" class="btn btn-default active">
											Majątek i OC </label>
									</div>
								</div>

								<div class="form-group">
									<input type="checkbox" name="grupowe-checkbox"
										id="grupowe-checkbox" autocomplete="off" name="grupowe" />
									<div class="btn-group">
										<label for="grupowe-checkbox" class="btn btn-success">
											<span class="glyphicon glyphicon-ok"></span> <span> </span>
										</label> <label for="grupowe-checkbox" class="btn btn-default active">
											Grupowe </label>
									</div>
								</div>

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Agent
											zarządzający</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:select class="form-control" path="agent">
										<c:forEach var="listValue" items="${agenci}">
											<option>${listValue}</option>
										</c:forEach>
									</form:select>
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>
								<span class="text-danger">Przed dodaniem upewnij się o
									poprawności danych</span>

								<input type="hidden" name="type" value="${type}" />

								<form:input type="hidden" path="klientFloty" id="hiddenfloty" />
								<form:input type="hidden" path="klientGwarancje"
									id="hiddengwarancje" />
								<form:input type="hidden" path="klientMajatekIOc"
									id="hiddenmajatek" />
								<form:input type="hidden" path="klientGrupowe"
									id="hiddengrupowe" />

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
							<form:form name="addUserForm" action="${validate_url}"
								method="POST" modelAttribute="user">

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Dane</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:input type="text" path="email" placeholder="Email"
										class="form-control" />
									<span class="text-danger">Błędny adres email uniemożliwi
										korzystanie z systemu</span>
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
									<form:input type="text" path="telefon"
										placeholder="Numer telefonu" class="form-control" />
								</div>

								<br>
								<div class="text-center">
									<span class="text-info"><strong>Dane</strong></span>
								</div>
								<br>

								<div class="form-group">
									<form:select class="form-control" path="towarzystwo">
										<c:forEach var="listValue" items="${towarzystwa}">
											<option>${listValue}</option>
										</c:forEach>
									</form:select>
								</div>

								<button type="submit" class="btn">Dodaj użytkownika</button>
								<span class="text-danger">Przed dodaniem upewnij się o
									poprawności danych</span>


								<input type="hidden" name="type" value="${type}" />

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
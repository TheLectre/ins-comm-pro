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
			<h1>Formularz dodawania oferty</h1>
			<h2>${klient.firma}</h2>
		</div>

		<hr>

		<div class="row text-center">
			<c:url
				value="/baza-klientow/klient/oferta/proceed?${_csrf.parameterName}=${_csrf.token}"
				var="dodajOferteUrl" />

			<form:form action="${dodajOferteUrl}" method="POST"
				modelAttribute="ofertyForm" enctype="multipart/form-data">

				<form:input type="hidden" path="klientEmail" value="${klient.email}" />

				<div class="row">

					<div class="col-md-4">
						<strong class="text-success">Towarzystwo</strong> <br> <label
							for="towarzystwo">TU</label> <br>
						<form:select class="selectwidthauto" path="towarzystwo"
							id="towarzystwo">
							<option>Aktualne Towarzystwo</option>
							<c:forEach var="towarzystwo" items="${towarzystwa}">
								<option>${towarzystwo.nazwa}</option>
							</c:forEach>
						</form:select>
					</div>


					<div class="col-md-4">
						<strong class="text-success">Data</strong> <br>
						<div class="row">
							<div class="col-md-4">
								<label for="rok">Rok</label> <br>
								<form:select path="rok" id="rok">
									<option>2018</option>
									<option>2017</option>
									<option>2016</option>
									<option>2015</option>
									<option>2013</option>
									<option>2012</option>
								</form:select>
							</div>

							<div class="col-md-4">
								<label for="miesiac">Miesiąc</label> <br>
								<form:select path="miesiac" id="miesiac">
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
									<option>05</option>
									<option>06</option>
									<option>07</option>
									<option>08</option>
									<option>09</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</form:select>
							</div>

							<div class="col-md-4">
								<label for="dzien">Dzień</label> <br>
								<form:select path="dzien" id="dzien">
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
									<option>05</option>
									<option>06</option>
									<option>07</option>
									<option>08</option>
									<option>09</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
									<option>13</option>
									<option>14</option>
									<option>15</option>
									<option>16</option>
									<option>17</option>
									<option>18</option>
									<option>19</option>
									<option>20</option>
									<option>21</option>
									<option>22</option>
									<option>23</option>
									<option>24</option>
									<option>25</option>
									<option>26</option>
									<option>27</option>
									<option>28</option>
									<option>29</option>
									<option>30</option>
									<option>31</option>
								</form:select>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<strong class="text-success">PDF</strong> <br> <label
							for="pdf">Plik</label> <input type="file" name="pdfData" id="pdf" />
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
									<c:forEach items="${pojazdy}" var="pojazd"
										varStatus="innerLoop">

										<c:set var="index"
											value="${fn:length(pojazdy) * outerLoop.index + innerLoop.index}" />

										<tr class="success">
											<td>${pojazd.nazwaRodzaju}</td>
											<td><c:if test="${ryzyko.rodzaj == 'standard'}">

													<form:input type="text"
														path="list[${index}].wartosc_pierwsza"
														value="${klient.pojazdy[pojazd.id]}" />
												</c:if> <c:if test="${ryzyko.rodzaj == 'procent'}">

													<form:input type="text"
														path="list[${index}].wartosc_pierwsza" />
												</c:if></td>
											<td><form:input type="text"
													path="list[${index}].wartosc_druga" /></td>

											<form:input type="hidden" path="list[${index}].id_pojazdu"
												value="${pojazd.id}" />
											<form:input type="hidden" path="list[${index}].id_produktu"
												value="${ryzyko.id}" />
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</div>

				<div class="row">
					<input type="submit" class="btn btn-warning" value="dodaj ofertę">
				</div>

				<br>
				<br>

			</form:form>
		</div>



	</div>
</body>
</html>
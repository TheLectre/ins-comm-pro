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
<link href="<c:url value="/bootstrap/css/well.css" />" type="text/css"
	rel="stylesheet">

<script src="<c:url value="/bootstrap/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/jquery.backstretch.min.js" />"></script>
<script src="<c:url value="/bootstrap/js/scripts.js" />"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

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
			<h1>Karta klienta ${klient.imie} ${klient.nazwisko}</h1>
		</div>

		<hr>

		<c:if test="${result == 'success'}">
			<div class="row text-center">
				<div class="alert alert-success">
					<strong>Sukces!</strong> Pomyślnie dodano ofertę.
				</div>
				<hr>
			</div>
		</c:if>

		<c:if test="${result == 'error'}">
			<div class="row text-center">
				<div class="alert alert-danger">
					<strong>Błąd!</strong> Zarejestrowano już ofertę towarzystwa z tego
					dnia.
				</div>
				<hr>
			</div>
		</c:if>

		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong>Informacje</strong>
				</div>
				<div class="panel-body">
					<div class="row">

						<div class="col-md-4">
							<div class="well">
								<strong class="text-info">Ogólne</strong>

								<hr>

								<h3>
									<b>${klient.imie} ${klient.nazwisko}</b>
								</h3>
								<h3>
									<b>${klient.email}</b>
								</h3>
								<h3>
									<b>${klient.firma}</b>
								</h3>
								<h4>NIP: ${klient.nip}</h4>
								<h4>telefon: ${klient.telefon}</h4>
								<h4>${klient.ulica}</h4>
								<h4>${klient.kod}</h4>
								<h4>${klient.miasto}</h4>
								<h4>${klient.region}</h4>

							</div>
						</div>

						<div class="col-md-4">
							<div class="well">
								<strong class="text-info">Zarządzanie</strong>

								<hr>

								<table class="table table-bordered table-hover">
									<thead>
										<tr class="success">
											<th>Ubezpieczenie</th>
											<th>Wybrane</th>
										</tr>
									</thead>
									<tbody>
										<tr class="warning">
											<td>Floty</td>
											<td><c:if test="${klient.klientFloty == true}">
													<span class="glyphicon glyphicon-ok"></span>
												</c:if> <c:if test="${klient.klientFloty == false}">
													<span class=" 	glyphicon glyphicon-remove"></span>
												</c:if></td>
										</tr>
										<tr class="warning">
											<td>Gwarancje</td>
											<td><c:if test="${klient.klientGwarancje == true}">
													<span class="glyphicon glyphicon-ok"></span>
												</c:if> <c:if test="${klient.klientGwarancje == false}">
													<span class=" 	glyphicon glyphicon-remove"></span>
												</c:if></td>
										</tr>

										<tr class="warning">
											<td>Majątek i OC</td>
											<td><c:if test="${klient.klientMajatekIOc == true}">
													<span class="glyphicon glyphicon-ok"></span>
												</c:if> <c:if test="${klient.klientMajatekIOc == false}">
													<span class=" 	glyphicon glyphicon-remove"></span>
												</c:if></td>
										</tr>

										<tr class="warning">
											<td>Grupowe</td>
											<td><c:if test="${klient.klientGrupowe == true}">
													<span class="glyphicon glyphicon-ok"></span>
												</c:if> <c:if test="${klient.klientGrupowe == false}">
													<span class=" 	glyphicon glyphicon-remove"></span>
												</c:if></td>
										</tr>
									</tbody>
								</table>

								<h4 class="text-info">
									<b>Agent: ${klient.agent}</b>
								</h4>

							</div>
						</div>

						<div class="col-md-4">
							<div class="well">
								<strong class="text-info">Uwagi</strong>

								<hr>

								<form action="<c:url value="/baza-klientow/klient/opis"/>"
									method="POST">

									<textarea name="opis" class="form-control noresize" rows="20">${klient.klientUwagi}</textarea>

									<br>

									<button type="submit" class="btn btn-lg btn-warning">Zapisz
										uwagi</button>

									<input type="hidden" name="kli" value="${klient.email}" /> <input
										type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>

							</div>
						</div>
					</div>

					<br>

					<div class="row">
						<form action="<c:url value="/user-list/edit-user"/>" method="POST">
							<button type="submit" class="btn btn-lg btn-warning">Edytuj
								klienta</button>
							<input type="hidden" name="email" value="${klient.email}">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong>Baza pojazdów</strong>
				</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="success">
								<c:forEach items="${pojazdy}" var="pojazd">
									<th>${pojazd.nazwaRodzaju}</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach items="${pojazdy}" var="pojazd">
									<td><c:if test="${klient.pojazdy[pojazd.id] == null}">0</c:if>
										<c:if test="${klient.pojazdy[pojazd.id] != null}">${klient.pojazdy[pojazd.id]}</c:if>
									</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>

					<br>

					<form action="<c:url value="/baza-klientow/klient/pojazdy" />"
						method="GET">
						<input type="hidden" name="kli" value="${klient.email}" />
						<button type="submit" class="btn btn-lg btn-warning">Edytuj
							pojazdy</button>
					</form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong>Oferty</strong>
				</div>
				<div class="panel-body">

					<c:forEach items="${oferty}" var="oferta">
						<div class="row">

							<div class="col-md-4">${oferta.dzien}-${oferta.miesiac}-${oferta.rok}</div>


							<div class="col-md-4">${oferta.towarzystwo}</div>

							<div class="col-md-4">
								<form
									action="<c:url value="/baza-klientow/klient/oferta/check/${oferta.id}" />"
									method="POST">
									<input type="submit" class="btn btn-warning" value="więcej">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</div>
							<hr>
						</div>
					</c:forEach>

					<form action="<c:url value="/baza-klientow/klient/oferta" />"
						method="GET">
						<input type="hidden" name="kli" value="${klient.email}" />
						<button type="submit" class="btn btn-warning">Dodaj
							ofertę</button>
					</form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong>Wykresy ofert</strong>
				</div>
				<div class="panel-body">
				
					<c:if test="${mapList.size() != 0}">
						<script>
						var towarzystwa = ["Ryzyko"];
				    	var dataArray = new Array();
				    	</script>
				    	
				   		<c:forEach items="${towarzystwa}" var="towarzystwo" varStatus="status">	
				    			<script>towarzystwa[${status.count}] = ("${towarzystwo}");</script>
				    	</c:forEach>
				    
				    	<script>dataArray[0] = towarzystwa;</script>
				    	
				    	<c:forEach items="${ryzyka}" var="ryzyko" varStatus="status">	
				    		<script>dataArray[${status.count}] = (["${ryzyko}"]);</script>
				    	</c:forEach>
				    	
				    	<script>dataArray[dataArray.length] = (["Razem"]);</script>
				    	
				    	<c:forEach items="${mapList}" var="map">	
				    		<c:forEach items="${map}" var="entry" varStatus="status">	
				    			<script>dataArray[${status.count}].push(${entry.value});</script>
				    		</c:forEach>
				    	</c:forEach>
				    	
				    	<script type="text/javascript">
						google.charts.load('current', {'packages':['bar']});
					      google.charts.setOnLoadCallback(drawChart);
					      function drawChart() {	
					    	
					        var data = google.visualization.arrayToDataTable(dataArray);
	
					        var options = {
					        	legend: { position: 'left', alignment: 'center'},
					        	
					        	chart: {
				                    title: 'Wykres najlepszych ofert',
					            },
					            
					            height: 400
					        };
	
					        var chart = new google.charts.Bar(document.getElementById('wykres'));
	
					        chart.draw(data, options);
					      }
	
						</script>		
					</c:if>
					
					<c:if test="${mapList.size() == 0}">
						<h2>Brak ofert</h2>
					</c:if>
			    	
			    	

			    	
					<div id="wykres"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('.row').each(function() {
			var wellHeight = 0
			$(this).find('.well').each(function() {
				var temp = $(this).height()
				if (temp > wellHeight) {
					wellHeight = temp
				}
			}).height(wellHeight + "px")
		})
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	background-image: url("IMG/dashboarddog.jpeg");
}
</style>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js%22%3E"></script>
<title>Dashboard</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Dogstagram</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="/dashboard">Home</a>
					<a class="nav-link" href="/mydog/${userId}">My Dog's Profile</a> <a
						class="nav-link" href="/logout">Logout</a>

				</div>
			</div>
		</div>
	</nav>
	<h2 class="m-5 text-info">Welcome to the Dog Dashboard</h2>
	<div class="container">
		<div class="row">
			<div class="col-5 ml-5 border border-dark">
				<h2 class="m-5 text-info">Message Wall</h2>
				<p></p>
				<div class="form-group">
					<label for="comments">Comments</label>
					<textarea class="form-control" id="comments" rows="3">
										<c:forEach items="${allComments}" var="comment">
<c:out value="${comment.postedBy.firstName}" /> <c:out
								value="${comment.postedBy.lastName}" />: <c:out
								value="${comment.content}" />
********************
					</c:forEach>
					</textarea>
				</div>
				<form:errors path="comment.*" />
				<form class="form-group push" method="POST" action="/createMessage"
					modelAttribute="message">
					<input type=hidden value="${userId}" />
					<div class="form-group">
						<label for="messages">Messages</label>
						<textarea class="form-control" id="content" name="content"
							rows="3"></textarea>
					</div>
					<input class="btn btn-success mt-3 mb-3" type="submit"
						value="Add comment!" />
				</form>
			</div>
			<div class="col-5 ml-4 border border-dark">

				<div class="form-group mt-5">
					<input type=hidden value="${user.city}" /> <label
						class="text-warning" for="weather">Today's Weather</label>
					<div class="bg-white p-3 border-rounded">
						<p>Temp: ${weather.main.temp}</p>
						<p>Feels Like: ${weather.main.feels_like}</p>
						<p>Today's High: ${weather.main.temp_max}</p>
						<p>Today's Low: ${weather.main.temp_min}</p>
					</div>
					<div>
						<!-- <div id="weatherDisplay"> -->
						<p id="description"></p>
						<!-- </div> -->
					</div>
				</div>
				<a class="text-info" href="/playdates">Check out some doggie
					playdates!</a>
			</div>
		</div>
	</div>
	<script>
		var display = document.getElementById("weatherDisplay");
		const settings = {
			"async" : true,
			"crossDomain" : true,
			"url" : "https://community-open-weather-map.p.rapidapi.com/weather?q=London%2Cuk&lat=0&lon=0&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html",
			"method" : "GET",
			"headers" : {
				"x-rapidapi-key" : "f19d52f39bmsh0620644bfd0ef7bp15579bjsnf9f0c761d2e7",
				"x-rapidapi-host" : "community-open-weather-map.p.rapidapi.com"
			}
		};
		$.ajax(settings).done(function(response) {
			console.log(jQuery.parseJSON(response));
			$("#description").text(response.base);
		});
	</script>
</body>
</html>
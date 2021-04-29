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
	<div class="container">
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


		<h1>My Dog's Profile Page</h1>
		<div class="container">
			<div class="row">
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog1.jpg"><br>
				</div>
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog2.jpg"><br>
				</div>
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog3.jpg"><br>
				</div>
			</div>
		</div>
		<%-- 	<c:forEach items="${allPictures}" var="picture">
		<div class="cols-4">
			<img src="./images/dog.jpeg" style="width: 250px; height: 250px" />
		</div>
	</c:forEach> --%>
		<br> <br>
		<div style="float: right;">
			<form action="#" method="post">
				<p>
					<label>Picture: </label>
				</p>
				<p>
					<input type="file" name="image" accept="image/png, image/jpreg" />
				</p>
				<input type="hidden" value="${userId}" />
				<p>
					<button>Submit!</button>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
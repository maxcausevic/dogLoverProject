<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	background-image: url("IMG/dogsplaying.jpeg");
}
</style>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Edit a playdate</title>
</head>
<body>
	<div class=container>

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
	<div class="container">
			<div class="row">
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog10.jpg"><br>
				</div>
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog11.jpg"><br>
				</div>
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog12.png"><br>
				</div>
				<div class="col">

					<img class='rounded-circle' style="height: 250px; width: 250px;"
						src="/IMG/dog13.jpg"><br>
				</div>
			</div>

	<h3 class="m-5">Edit Playdate</h3>
	<p>
		<form:errors path="playdate.*" />
	</p>

	<form:form class="form-group push" method="POST"
		action="/playdates/edit/${playdate.id}" modelAttribute="playdate">
		<form:hidden value="${userId}" path="host" />
		<!-- need this for restful conventions and put method-->
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="name">Name:</form:label>
			<form:input type="text" path="name" />
		</p>
		<p>
			<form:label path="date">Date:</form:label>
			<form:input type="date" path="date" />
		</p>
		<p>
			<form:label path="city">City:</form:label>
			<form:input type="text" path="city" />
		</p>
		<p>
			<form:label path="state">State:</form:label>
			<form:select name="state" id="state" path="state">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</form:select>
		</p>
		<input class="btn btn-success mt-3" type="submit"
			value="Edit Playdate!" />
	</form:form>
	<h3><span class="text-primary">Attendees:</span></h3>
	<c:forEach items="${playdate.attendees}" var="attendee">
		<h4> <c:out value="${attendee.firstName}"/> <c:out value="${attendee.lastName}"/> </h4>
	</c:forEach>
	<%-- 
		
		<form class="m-5 col-3 border border-solid border-dark" action="/createPlaydates">
  <label for="name">name:</label><br>
  <input type="text" id="fname" name="name" value="name"><br>
  <label for="location">location:</label><br>
  <input type="text" id="location" name="location" value="location"><br><br>
  <input type="submit" value="Submit">
</form>  --%>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <style>
    body{
    background-image: url("IMG/dogsplaying.jpeg");
    }
    </style>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Create a playdate</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Dogstagram</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/dashboard">Home</a>
        <a class="nav-link" href="/mydog">My Dog's Profile</a>
        <a class="nav-link" href="/logout">Logout</a>
       
      </div>
    </div>
  </div>
</nav>

	<h3 class="m-5">Create Event</h3>
		<%-- <p>
			<form:errors path="playdate.*" />
		</p> --%>

		<%-- <form:form class="form-group push" method="POST" action="/createPlayDate"
			modelAttribute="playdate"> --%>
			<%-- <p>
				<form:label path="name">Name:</form:label>
				<form:input type="name" path="name" />
			</p>
			<p>
				<form:label path="location">Location:</form:label>
				<form:input type="location" path="location" />
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
			<p>
				<form:label path="playdateDate">Date:</form:label>
				<form:input type="date" path="playdateDate" />
			</p>


			<input class="btn btn-success mt-3" type="submit"
				value="Start Playdate!" />
			<a class="btn btn-primary float-right" href="/logout">Logout</a> --%>
		<%-- </form:form> --%>
		
		<form class="m-5 col-3 border border-solid border-dark" action="/createPlaydates">
  <label for="name">name:</label><br>
  <input type="text" id="fname" name="name" value="name"><br>
  <label for="location">location:</label><br>
  <input type="text" id="location" name="location" value="location"><br><br>
  <input type="submit" value="Submit">
</form> 
	
</body>
</html>
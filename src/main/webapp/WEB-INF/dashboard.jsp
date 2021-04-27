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
    background-image: url("IMG/dashboarddog.jpeg");
    }
    </style>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Dashboard</title>
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
<h2 class="m-5 text-info">Welcome to the Dog Dashboard</h2>
<div class="container">
<div class="row">
<div class="col-5 ml-5 border border-dark">
				<h2 class="m-5 text-info">Message Wall</h2>
				<p></p>
				<div class="form-group">
					<%-- <c:forEach var="message" items="${event.messages}"> --%>
						<label for="comments">Comments</label>
						<textarea class="form-control" id="comments" rows="3">
					<%-- ${message.content} --%>
					</textarea>
					<%-- </c:forEach> --%>
				</div>
				<form:errors path="comment.*" />

				<%-- <form class="form-group push" method="POST"
					action="/createMessage/${event.id}"> --%>


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
						<label class="text-warning" for="messages">Today's Weather</label>
						<textarea class="form-control" id="weather" name="weather"
							rows="3"></textarea>
					</div>
					<a class="text-info" href="/playdates">Check out some doggie playdates!</a>
</div>
</div>
</div>

</body>
</html>
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
	background-image: url("IMG/dogsplaying.jpeg");
}
</style>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Doggie Playdates</title>
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
	<h1 class="mt-3">
		Welcome,
		<c:out value="${user.firstName}" />
	</h1>
	<h3 class="m-5 text-info">Playdates in your area</h3>
	<table class="table-success col-5 m-5 table-hover">

		<thead>

			<tr>
				<th scope="col">Playdate</th>
				<th scope="col">Number of Attendees</th>
				<th scope="col">Date</th>
				<th scope="col">Host</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allPlaydates}" var="playdate">
				<%-- <c:if test="${user.city == playdate.city }"> --%>
				<tr>
					<th scope="row"><c:out value="${playdate.name}" /></th>
					<td><c:out value="${playdate.attendees.size()}" /> </td>
					<td><c:out value="${playdate.date}" /> </td>
					<td><c:out value="${playdate.host.firstName}" /></td>
					<td class="d-flex justify-content-around"><c:choose>
							<c:when test="${playdate.host.id == userId }">
								<a class="btn btn-info" href="/playdates/${playdate.id}/edit">Edit</a>
								<form action="/delete/${playdate.id}" method="post">
									<input type="hidden" name="_method" value="delete"> <input
										class="btn btn-danger" type="submit" value="Delete">
								</form>
							</c:when>
							<c:otherwise>
								<c:set var="attending" value="${false}" />
								<c:forEach items="${playdate.attendees}" var="attendee">
									<c:if test="${attendee == user}">
										<c:set var="attending" value="${true}" />
									</c:if>
								</c:forEach>
									<c:if test="${!playdate.attendees.contains(user)}">
										<form action="/playdates/addUser/${playdate.id}" method="post">
											<input type="submit" value="Join">
										</form>
									</c:if>
									<c:if test="${playdate.attendees.contains(user)}">
										<form action="/playdates/removeUser/${playdate.id}"
											method="post">
											<input type="submit" value="Cancel">
										</form>
									</c:if>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<%-- </c:if> --%>
			</c:forEach>
		</tbody>
	</table>
	<a class="text-info" href="/createPlaydate">Start a playdate!</a>
</body>
</html>
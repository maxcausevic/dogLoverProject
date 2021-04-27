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
<title>Doggie Playdates</title>
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
<h3 class="m-5 text-info">Playdates in your area</h3>
<table class="table-success col-5 m-5 table-hover">

  <thead>
 
    <tr>
      <th scope="col">#</th>
      <th scope="col">Playdate</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>PlayDate</td>
      <td><a href="/join">Join</a></td>
    </tr>
      </tbody>
</table>
<a class="text-info" href="/createPlaydates">Start a playdate!</a>
</body>
</html>
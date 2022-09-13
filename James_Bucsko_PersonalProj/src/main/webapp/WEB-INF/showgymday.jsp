<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>reserve</title>
</head>
<body>
	<div class="container border border-secondary">
		<div class="header">
			<h1>${user.userName}'s ${gymday.muscle} Workout!</h1>
			<p>
				<a href="/home">Home</a>
		</div>
		<div class="body">
		<h3>Muscle Worked: ${gymday.muscle}</h3>
		
		<h3> Exercise: ${gymday.workoutName}</h3>
		
		<h3>Description: ${gymday.workout}</h3>
		<p>
			<c:if test="${user.id == gymday.user.id}">
			<a href="/gymday/${gymday.id}/edit">Edit</a>
			<a href="/gymday/${gymday.id}/delete">Delete</a>
		</c:if>
		</div>
	</div>
</body>
</html>
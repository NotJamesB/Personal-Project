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
	<div class="container border border-primary">
		<h1 class="text-secondary">Create your exercise!</h1>
		<a href="/home">Go home</a>
		<p>
			<form:form method="post" action="/create/workout"
				modelAttribute="gymday">
				<div class="form-group">
					<label for="muscle">Muscle Worked</label> 
					<form:input
						path="muscle" type="text" class="form-control" 
						placeholder="Ex. Chest"/>
					<form:errors path="muscle" class="text-danger"/>
				</div>
				<div class="form-group">
					<label for="workoutName">Exercise Name</label> <form:input
						path="workoutName" type="text" class="form-control" id="workoutName"
						placeholder="Ex. Bench Press"/>
					<form:errors path="workoutName" class="text-danger"/>
				</div>						
				<div class=" form-group">
					<label for="workout">Describe this exercise</label> <form:input
						path="workout" type="textarea" class="form-control" id="workout"
						placeholder="Ex. Lay flat on a bench and bring the bar down to your chest, and then slowly back up"/>
					<form:errors path="workout"/>
				</div>					

				
				<p>
					<form:errors path="user" />
					<form:input type="hidden" path="user" value="${user.id}" />
				<p>
					<button>Create</button>
			</form:form>
	</div>
</body>
</html>
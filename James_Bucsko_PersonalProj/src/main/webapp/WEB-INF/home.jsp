<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>reserve</title>
</head>
<body>
<div class="container border border-secondary">
	<h1>Welcome, ${user.userName} Let's get fit!
	</h1>
	<p><a href="/logout">logout</a>
	<table class="table table-hover col-4">
		<th> Muscle Worked</th>
		<th> Exercise </th>
			
			<c:forEach var="gymday" items="${gymdays}">
				<tr>
				 <td>${gymday.muscle}</td>
					<td><a href="/workout/${gymday.id}">${gymday.workoutName}</a></td>
					
				</tr>
			</c:forEach>
	</table>
	<p>
		<a href="/workout">Create a new workout!</a>
</div>
</body>
</html>
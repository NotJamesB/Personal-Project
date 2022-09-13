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
<div class="container">

	<h1>Welcome!</h1>
	<p>Ready to make a workout sheet?</p>
	<div class="d-flex justify-content-around">
		<div class="register">
			<h3>Register</h3>
			<form:form method="post" action="/register" modelAttribute="newUser">
				<div class="form-group">
					<form:label path="userName">User Name</form:label>
					<form:errors path="userName" />
					<form:input class="form-control" path="userName" />
				</div>
				<div class="form-group">				
					<form:label path="email">Email</form:label>
					<form:errors path="email" />
					<form:input class="form-control" path="email" />
				</div>
				<div class="form-group">
					<form:label path="password">Password</form:label>
					<form:errors path="password" />
					<form:input class="form-control" path="password" />
				</div>
				<div class="form-group">
					<form:label path="confirm">Confirm PW</form:label>
					<form:errors path="confirm" />
					<form:input class="form-control" path="confirm" />
				</div>
				
				<form:button>Register</form:button>
			</form:form>
		</div>
		<div>
		
		</div>
		<div class="login ">
			<h3>Login</h3>
			<form:form method="post" action="/login" modelAttribute="newLogin">
			<div class="form-group">
				<form:label path="email">Email</form:label>
				<form:errors path="email" />
				<form:input class="form-control" path="email" />
			</div>
				<div class="form-group">
					<form:label path="password">Password</form:label>
					<form:errors path="password" />
					<form:input class="form-control" path="password" />
				</div>
					<form:button>Login</form:button>
			</form:form>
		</div>
	</div>
</div>
</body>
</html>
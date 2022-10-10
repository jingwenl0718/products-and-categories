<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center">New Category</h1>
		<a href="/">Home</a>
		<hr/>
		<form:form action="/categories/new" method="POST" modelAttribute="newCategory" class="form col-7 mt-5">
	   		<p>
	   			<form:label class="h5" path="name">Name: </form:label>
	   			<form:input class="ml-5 form-control" path="name"/>
	   			<form:errors style="color:red" path="name"/>
	   		</p>
		   	<button class="btn btn-danger" type="submit">Submit</button>
	   </form:form>
	</div>
</body>
</html>
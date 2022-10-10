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
		<h1 class="text-center"><c:out value="${oneCategory.name }"/></h1>
		<a href="/">Home</a>
		<hr/>
		<h2>Categories:</h2>
		<c:forEach var="eachProduct" items="${oneCategory.products }">
			<p>- <c:out value="${eachProduct.name }"/></p>
		</c:forEach>
		<hr/>
		<form class="form" action="/categories/${oneCategory.id }/edit" method="POST">
		<input type="hidden" name="_method" value="put"/>
			<label class="form-label h2">Add Product:</label>
			<select class="form-control" name="productId">
				<c:forEach var="eachProduct" items="${allProductList }">
					<c:choose>
						<c:when test="${!eachProduct.categories.contains(oneCategory) }">
							<option value="${eachProduct.id }"><c:out value="${eachProduct.name }"/></option>
						</c:when>
					</c:choose>
				</c:forEach>
			</select>
			<button class="form-control mt-3 btn btn-primary" type="submit">Submit</button>
		</form>
	</div>

</body>
</html>
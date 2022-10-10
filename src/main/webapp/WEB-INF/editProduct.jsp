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
		<h1 class="text-center"><c:out value="${oneProduct.name }"/></h1>
		<a href="/">Home</a>
		<hr/>
		<h2>Categories:</h2>
		<c:forEach var="eachCategory" items="${oneProduct.categories }">
			<p>- <c:out value="${eachCategory.name }"/></p>
		</c:forEach>
		<hr/>
		<form class="form" action="/products/${oneProduct.id }/edit" method="POST">
		<input type="hidden" name="_method" value="put"/>
			<label class="form-label h2">Add Category:</label>
			<select class="form-control" name="categoryId">
				<c:forEach var="eachCategory" items="${allCategoryList }">
					<c:choose>
						<c:when test="${!eachCategory.products.contains(oneProduct) }">
							<option value="${eachCategory.id }"><c:out value="${eachCategory.name }"/></option>
						</c:when>
					</c:choose>
				</c:forEach>
			</select>
			<button class="form-control mt-3 btn btn-primary" type="submit">Submit</button>
		</form>
	</div>

</body>
</html>
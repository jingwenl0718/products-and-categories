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
		<h1 class="text-center">Home Page</h1>
		<a href="/products/new">New Product</a><br/>
		<a href="/categories/new">New Category</a>
		<hr/>
		<table class="table border border-dark">
			<thead>
				<tr>
					<th>Products</th>
					<th>Categoriess</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ul>
							<c:forEach var="eachProduct" items="${allProductList}">
	   							<li><a href="/products/${eachProduct.id }"><c:out value="${eachProduct.name }"/></a></li>
	   						</c:forEach>
						</ul>
					</td>
					<td>
						<ul>
							<c:forEach var="eachCategory" items="${allCategoryList}">
	   							<li><a href="/categories/${eachCategory.id }"><c:out value="${eachCategory.name }"/></a></li>
	   						</c:forEach>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
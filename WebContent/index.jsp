<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="icon"
	href="https://img.freepik.com/free-vector/abstract-green-tree-logo_1025-322.jpg">
<link rel="stylesheet" href="style.css">
<%@include file="component/head.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<%@include file="component/nav.jsp"%>

	<section class="content my-2">
		<div class="container bg-light">
			<!-- Sản phẩm -->
			<div class="product_category">
				<h4>Sản phẩm mới</h4>
			</div>
			<div class="row py-3">
				<%
				List<Product> products = ProductDao.getAll();
				for (Product pd : products) {
				%>
				<div class="col-3 mb-3">
					<div class="card">
						<a href="product-detail?id=<%out.print(pd.getId());%>"> <img
							src="images/<% out.print(pd.getImage()); %>"
							class="card-img-top" alt="Fissure in Sandstone" />
						</a>
						<div class="card-body text-center">
							<a class="text-success" href="product-detail?id=<%out.print(pd.getId());%>">
								<h5 class="card-title">
									<%
									out.print(pd.getName());
									%>
								</h5>
							</a>
							<p class="card-text">
								<%
								NumberFormat formatter = NumberFormat.getCurrencyInstance();
								String moneyString = formatter.format(pd.getPrice());
								out.print(moneyString);
								%>
							</p>
							<a href="add-to-cart?id=<%out.print(pd.getId());%>"
								class="btn btn-sm"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>
	<%@include file="component/footer.jsp"%>
</body>
</html>
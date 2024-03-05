<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản Phẩm</title>
<%@include file="component/head.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<%
	NumberFormat formatter = NumberFormat.getCurrencyInstance();
	%>
	<div class="content">
		<div class="container">
			<div class="row py-4">
				<div class="col-3">
					<%@include file="component/category.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<%
						ArrayList<Product> pds = (ArrayList<Product>) request.getAttribute("products");
						if (pds.size() > 0) {
							for (Product pd : pds) {
						%>
						<div class="col-3 mb-3">
							<div class="card">
								<a href="product-detail?id=<%out.print(pd.getId());%>"> <img
									src="images/<% out.print(pd.getImage()); %>"
									class="card-img-top" alt="Fissure in Sandstone" />
								</a>
								<div class="card-body">
									<a class="text-dark" href="product-detail?id=<%out.print(pd.getId());%>">
										<h5 class="card-title">
											<%
											out.print(pd.getName());
											%>
										</h5>
									</a>
									<p class="card-text">
										<%
										out.print(formatter.format(pd.getPrice()));
										%>
									</p>
								</div>
							</div>
						</div>
						<%
						}
						} else {
						%>
						<p class="text-danger text-center fw-bold">Không tìm thấy sản
							phẩm</p>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<%@include file="component/head.jsp"%>
</head>
<body>
	<%
	Product pd = (Product) session.getAttribute("product_detail");
	%>

	<%@include file="component/header.jsp"%>
	<div class="content">
		<div class="container">
			<div class="row py-4">
				<div class="col-5">
					<img
						src="images/<% out.print(pd.getImage()); %>"
						class="card-img-top w-100 rounded rounded-4 shadow"
						alt="Fissure in Sandstone" />
				</div>
				<div class="col-7 p-3">
					<h2>
						<%
						out.print(pd.getName());
						%>
					</h2>
					<h5 class="text-danger fw-bold">
						<%
						NumberFormat formatter = NumberFormat.getCurrencyInstance();
						out.print(formatter.format(pd.getPrice()));
						%>
					</h5>
					<form action="add-to-cart" class="d-flex">
						<input name="id" value="<% out.print(pd.getId()); %>" type="hidden">
						<input type="number" name="quantity" class="form-control w-25" value="1" min="1" 
						max="<% out.print(pd.getStock()); %>">
						<button type="submit" class="btn btn-sm btn-success"> <i class="fas fa-cart-plus"></i> </button>
					</form>
					<hr>
						<p class="text-secondary">
							<%
							out.print(pd.getDescription());
							%></p>
							<hr>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
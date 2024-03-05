<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<link rel="icon"
	href="https://img.freepik.com/free-vector/abstract-green-tree-logo_1025-322.jpg">
<%@include file="component/head.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<%
	List<Cart> cart_list = (List<Cart>) session.getAttribute("cart_list");
	List<Cart> cartProduct = null;

	int total = 0;
	if (cart_list != null) {
		cartProduct = ProductDao.getCartProducts(cart_list);
		request.setAttribute("cart-list", cart_list);
		total = ProductDao.getTotalPrice(cart_list);
	}
	NumberFormat formatter = NumberFormat.getCurrencyInstance();
	%>
	<div class="content">
		<div class="container">
			<div class="row py-4">
				<div class="col-12">
					<form action="checkout" method="post">
						<div class="row bg-white d-flex justify-content-between">
							<h4 class="text-center text-success mb-5">THANH TOÁN</h4>

							<div class="col-6">
								<h6 class="fw-bold">THÔNG TIN THANH TOÁN</h6>
								<input type="hidden" value="<%out.print(auth.getId());%>">
								<div class="form-group mb-2">
									<label class="form-label">Họ tên</label> <input type="text"
										name="name" disabled value="<%out.print(auth.getName());%>"
										class="form-control">
								</div>
								<div class="form-group mb-2">
									<label class="form-label">Email</label> <input type="email"
										name="email" disabled
										value="<%out.print(auth.getEmail());%>" class="form-control">
								</div>
								<div class="form-group mb-2">
									<label class="form-label">Địa chỉ giao hàng</label> <input
										type="text" value="<%out.print(auth.getAddress());%>"
										name="address" class="form-control">
								</div>
								<div class="form-group mb-2">
									<label class="form-label">Số điện thoại</label> <input value=""
										name="phone" class="form-control">

								</div>
								<div class="form-group mb-2">
									<label class="form-label">Ghi chú</label>
									<textarea class="form-control" name="note" id="" cols="30"
										rows="5"
										placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay địa điểm giao hàng chi tiết hơn."></textarea>
								</div>
							</div>
							<div class="col-5 border border-1 border-success p-3">
								<h6 class="fw-bold">ĐƠN HÀNG CỦA BẠN</h6>
								<table class="table">
									<tbody>
										<tr>
											<td class="fw-bold">SẢN PHẨM</td>
											<td class="fw-bold">TẠM TÍNH</td>
										</tr>
										<%
										for (Cart c : cartProduct) {
										%>
										<tr>
											<td>
												<%
												out.print(c.getName());
												%> x <%
												out.print(c.getQuantity());
												%>
											</td>
											<td>
												<%
												out.print(formatter.format(c.getPrice() * c.getQuantity()));
												%>
											</td>
										</tr>
										<%
										}
										%>
										<tr>
											<td class="fw-bold">TỔNG</td>
											<td>
												<%
												out.print(formatter.format(total));
												%>
											</td>
										</tr>
									</tbody>
								</table>
								<h6 class="fw-bold">CHỌN PHƯƠNG THỨC THANH TOÁN</h6>
								<div class="form group">
									<input type="radio" name="method" checked value="0"
										class="mt-3"> <span>Thanh toán khi nhận hàng</span>
								</div>
								<button class="btn btn-success mt-3">ĐẶT HÀNG</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>
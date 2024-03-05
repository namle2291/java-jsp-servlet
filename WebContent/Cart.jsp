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
<title>Giỏ hàng</title>
<link rel="icon"
	href="https://img.freepik.com/free-vector/abstract-green-tree-logo_1025-322.jpg">
<%@include file="component/head.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>
	<%
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart_list");
	List<Cart> cartProduct = null;
	int total = 0;
	if (cart_list != null) {
		cartProduct = ProductDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
		total = ProductDao.getTotalPrice(cart_list);
	}
	NumberFormat formatter = NumberFormat.getCurrencyInstance();
	%>
	<div class="content">
		<div class="container">
			<div class="row py-4">
				<div class="col-12">
					<table class="table table-sm table-bordered mt-2">
						<thead style="background: var(--header_color);" class="text-light">
							<tr>
								<th>#</th>
								<th>Tên sản phẩm</th>
								<th>Hình ảnh</th>
								<th>Số lượng</th>
								<th>Giá</th>
								<th>Thành tiền</th>
								<th>Xóa</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (cart_list != null) {
								for (Cart c : cartProduct) {
							%>
							<tr>
								<td>
									<%
									out.print(c.getId());
									%>
								</td>
								<td>
									<%
									out.print(c.getName());
									%>
								</td>
								<td>
									<img width="100" src="images/<% out.print(c.getImage()); %>">
								</td> 
								<td>
									<form action="update-quantity" class="d-flex">
										<input type="hidden" name="id"
											value="<%out.print(c.getId());%>"> <input
											name="quantity" min="1" type="number" style="width: 100px;"
											class="form-control" value="<%out.print(c.getQuantity());%>">
										<button class="btn btn-sm  fs-6 text-primary" type="submit">
											<i class="fas fa-save"></i>
										</button>
									</form>
								</td>
								<td>
									<%
									out.print(formatter.format(c.getPrice()));
									%>
								</td>
								<td>
									<%
									out.print(formatter.format(c.getQuantity() * c.getPrice()));
									%>
								</td>
								<td><a class="btn btn-sm text-danger fs-6"
									href="remove-from-cart?id=<%out.print(c.getId());%>"> <i
										class="fas fa-trash-alt"></i>
								</a></td>
							</tr>
							<%
							}
							%>
							<tr>
								<td colspan="5"></td>
								<td class="fs-6 text-danger fw-bold">Tổng tiền: <%
								out.print(formatter.format(total));
								%></td>
							</tr>
							<tr>
								<td colspan="6"><a href="index.jsp"
									class="btn btn-sm btn-danger"> <i class="fas fa-arrow-left"></i>
										Trang chủ
								</a> <a href="checkout" class="btn btn-sm btn-success">Thanh
										toán <i class="fas fa-dollar-sign"></i>
								</a></td>
							</tr>
							<%
							} else {
							%>
							<tr>
								<td colspan="6"><p class="text-center text-danger">Chưa có sản phẩm
										nào trong giỏ hàng!</p></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>
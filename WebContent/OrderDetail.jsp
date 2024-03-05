<%@page import="java.text.NumberFormat"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QL Đơn Hàng</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<%@include file="component/ad/nav.jsp"%>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="page-header"></div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<%
					NumberFormat formatter = NumberFormat.getCurrencyInstance();
					List<OrderDetail> order_detail = (List<OrderDetail>) session.getAttribute("order_detail");
					if (order_detail != null) {
						request.setAttribute("order_detail", order_detail);
					}
					%>
					<table class="table table-hover table-bordered table-stripped">
						<thead class="bg-primary text-light">
							<tr>
								<th>#</th>
								<th>Tên sản phẩm</th>
								<th>Hình ảnh</th>
								<th>Giá</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (order_detail.size() > 0) {
								for (OrderDetail odt : order_detail) {
							%>
							<tr>
								<td>
									<%
									out.print(odt.getId());
									%>
								</td>
								<td>
									<%
									out.print(odt.getProduct().getName());
									%>
								</td>
								<td><img alt="" width="100"
									src="images/<%out.print(odt.getProduct().getImage());%>">
								</td>
								<td>
									<%
									out.print(formatter.format(odt.getProduct().getPrice()));
									%>
								</td>
								<td>
									<%
									out.print(odt.getQuantity());
									%>
								</td>
								<td>
									<%
									out.print(formatter.format(odt.getQuantity() * odt.getProduct().getPrice()));
									%>
								</td>
								<td><a href="delete-order-detail?id=<% out.print(odt.getId()); %>" class="btn btn-sm btn-danger"> <i
										class="fas fa-trash-alt"></i>
								</a></td>
							</tr>
							<%
							}
							} else {
							%>
								<tr class="text-center text-danger">
									<td colspan="7">Không tìm thấy sản phẩm!</td>
								</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<a href="OrderManager.jsp" class="btn btn-sm btn-danger">Quay lại</a>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<%@include file="component/ad/footer.jsp"%>
</body>
</html>
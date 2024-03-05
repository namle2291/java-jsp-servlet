
<%@page import="dao.OrderStatusDao"%>
<%@page import="model.OrderStatus"%>
<%@page import="dao.OrderDao"%>
<%@page import="model.Order"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập Nhật Đơn Hàng</title>
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
					Order od = (Order) session.getAttribute("order_edit");
					if (od != null) {
						request.setAttribute("order_edit", od);
					}
					// Get List Order Status;
					List<OrderStatus> ods = OrderStatusDao.getAll();
					%>
					<div class="col-md-6">
						<form action="edit-order" method="post">
							<input name="id" type="hidden" value="<% out.print(od.getId()); %>">
							<div class="form-group">
								<label class="form-label">Tổng tiền</label> <input type="number"
									class="form-control" min="0"
									value="<%out.print(od.getTotal());%>" name="total">
							</div>
							<div class="form-group">
								<label class="form-label">Phương thức thanh toán</label> <select
									name="method" class="form-control">
									<option value="0" selected>Thanh toán khi nhận hàng</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-label">Trạng thái</label> <select
									name="status_id" class="form-control">
									<% for(OrderStatus o:ods){%>
										<option value="<% out.print(o.getId()); %>"> <% out.print(o.getId()); %> - <% out.print(o.getName()); %></option>
									<%}%>
								</select>
							</div>
							<div class="form-group">
								<label class="form-label">Ghi chú</label>
								<textarea name="note" class="form-control" rows="4" cols=""><%out.print(od.getNote());%></textarea>
							</div>
							<a href="order-manager" class="btn btn-sm btn-danger">Thoát</a>
							<button type="submit" class="btn btn-sm btn-primary">Lưu</button>
						</form>
					</div>
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

<%@page import="java.text.NumberFormat"%>
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
					List<Order> order = OrderDao.getAll();
					NumberFormat formatter = NumberFormat.getCurrencyInstance();
					%>
					<table class="table table-hover table-bordered table-stripped">
						<thead class="bg-primary text-light">
							<tr>
								<th>#</th>
								<th>Khách hàng</th>
								<th>Tổng tiền</th>
								<th>Phương thức thanh toán</th>
								<th>Trạng thái</th>
								<th>Ghi chú</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
							int index = 0;
							if (order.size() > 0) {
								for (Order o : order) {
									index-=-1;
							%>
							<tr>
								<td>
									<%
									out.print(index);
									%>
								</td>
								<td style="display: flex; align-items: center;">
								<img
									style="border-radius: 50%; border: 2px solid #337ab7;" alt="" width="50" height="50"
									src="avatars/<%out.print(o.getUser().getAvatar());%>">
									<div>
										<ul style="margin: 0; padding: 0 20px; font-size: 13px;">
											<li>
												<%
												out.print(o.getUser().getName());
												%>
											</li>
											<li>
												<%
												out.print(o.getUser().getEmail());
												%>
											</li>
											<li>
												<%
												out.print(o.getUser().getAddress());
												%>
											</li>
										</ul>
									</div></td>
								<td>
									<%
									out.print(formatter.format(o.getTotal()));
									%>
								</td>
								<td>
									<%
									if (o.getMethod() == 0) {
									%> <span class="badge">Thanh toán khi nhận hàng</span> <%
									 }
									 %>
								</td>
								<td>
								<span style="background: <% out.print(o.getStatus().getColor()); %>; font-size: 13px; padding: 8px; color: white; border-radius: 5px;"><% out.print(o.getStatus().getName()); %></span>
								</td>
								<td>
									<%
									out.print(o.getNote());
									%>
								</td>
								<td><a href="order-detail?id=<%out.print(o.getId());%>"
									class="btn btn-sm btn-primary"> <i class="fas fa-eye"></i>
								</a> <a href="edit-order?id=<%out.print(o.getId());%>" class="btn btn-sm btn-warning"> <i
										class="fas fa-pen"></i>
								</a> <a onclick="return confirm('are you sure?');" href="delete-order?id=<%out.print(o.getId());%>"
									class="btn btn-sm btn-danger"> <i class="fas fa-trash-alt"></i>
								</a></td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
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
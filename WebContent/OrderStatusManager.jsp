<%@page import="dao.OrderStatusDao"%>
<%@page import="model.OrderStatus"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QL Trạng Thái Đơn Hàng</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<%
	List<OrderStatus> ods = (List<OrderStatus>) OrderStatusDao.getAll();
	if (ods.size() > 0) {
		request.setAttribute("ods", ods);
	}
	
	OrderStatus ods_edit = (OrderStatus) request.getAttribute("ods_edit");
	if(ods_edit!=null){
		request.setAttribute("ods_edit", ods_edit);		
	}
	
	%>
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
					<div class="col-md-5">
						<form action="order-status-manager" method="post">
							<input type="hidden" name="id" value="${ods_edit.id }">
							<div class="form-group">
								<label class="form-label">Tên trạng thái</label> <input
									class="form-control" value="${ods_edit.name}" name="name">
							</div>
							<div class="form-group">
								<label class="form-label">Màu sắc</label> <input
									class="form-control" value="${ods_edit.color}" type="color" name="color">
							</div>
							<button class="btn btn-sm btn-primary">Lưu</button>
						</form>
					</div>
				</div>
				<br>
				<div class="row mt-2">
					<div class="col-md-6">
						<table class="table table-hover table-bordered table-stripped">
							<thead class="bg-primary text-light">
								<tr>
									<th>#</th>
									<th>Tên</th>
									<th>Màu sắc</th>
									<th>Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="o" items="${ods}">
									<tr>
										<td>${o.getId()}</td>
										<td>${o.getName()}</td>
										<td><span style="background: ${o.getColor()}; font-size: 13px; padding: 8px; color: white; border-radius: 5px;">${o.getColor()}</span>
										</td>
										<td><a href="order-status-manager?id=${o.getId()}" class="btn btn-sm btn-success">
												<i class="fas fa-pen"></i>
										</a> <a href="delete-order-status?id=${o.getId()}" class="btn btn-sm btn-danger">
												<i class="fas fa-trash-alt"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
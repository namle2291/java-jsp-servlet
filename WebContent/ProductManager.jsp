<%@page import="dao.ProductDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QL Sản Phẩm</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<%@include file="component/ad/nav.jsp"%>

		<%
		List<Product> product = ProductDao.getAll();
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		int index = 0;
		%>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
						<div class="page-header">
							<a href="add-product" class="btn btn-sm btn-success"> Thêm <i
								class="fas fa-plus"></i>
							</a>
						</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<table class="table table-hover table-bordered table-stripped">
						<thead class="bg-primary text-light">
							<tr>
								<th>#</th>
								<th>Tên sản phẩm</th>
								<th>Số lượng</th>
								<th>Hình ảnh</th>
								<th>Giá</th>
								<th>Danh mục</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (product != null) {
								for (Product pd : product) {
									index-=-1;
							%>
							<tr>
								<td>
									<%
									out.print(index);
									%>
								</td>
								<td>
									<%
									out.print(pd.getName());
									%>
								</td>
								<td>
									<%
									out.print(pd.getStock());
									%>
								</td>
								<td>
									<img alt="" width="100" src="images/<% out.print(pd.getImage()); %>">
								</td>
								<td>
									<%
									out.print(formatter.format(pd.getPrice()));
									%>
								</td>
								<td>
									<%
									out.print(pd.getCategory().getName());
									%>
								</td>
								<td><a href="" class="btn btn-sm btn-primary"> <i
										class="fas fa-eye"></i>
								</a> <a href="update-product?id=<% out.print(pd.getId()); %>" class="btn btn-sm btn-warning"> <i
										class="fas fa-pen"></i>
								</a> <a href="delete-product?id=<% out.print(pd.getId()); %>" class="btn btn-sm btn-danger"> <i
										class="fas fa-trash-alt"></i>
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
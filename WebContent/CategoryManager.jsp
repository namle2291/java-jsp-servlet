<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QL Danh Mục</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<%@include file="component/ad/nav.jsp"%>

		<%
		List<Category> category = CategoryDao.getAll();
		if (category != null) {
			session.setAttribute("category", category);
		}
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		int index = 0;
		%>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="page-header">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#categoryModel">
							Thêm <i class="fas fa-plus"></i>
						</button>

					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<table class="table table-hover table-bordered table-stripped">
						<thead class="bg-primary text-light">
							<tr>
								<th>#</th>
								<th>Tên danh mục</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Category c : category) {
							%>
							<tr>
								<td>
									<%
									out.print(index -= -1);
									%>
								</td>
								<td><% out.print(c.getName()); %></td>
								<td><a href="update-category?id=<% out.print(c.getId()); %>"
									class="btn btn-sm btn-warning"> <i class="fas fa-pen"></i>
								</a> <a href="delete-category?id=<% out.print(c.getId()); %>"
									class="btn btn-sm btn-danger"> <i class="fas fa-trash-alt"></i>
								</a></td>
							</tr>

							<%
							}
							%>
						</tbody>
					</table>
				</div>
				<!-- /.row -->

				<!-- Modal -->
				<div class="modal fade" id="categoryModel" tabindex="-1" role="dialog"
					aria-labelledby="categoryModelLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<form action="add-category" method="post">
								<div class="modal-header">
									<h5 class="modal-title" id="categoryModelLabel">Thêm danh
										mục</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="form-label">Tên danh mục</label> <input
											class="form-control" required="required" name="name">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Đóng</button>
									<button type="submit" class="btn btn-primary">Lưu</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<%@include file="component/ad/footer.jsp"%>
</body>
</html>
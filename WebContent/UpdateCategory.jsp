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
<title>Cập Nhật Danh Mục</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%
		Category c = (Category) session.getAttribute("category_edit");
		%>
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
					<div class="col-md-4">
						<form action="update-category" method="post">
							<div class="form-group mb-2">
								<label class="form-label">Tên danh mục</label> <input name="id"
									type="hidden" value="<% out.print(c.getId()); %>"> <input name="name"
									class="form-control" value="<% out.print(c.getName()); %>">
							</div>
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
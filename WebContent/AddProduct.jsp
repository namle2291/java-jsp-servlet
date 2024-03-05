<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sản Phẩm</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<%
	List<Category> category = CategoryDao.getAll();
	if (category != null) {
		session.setAttribute("category", category);
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
				<form action="add-product" method="POST"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-6 border">
							<div class="form-group">
								<label class="form-label">Tên sản phẩm</label> <input
									type="text" name="name" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Giá</label> <input type="number"
									name="price" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Số lượng</label> <input type="number"
									name="stock" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Mô tả</label>
								<textarea rows="10" name="description" id="editor1"></textarea>
							</div>
							<a class="btn btn-sm btn-danger" href="ProductManager.jsp"> <i
								class="fas fa-arrow-left"></i>
							</a>
							<button type="submit" class="btn btn-sm btn-primary mt-3">Lưu</button>
						</div>
						<div class="col-lg-6 border">
							<div class="form-group">
								<label class="form-label">Danh mục</label> <select
									name="category_id" class="form-control">
									<option selected disabled>--- Chọn một danh mục ---</option>
									<%
									for (Category c : category) {
									%>
									<option value="<%out.print(c.getId());%>">
										<%
										out.print(c.getName());
										%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="form-group">
								<label class="form-label">Hình ảnh</label> <input type="file"
									name="image" id="file" class="form-control">
									
									<img alt="" id="img_preview"  style="margin-top: 10px;" width="200" src="">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="component/ad/footer.jsp"%>
</body>
</html>
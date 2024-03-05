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
<title>Cập nhật Sản Phẩm</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<%
	List<Category> category = CategoryDao.getAll();
	if (category != null) {
		session.setAttribute("category", category);
	}
	Product pd = (Product) session.getAttribute("product");
	if (pd != null) {
		request.setAttribute("product", pd);
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
				<form action="update-product" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%out.print(pd.getId());%>">
					<div class="row">
						<div class="col-lg-6 border">
							<div class="form-group">
								<label class="form-label">Tên sản phẩm</label> <input
									type="text" name="name" value="<%out.print(pd.getName());%>"
									class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Giá</label> <input type="number"
									name="price" value="<%out.print(pd.getPrice());%>"
									class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Số lượng</label> <input type="number"
									name="stock" value="<%out.print(pd.getStock());%>"
									class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Mô tả</label>
								<textarea rows="10" name="description" id="editor1">
									<%
									out.print(pd.getDescription());
									%>
								</textarea>
							</div>
							<a class="btn btn-sm btn-danger" href="ProductManager.jsp"> <i
								class="fas fa-arrow-left"></i>
							</a>
							<button type="submit" class="btn btn-sm btn-primary mt-3">Lưu</button>
						</div>
						<div class="col-lg-6 border">
							<div class="form-group">
								<label class="form-label">Danh mục</label> <select
									required="required" name="category_id" class="form-control">
									<option selected disabled>--- Chọn một danh mục ---</option>
									<c:forEach var="c" items="${category}">
										<option value="${ c.id }">${c.name}</option>
									</c:forEach>
								</select>

							</div>
							<div class="form-group">
								<label class="form-label">Hình ảnh</label> <input type="file"
									name="image" class="form-control" id="file">
									<img alt="" id="img_preview" src="images/<% out.print(pd.getImage()); %>" style="margin-top: 10px;" width="200" src="">
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
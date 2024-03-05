<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Người Dùng</title>
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
				<form action="add-user" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-label">Họ tên</label> <input required="required" name="name"
									class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Email</label> <input required="required" name="email"
									class="form-control" type="email">
							</div>
							<div class="form-group">
								<label class="form-label">Address</label> <input required="required" name="address"
									class="form-control">
							</div>
							<a href="UserManager.jsp" class="btn btn-sm btn-danger">Thoát</a>
							<button class="btn btn-primary btn-sm">Lưu</button>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-label">Password</label> <input required="required" name="password"
									class="form-control" type="password">
							</div>
							<div class="form-group">
								<label class="form-label">Hình ảnh</label> <input type="file"
									name="image" class="form-control" id="file">
									<img alt="" id="img_preview" style="margin-top: 10px;" width="200" src="">
							</div>
						</div>
					</div>
				</form>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<%@include file="component/ad/footer.jsp"%>
</body>
</html>
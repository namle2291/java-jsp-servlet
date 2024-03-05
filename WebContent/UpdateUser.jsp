<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập Nhật Người Dùng</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
	<%
		User u = (User) session.getAttribute("user_edit");
		if(u!=null){
			request.setAttribute("user_edit", u);
		}
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
				<form action="edit-user" method="post" enctype="multipart/form-data">
					<input type="hidden" value="<% out.print(u.getId()); %>" name="id">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-label">Họ tên</label> <input required="required" name="name"
									class="form-control" value="<% out.print(u.getName()); %>">
							</div>
							<div class="form-group">
								<label class="form-label">Email</label> <input required="required" name="email"
									class="form-control" value="<% out.print(u.getEmail()); %>" type="email">
							</div>
							<div class="form-group">
								<label class="form-label">Address</label> <input required="required" name="address"
									class="form-control" value="<% out.print(u.getAddress()); %>">
							</div>
							<a href="UserManager.jsp" class="btn btn-sm btn-danger">Thoát</a>
							<button class="btn btn-primary btn-sm">Lưu</button>
						</div>
						<div class="col-md-6">
						
							<div class="form-group">
								<label class="form-label">Hình ảnh</label> <input type="file"
									name="image" class="form-control" id="file">
									<img alt="" id="img_preview" src="avatars/<% out.print(u.getAvatar()); %>" style="margin-top: 10px;" width="200" src="">
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
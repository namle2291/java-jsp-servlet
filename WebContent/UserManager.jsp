
<%@page import="dao.UserDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QL Người Dùng</title>
<%@include file="component/ad/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%
			List<User> user = UserDao.getAll();
			int index=0;
		%>
		<!-- Navigation -->
		<%@include file="component/ad/nav.jsp"%>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="page-header">
						<a href="add-user" class="btn btn-sm btn-primary">Thêm <i class="fas fa-plus"></i> </a>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<table class="table table-hover table-bordered table-stripped">
						<thead class="bg-primary text-light">
							<tr>
								<th>#</th>
								<th>Tên</th>
								<th>Avatar</th>
								<th>Email</th>
								<th>Địa chỉ</th>
								<th>Admin</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (user.size() > 0) {
								for (User u : user) {
							%>
							<tr>
								<td><% out.print(index-=-1); %></td>
								<td><% out.print(u.getName()); %></td>
								<td>
									<img
									style="border-radius: 50%; border: 2px solid #337ab7;" alt="" width="60" height="60"
									src="avatars/<%out.print(u.getAvatar());%>">
								</td>
								<td><% out.print(u.getEmail()); %></td>
								<td><% out.print(u.getAddress()); %></td>
								<td>
									<% if(u.getIs_admin() == 1){ %>	
										<span class="text-success"><i class="fas fa-check fw-bold"></i> </span>
									<%}else{%>
										<span class="text-danger"><i class="fas fa-times fw-bold"></i> </span>									
									<%} %>
								</td>
								<td><a href="edit-user?id=<% out.print(u.getId()); %>"
									class="btn btn-sm btn-warning"> <i class="fas fa-pen"></i>
								</a> <a href="delete-user?id=<% out.print(u.getId()); %>" class="btn btn-sm btn-danger">
										<i class="fas fa-trash-alt"></i>
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
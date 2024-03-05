<%@page import="dao.OrderDao"%>
<%@page import="dao.CategoryDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
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
					<div class="col-lg-12">
						<h3 class="page-header text-center">
							Welcome to dashboard!
							<%
						out.print(auth.getName());
						%>
						</h3>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<%
					int users = UserDao.getAll().size();
					int products = ProductDao.getAll().size();
					int categories = CategoryDao.getAll().size();
					int orders = OrderDao.getAll().size();
					%>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-user fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<%
											out.print(users);
											%>
										</div>
										<div>Tài khoản</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Xem chi tiết</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<%
											out.print(products);
											%>
										</div>
										<div>Sản phẩm</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Xem chi tiết</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-list fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<%
											out.print(categories);
											%>
										</div>
										<div>Danh mục</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Xem chi tiết</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<%
											out.print(orders);
											%>
										</div>
										<div>Đơn hàng</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Xem chi tiết</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	<%@include file="component/ad/footer.jsp"%>
</body>
</html>
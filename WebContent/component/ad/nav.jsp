<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">
			Plant Shop
		</a>
	</div>

	<button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>

	<ul class="nav navbar-nav navbar-left navbar-top-links">
		<li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>
				Website</a></li>
	</ul>

	<ul class="nav navbar-right navbar-top-links">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user-shield fa-fw"></i>
				<%
				out.print(auth.getName());
				%> <b class="caret"></b>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="dang-xuat"><i class="fa fa-sign-out fa-fw"></i>
						Đăng xuất</a></li>
			</ul></li>
	</ul>

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
				<% 
					String pg = (String) request.getServletPath().split("\\.")[0];
				%>
				
				<li><a href="Dashboard.jsp"><i class="fa fa-table fa-fw"></i>
						Dashboard</a>
				</li>
				<li class=''><a href="#"><i class="fa fa-list fa-fw"></i>
						QL Danh mục<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active" href="category-manager">Danh sách</a></li>
					</ul>
				</li>
				<li class=""><a href="#"><i class="fa fa-shop fa-fw"></i>
						QL Sản Phẩm<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active" href="product-manager">Danh sách</a></li>
					</ul>
				</li>
				<li class=""><a href="#"><i class="fa fa-user fa-fw"></i>
						QL Người Dùng<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active" href="user-manager">Danh sách</a></li>
					</ul>
				</li>
				<li class=""><a href="#"><i class="fa fa-shopping-cart fa-fw"></i>
						QL Đơn Hàng<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active" href="order-status-manager">Trạng thái</a></li>
					</ul>
					<ul class="nav nav-second-level">
						<li><a class="active" href="order-manager">Danh sách</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
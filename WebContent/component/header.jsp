<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="fb-root"></div>

<span class="back_to_top"><i class="fas fa-chevron-circle-up"></i></span>
<div class="top">
	<div class="container">
		<div class="row py-1 text-light">
			<div class="col-lg-6">
				<ul class="m-0 p-0 d-flex" style="list-style: none">
					<li class="me-2"><i class="fas fa-phone"></i> 0123.456.789 (Hà
						Nội)</li>
					<li><i class="fas fa-phone"></i> 0123.456.789 (Sài Gòn)</li>
				</ul>
			</div>
			<div class="col-lg-6">
				<ul class="m-0 p-0 d-flex justify-content-end"
					style="list-style: none">
					<li class="me-2">Thanh toán</li>
					<li>Địa chỉ</li>
					<li class="mx-2"><i class="fab fa-facebook"></i></li>
					<li class="mx-2"><i class="far fa-envelope"></i></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<header>
	<div class="container">
		<div class="row py-2 d-flex align-items-center">
			<div class="col-lg-3">
				<div class="logo">
					<h2 class="m-0" style="color: var(--header_color)">
						<a href="index.jsp" style="color: var(--header_color);">Plant Shop <i class="fab fa-pagelines"></i>
						</a>
					</h2>
				</div>
			</div>
			<div class="col-lg-5">
				<form action="search" method="get" class="search_form">
					<div class="search_box">
						<input type="text" name="key" class="search_input"
							placeholder="Tìm kiếm sản phẩm..." />
						<button class="search_btn">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="col-lg-4">
				<div class="login">
					<ul class="m-0 p-0 d-flex justify-content-end align-items-center"
						style="list-style: none">
						<%
						User auth = (User) request.getSession().getAttribute("auth");
						if (auth != null) {
							request.setAttribute("auth", auth);
						}
						%>
						<li class="me-2">
						<%
							if (request.getAttribute("auth") != null) {%>
						<div class="dropdown">
							<button class="dropdown-toggle text-success fw-bold" style="background: none; border:none; outline:none;" type="button"
								id="dropdownMenuButton" data-mdb-toggle="dropdown"
								aria-expanded="false">
									<img alt="" src="avatars/${auth.getAvatar() }" style="border-radius: 50%; border: 2px solid #2e89ff;" width="40" height="40"> 
								 
								<% out.print(auth.getName()); %></button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<%
									if(auth.getIs_admin() == 1){%>
									<li><a class="dropdown-item" href="Dashboard.jsp">Trang quản trị</a></li>
								<%}%>
								<li><a class="dropdown-item" href="dang-xuat">Đăng xuất</a></li>
							</ul>
						</div>
						<%
							} else {
								out.print("<a class='text-dark' href='Login.jsp'>Đăng nhập</a>");
							}
						%>
						</li>
						<li class="me-2"><a class="text-dark" href="Cart.jsp"><i
								class="fas fa-shopping-cart"></i> <sup style="font-size: 13px;">
									<span class="fw-bold">[${ cart_list.size()>0 ? cart_list.size() : 0 }]</span>
							</sup></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
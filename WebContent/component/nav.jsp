<%@page import="model.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="navigation">
	<div class="container">
		<div class="row bg-light shadow-sm">
			<div class="col-lg-3">
				<%@include file="category.jsp"%>
			</div>
			<div class="col-lg-9">
				<div class="row shadow-sm d-flex align-items-center">
					<div class="col-lg-10">
						<nav class="nav_bar">
							<ul class="nav_bar_list d-flex m-0 p-0" style="list-style: none">
								<li class="nav_bar_item pt-2 pb-2 pe-2"><a
									class="text-dark" href="">Trang chủ</a></li>
								<li class="nav_bar_item p-2"><a class="text-dark" href="san-pham">Sản phẩm</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-lg-2 text-end">
						<span class="px-3 btn rounded-pill text-light"
							style="background-color: var(--header_color)">0123.456.789</span>
					</div>
				</div>
				<div class="row my-2">
					<div id="carouselExampleControls" class="carousel slide"
						data-mdb-ride="carousel">
						<div class="carousel-inner" style="height: 350px">
							<div class="carousel-item">
								<img
									src="https://chuteu.com/wp-content/uploads/2022/01/cay-canh-mini-noi-that-van-phong.jpg"
									class="d-block w-100" alt="Wild Landscape" />
							</div>
							<div class="carousel-item active">
								<img
									src="https://web2141.sangiaodichweb.com/data/web2141/banner-2.jpg"
									class="d-block w-100" alt="Camera" />
							</div>
							<div class="carousel-item">
								<img
									src="https://media.loveitopcdn.com/6415/thumb/900x450/banner-cach-trong-chau-cay-thuy-sinh-de-ban-xinh-xan.jpg?zc=1"
									class="d-block w-100" alt="Exotic Fruits" />
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-mdb-target="#carouselExampleControls" data-mdb-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-mdb-target="#carouselExampleControls" data-mdb-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
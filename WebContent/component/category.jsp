<%@page import="model.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="category">
	<ul class="list-group rounded-0">
		<li class="list-group-item text-light"
			style="background-color: var(--header_color)" aria-current="true">
			<i class="fas fa-bars"></i> <span>DANH MỤC SẢN PHẨM</span>
		</li>
		<%
		List<Category> category = CategoryDao.getAll();
		for (Category ct : category) {
		%>
		<li class="list-group-item"><a class="text-dark" href="category?id=<% out.print(ct.getId()); %>"><% out.print(ct.getName()); %></a></li>
		<%
		}
		%>
	</ul>
</div>
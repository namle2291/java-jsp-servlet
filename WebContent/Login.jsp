<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<%@include file="component/head.jsp"%>
<style>
:root {
	--header_color: #00b214;
}

.login_box {
	margin-top: var(--header_height);
	padding: 50px 0;
	box-shadow: 11px 11px 20px 0px #dfdfdf;
	border-radius: 5px;
	border-top: 1px solid #eee;
	border-left: 1px solid #eee;
}

.login_box .login_form .login_control {
	width: auto;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border: 1px solid var(--header_color);
	margin: 25px;
}

.login_box .login_form .login_control label {
	width: 50px;
	height: 100%;
	line-height: 40px;
	text-align: center;
	background: var(--header_color);
	color: #fff;
}

.login_box .login_form .login_control .login_input {
	width: 100%;
	border: none;
	background: none;
	outline: none;
	padding: 10px 15px;
	font-size: 13px;
	caret-color: var(--header_color);
}

.login_box .login_form .login_submit {
	margin: 0 25px;
	width: auto;
	text-align: center;
}

.login_box .login_form .login_submit button {
	width: 100%;
	border: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid var(--header_color);
	transition: .3s ease-in-out;
	background: #fff;
}

.login_box .login_form .login_submit button:hover {
	background-color: var(--header_color);
	color: #fff;
}

.login_heading {
	font-family: monospace;
}
</style>
</head>
<body>
	<div>
	<%@include file="component/header.jsp"%>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-4 p-3 m-auto ">
				<div class="login_box">
					<div class="login_heading">
						<h4 class="text-center">Đăng nhập</h4>
					</div>
					<form action="login-post" method="post" class="login_form">
						<div class="login_control">
							<label for=""><i class="fa-solid fa-envelope"></i></label> <input
								type="text" name="email" class="login_input" placeholder="Nhập email">
						</div>
						<div class="login_control">
							<label for=""><i class="fa-solid fa-key"></i></label> <input
								type="password" name="password" class="login_input" placeholder="Nhập mật khẩu">
						</div>
						<div class="login_submit">
							<button>Đăng nhập</button>
							<hr>
						 <span>Chưa có tài khoản?</span><a href="Register.jsp">Đăng ký</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="component/footer.jsp"%>
</body>
</html>
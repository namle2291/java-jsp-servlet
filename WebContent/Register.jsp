<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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
						<h4 class="text-center">Đăng ký</h4>
					</div>
					<form action="register-post" class="login_form" method="post">
						<div class="login_control">
							<label for=""><i class="fa-solid fa-user"></i></label> 
							<input type="text" name="username" class="login_input" placeholder="Nhập họ tên">
						</div>
						<div class="login_control">
							<label for=""><i class="fa-solid fa-envelope"></i></label> <input
								type="text" name="email" class="login_input" placeholder="Nhập email">
						</div>
						<div class="login_control">
							<label for=""><i class="fa-solid fa-home"></i></label> <input
								type="text" name="address" class="login_input" placeholder="Nhập địa chỉ">
						</div>
						<div class="login_control">
							<label for=""><i class="fa-solid fa-key"></i></label> <input
								type="password" name="password" class="login_input" placeholder="Nhập mật khẩu">
						</div>
						<div class="login_submit">
							<button>Đăng ký</button>
							<hr>
						 <span>Đã có tài khoản?</span><a href="Login.jsp">Đăng nhập</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="component/footer.jsp"%>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous">
		
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
		integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
		crossorigin="anonymous">
		
	</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	<script src="assets/main.js"></script>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v16.0&appId=238683943543481&autoLogAppEvents=1"
		nonce="tdycEoV4"></script>
</body>
</html>
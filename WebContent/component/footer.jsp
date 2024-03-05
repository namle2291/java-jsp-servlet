<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer>
	<div class="container">
		<div class="row py-4">
			<div class="col-lg-4">
				<h5 class="fw-bold badge bg-success">Về chúng tôi</h5>
				<div class="logo my-3">
					<h2 class="m-0" style="color: var(--header_color)">
						Plant Shop <i class="fab fa-pagelines"></i>
					</h2>
				</div>
				<p style="text-align: justify">Cây Xinh là thương hiệu dẫn đầu
					trong lĩnh vực sản xuất & cung cấp các loại Cây phong thủy, cây văn
					phòng, sen đá, xương rồng & tiểu cảnh Terrarium cao cấp trang trí
					nội thất. Cây Xinh luôn cố gắng tạo ra những sản phẩm đẹp, độc đáo
					và khác biệt hoàn toàn so với thị trường. Chúng tôi biến sản phẩm
					thành những tác phẩm nghệ thuật với tất cả niềm đam mê và tâm huyết
					của mình... để đáp ứng mọi nhu cầu của khách hàng.</p>
			</div>
			<div class="col-lg-4">
				<h5 class="fw-bold badge bg-success">Hỗ trợ khách hàng</h5>
				<ul>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Hướng
							dẫn đặt hàng & thanh toán</a></li>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Chính
							sách giao hàng & đổi trả</a></li>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Thỏa
							thuận người dùng</a></li>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Chính
							sách bảo mật</a></li>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Chính
							sách đại lý</a></li>
					<li class="mb-2"><a style="color: var(--header_color)" href="">Hệ
							thống cửa hàng Cây Xinh</a></li>
				</ul>
			</div>
			<div class="col-lg-4">
				<h5 class="fw-bold badge bg-success">Fanpage</h5>
				<div class="fb-page" data-href="https://www.facebook.com/NCSfanmade"
					data-width="380" data-hide-cover="false" data-show-facepile="false"></div>
			</div>
		</div>
		<div class="row">
			<p class="text-center">Copyright 2023 © Nam Lê | Mọi hình ảnh
				trên trang web được sưu tầm</p>
		</div>
	</div>
</footer>

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
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v16.0&appId=238683943543481&autoLogAppEvents=1"
	nonce="tdycEoV4"></script>

<script type="text/javascript">
const header = document.querySelector('header');
const btn_back_to_top = document.querySelector('.back_to_top');
const search_form = document.querySelector('.search_form');

function scrollHeader() {
    window.addEventListener('scroll', (e) => {
        // Header
        if (window.scrollY > 32) {
           Object.assign(header.style, {
                top: '0px',
           });
        } else {
            Object.assign(header.style, {
                top: '32px',
           });
        }
        // Show btn back to top
        if (window.scrollY > 200) {
            btn_back_to_top.style.bottom = '5px';
        } else {
            btn_back_to_top.style.bottom = '-40px';
        }

    })
}

function backToTop() {
    btn_back_to_top.onclick = () => {
        document.documentElement.scrollTop = 0;
    }
}

scrollHeader();
backToTop();

</script>

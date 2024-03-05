<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery -->
<script src="assets/ad/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/ad/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="assets/ad/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="assets/ad/js/startmin.js"></script>

<script>
	CKEDITOR.replace('editor1');
</script>

<script>
	const file = document.querySelector("#file");
	const img_preview = document.querySelector("#img_preview");
	
	file.addEventListener("change", (e)=>{
		const file = e.target.files[0];
		const url = URL.createObjectURL(file);
		img_preview.src = url;
		img_preview.onload = ()=>{
			URL.revokeObjectURL(img_preview.src);
		}
	});
</script>
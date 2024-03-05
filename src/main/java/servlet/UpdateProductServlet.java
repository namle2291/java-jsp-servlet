package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Category;
import model.Product;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/update-product")
@MultipartConfig()
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id!=null) {
			Product product = ProductDao.productDetail(Integer.parseInt(id));
			if(product!=null) {			
				request.getSession().setAttribute("product", product);
				response.sendRedirect("UpdateProduct.jsp");
			}
		}else {
			response.sendRedirect("ProductManager.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String description = request.getParameter("description");
			String category_id = request.getParameter("category_id");
			String stock = request.getParameter("stock");
			String id = request.getParameter("id");
			
			// Upload file			
			Part part = request.getPart("image");
			String realPath = getServletContext().getRealPath("/images");

			String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectory(Path.of(realPath));
			}
			
			if(id!=null) {
				Category category = CategoryDao.selectCategory(Integer.parseInt(category_id));
					Product pd = new Product(
						name,
						filename,
						description,
						Integer.parseInt(price),
						category,
						Integer.parseInt(stock)
					);
					
					boolean result = false;
					// Xử lý nếu ko có hình ảnh thì lấy ảnh cũ
					if(part.getSize() > 0) {
						result = ProductDao.updateProduct(pd, Integer.parseInt(id));
						part.write(realPath + "/" + filename);
					}else {
						Product pd_old = ProductDao.productDetail(Integer.parseInt(id));
						pd.setImage(pd_old.getImage());
						result = ProductDao.updateProduct(pd, Integer.parseInt(id));
					}
					
					if(result) {
						response.sendRedirect("ProductManager.jsp");
					}else {
						response.sendRedirect("UpdateProduct.jsp");				
					}
					
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

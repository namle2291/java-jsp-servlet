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

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;

import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class AddProductServlet
 */
@MultipartConfig()
@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("AddProduct.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy phần đã tải lên từ yêu cầu
		try(PrintWriter out = response.getWriter()) {
			response.setContentType("text/html");
			
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String description = request.getParameter("name");
			String category_id = request.getParameter("category_id");
			String stock = request.getParameter("stock");
			
			// Upload file			
			Part part = request.getPart("image");
			String realPath = getServletContext().getRealPath("/images");

			String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectory(Path.of(realPath));
			}
			
			Category category = CategoryDao.selectCategory(Integer.parseInt(category_id));
			
			Product pd = new Product(
				name,
				filename,
				description,
				Integer.parseInt(price),
				category,
				Integer.parseInt(stock)
			);
			
			boolean result = ProductDao.insertProduct(pd);
			if(result) {
				part.write(realPath + "/" + filename);
				response.sendRedirect("ProductManager.jsp");
			}else {
				response.sendRedirect("AddProduct.jsp");				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}

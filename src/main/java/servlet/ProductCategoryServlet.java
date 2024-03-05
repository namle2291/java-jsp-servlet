package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.ProductDao;

/**
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/category")
public class ProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int id = Integer.parseInt(request.getParameter("id"));
		List<Product> products =  ProductDao.productCategory(id);
		if(request.getAttribute("products") == null) {
			request.setAttribute("products", products);
		}
		RequestDispatcher pd = request.getRequestDispatcher("Product.jsp");
		pd.forward(request, response);
	}
}

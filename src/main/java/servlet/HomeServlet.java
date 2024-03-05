package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(urlPatterns = "/")
public class HomeServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {
		case "/":
			index(request, response);
			break;	
		case "/san-pham":
			product(request, response);
			break;
		case "/dashboard":
			response.sendRedirect("Dashboard.jsp");
			break;
		case "/checkout":
			response.sendRedirect("Checkout.jsp");
			break;
		case "/dang-xuat":
			logout(request, response);
			break;
		default:
			loadProduct(request, response);
			index(request, response);
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> product = ProductDao.getAll();
		request.setAttribute("products", product);
		RequestDispatcher ds = request.getRequestDispatcher("index.jsp");
		ds.forward(request, response);
	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getSession().getAttribute("auth") != null) {
			request.getSession().removeAttribute("auth");
			response.sendRedirect("Login.jsp");
		}else {
			response.sendRedirect("index.jsp");			
		}
	}
	public void product(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> product = ProductDao.getAll();
		request.setAttribute("products", product);
		RequestDispatcher ds = request.getRequestDispatcher("Product.jsp");
		ds.forward(request, response);
	}
	public void loadProduct(HttpServletRequest request, HttpServletResponse response) {
		List<Product> product = ProductDao.getAll();
		request.setAttribute("products", product);
	}
}

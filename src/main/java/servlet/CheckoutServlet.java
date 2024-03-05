package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.OrderDao;
import dao.ProductDao;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("Checkout.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User auth = (User) request.getSession().getAttribute("auth");
		List<Cart> cart_list = (List<Cart>) request.getSession().getAttribute("cart_list");
		if (auth != null) {
			int user_id = auth.getId();
			String address = request.getParameter("address");
			String note = request.getParameter("note");
			int phone = Integer.parseInt(request.getParameter("phone"));
			int method = Integer.parseInt(request.getParameter("method"));
			int total = ProductDao.getTotalPrice(cart_list);

			if (cart_list.size() > 0) {
				
				List<Cart> cartProduct = ProductDao.getCartProducts(cart_list);
				OrderDao.createOrder(user_id, address, note, phone, total, method, cartProduct);
				request.getSession().setAttribute("cart_list", null);
				response.sendRedirect("index.jsp");
			}
		}

	}

}

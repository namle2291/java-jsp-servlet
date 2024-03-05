package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.OrderDao;

/**
 * Servlet implementation class DeleteOrderDetailServlet
 */
@WebServlet("/delete-order-detail")
public class DeleteOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null) {
			boolean result = OrderDao.deleteOrderDetailById(Integer.parseInt(id));
			response.sendRedirect("OrderManager.jsp");
		}
	}

}

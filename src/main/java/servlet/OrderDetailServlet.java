package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderDetail;

import java.io.IOException;
import java.util.List;

import dao.OrderDao;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/order-detail")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id!=null) {
			List<OrderDetail> order_detail = OrderDao.getOrderDetail(Integer.parseInt(id));
			request.getSession().setAttribute("order_detail", order_detail);
			response.sendRedirect("OrderDetail.jsp");
		}
	}

}

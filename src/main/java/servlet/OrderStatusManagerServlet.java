package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderStatus;

import java.io.IOException;

import dao.OrderStatusDao;

/**
 * Servlet implementation class OrderStatusManagerServlet
 */
@WebServlet("/order-status-manager")
public class OrderStatusManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id!=null) {
			OrderStatus ods = OrderStatusDao.selectOrderStatus(Integer.parseInt(id));
			if(ods!=null) {
				request.getSession().setAttribute("ods_edit", ods);
			}
		}
		
		response.sendRedirect("OrderStatusManager.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		
		OrderStatus ods = new OrderStatus();
		
		// Update
		if(id!=null) {
			ods.setId(Integer.parseInt(id));
			ods.setName(name);
			ods.setColor(color);
			OrderStatusDao.updateOrderStatus(ods, Integer.parseInt(id));
		}else { // Insert
			ods.setName(name);
			ods.setColor(color);
			OrderStatusDao.insertOrderStatus(ods);
		}
		resp.sendRedirect("OrderStatusManager.jsp");
	}
}

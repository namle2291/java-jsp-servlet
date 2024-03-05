package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderStatus;

import java.io.IOException;

import dao.OrderDao;
import dao.OrderStatusDao;

/**
 * Servlet implementation class UpdateOrderServlet
 */
@WebServlet("/edit-order")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null) {
			Order od = OrderDao.selectOrder(Integer.parseInt(id));
			if(od!=null) {
				request.getSession().setAttribute("order_edit", od);
			}
			response.sendRedirect("UpdateOrder.jsp");			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null) {
			int total = Integer.parseInt(request.getParameter("total"));
			int method = Integer.parseInt(request.getParameter("method"));
			String note = request.getParameter("note");
			int status_id = Integer.parseInt(request.getParameter("status_id"));
			
			OrderStatus ods = OrderStatusDao.selectOrderStatus(status_id);
			
			Order od = new Order(
				Integer.parseInt(id),
				total,
				method,
				note,
				ods
			);
			
			boolean result = OrderDao.updateOrder(od, Integer.parseInt(id));
			if(result) {
				response.sendRedirect("OrderManager.jsp");				
			}else {
				response.sendRedirect("UpdateOrder.jsp");								
			}
		}
	}

}

package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		try(PrintWriter out = response.getWriter()) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String quantity = request.getParameter("quantity");

			HttpSession session = request.getSession();
			ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart_list");

			// Kiểm tra xem cartList đã tồn tại chưa
			if (cartList == null) {
			    cartList = new ArrayList<>();
			    session.setAttribute("cart_list", cartList);
			}
			// Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
			boolean exist = false;
			for (Cart c : cartList) {
			    if (c.getId() == id) {
			        // Nếu sản phẩm đã tồn tại, tăng số lượng lên 1
			    	if(quantity != null) {
			    		c.setQuantity(c.getQuantity() + Integer.parseInt(quantity));			    					    		
			    	}else {
			    		c.setQuantity(c.getQuantity() + 1);			    		
			    	}
			        exist = true;
			        break;
			    }
			}
			// Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
			if (!exist) {
			    Cart cart = new Cart();
			    cart.setId(id);
			    if(quantity != null) {
			    	cart.setQuantity(Integer.parseInt(quantity));			    					    		
		    	}else {   		
		    		cart.setQuantity(1);
		    	}
			    cartList.add(cart);
			}
			response.sendRedirect("index.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}

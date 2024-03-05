package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dao.UserDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register-post")
public class RegisterServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");

		User user = new User(username, email, password, address);

		try {
			boolean userRegister = UserDao.userRegister(user);
			if (userRegister) {
				response.sendRedirect("Login.jsp");
			}else {
				response.sendRedirect("Register.jsp");				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}

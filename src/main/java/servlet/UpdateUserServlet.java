package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.User;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import dao.UserDao;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/edit-user")
@MultipartConfig()
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id != null) {
			User u = UserDao.selectUser(Integer.parseInt(id));
			if (u != null) {
				request.getSession().setAttribute("user_edit", u);
				response.sendRedirect("UpdateUser.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String id = request.getParameter("id");
		// Upload file
		Part part = request.getPart("image");
		String realPath = getServletContext().getRealPath("/avatars");

		String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

		if (!Files.exists(Path.of(realPath))) {
			Files.createDirectory(Path.of(realPath));
		}
		
		boolean result = false;

		if (id != null) {
			User u = new User(name, email, address, filename);

			if (part.getSize() > 0) {
				u.setAvatar(filename);
				result = UserDao.updateUser(u, Integer.parseInt(id));
				part.write(realPath + "/" + filename);
			} else {
				User user_old = UserDao.selectUser(Integer.parseInt(id));
				u.setAvatar(user_old.getAvatar());
				result = UserDao.updateUser(u, Integer.parseInt(id));
			}

			if(result) {
				response.sendRedirect("UserManager.jsp");
			}else {
				response.sendRedirect("UpdateUser.jsp");			
			}
		}
	}

}

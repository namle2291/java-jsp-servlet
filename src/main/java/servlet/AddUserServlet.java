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
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/add-user")
@MultipartConfig()
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("AddUser.jsp");
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
		String password = request.getParameter("password");

		// Upload file
		Part part = request.getPart("image");
		String realPath = getServletContext().getRealPath("/avatars");

		String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

		if (!Files.exists(Path.of(realPath))) {
			Files.createDirectory(Path.of(realPath));
		}
		
		User u = new User(
			name, email, password, address, filename
		);
		
		if(part.getSize() > 0) {
			u.setAvatar(filename);
			part.write(realPath + "/" + filename);	
		}else {
			u.setAvatar("default.png");			
		}
		
		boolean result = UserDao.addUser(u);
		
		response.sendRedirect("UserManager.jsp");
	}

}

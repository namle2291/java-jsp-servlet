package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

import java.io.IOException;
import java.io.PrintWriter;

import dao.CategoryDao;

/**
 * Servlet implementation class UpdateCategoryServlet
 */
@WebServlet("/update-category")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			if(id!=null) {
				Category c = CategoryDao.selectCategory(Integer.parseInt(id));
				if(c!=null) {
					request.getSession().setAttribute("category_edit", c);
					response.sendRedirect("UpdateCategory.jsp");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			boolean result = CategoryDao.updateCategory(name, Integer.parseInt(id));
			if(result) {
				response.sendRedirect("CategoryManager.jsp");
			}else {				
				response.sendRedirect("UpdateCategory.jsp");
			}
					
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}

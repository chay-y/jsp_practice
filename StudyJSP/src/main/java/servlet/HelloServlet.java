package servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws;
		req.setAttribute("message","Hello Servlet!!!!");
		req.getRequestDispatcher("/08_Servlet/HelloServlet.jsp").forward(req,resp);
}

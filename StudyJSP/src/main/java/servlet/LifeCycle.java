package servlet;

import java.io.IOException;

import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LifeCycle {
	
	@Override
	public void init() throws ServletException{
		System.out.println("");
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/08_Servlet/lifeCycle.jsp")
		.forward(req, resp);
	}
	
	@Override
	public void destroy() {
		System.out.println("destory() 호출");
	}
	
	@PreDestroy
	public void myPreDestroy() {
		System.out.println("myPreDestroy() 호출");
	}
}

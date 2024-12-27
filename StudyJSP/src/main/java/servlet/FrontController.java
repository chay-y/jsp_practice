package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(".green")
public class FrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletResponse req, HttpServletResponse resp) throws Exception;
	
	//request 내장객체에서 uri를 가져옴
	String uri=req.getRequestURI();
	int lastSlash = uri.lastIndexOf("/");
	String conmmandStr =uri.substring(lastSlash);
	
	if(commandStr.equals("/regist.green")) 
		registFunc(req);
	else if (commandStr.equals("/login.green"))
		loginFunc(req);
	else if (commandStr.equals("/board.green"))
		boardFunc(req);
	
	req.setAttribute("uri",uri);
	
	
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	
	void boardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>게시판</h4>");
	}
}

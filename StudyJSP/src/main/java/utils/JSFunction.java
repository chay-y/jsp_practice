package utils;

import java.security.PublicKey;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	// 메세지 알림창을 띄운 후 작성한 url주소로 이동
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
			//작성한 자바 스크립트 코드를 출력
			out.println(script);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>"+"alert('"+msg+"');"+"history.back();"+"</script>";
			out.println(script);	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

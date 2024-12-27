package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
	
	//쿠키 생성
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		
		Cookie cookie = new Cookie(cName, cValue); //쿠키 생성
		cookie.setPath("/"); //경로 설정
		cookie.setMaxAge(cTime); //시간 설정
		response.addCookie(cookie); //응답 객체에 쿠키를 추가하여 전달
		
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(Cookie c : cookies) {
				String cookiesName = c.getName();
				if(cookiesName.equals(cName)) {
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	
	// 쿠키 삭제
	// 유지 시간을 0으로 설정
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}

package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.mysite.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("authInterceptor");
		//1. handler 종류 확인
		System.out.println("request url:" + request.getRequestURL());
		System.out.println("AuthInterceptor1");
		if( handler instanceof HandlerMethod == false) {
			//이미지,자바스크립트,css파일 등 
			return true; 
		}
		
		
		//2. casting
		System.out.println("AuthInterceptor2");
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		//3. Method의 @Auth 받아오기
		System.out.println("AuthInterceptor3");
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		
		//4. Method에 @Auth 없으면
		System.out.println("AuthInterceptor4");
		// Class(Type)에 @Auth를 받아오기 
		if( auth == null ) {
	 		auth = handlerMethod.
	 				getMethod().
	 				getDeclaringClass().
	 				getAnnotation(Auth.class);
		}
		
		//5. @Auth가 안 붙어있는 경우
		System.out.println("AuthInterceptor5");
		if ( auth == null ) {
			return true;
		}
		
		//여기까지 왔으면 클래스든 메소드든 AUTH 붙어 있다.
		
		//6. @Auth가 (class 또는 method에) 붙어 있기 때문에 인증 여부 체크
		HttpSession session = request.getSession();
		System.out.println("AuthInterceptor6");
		if(session == null ) { // 인증이 안되어 있음
			response.sendRedirect(request.getContextPath() + "/user/login");
			return false;
		}
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		System.out.println("AuthInterceptor7");
		if(authUser == null) { // 인증이 안되어 있음
			response.sendRedirect(request.getContextPath() + "/user/login");
			return false;
		}
		
		// 인증되어 있음
		
		
		System.out.println("AuthInterceptor8");
		//7. Role 가져오기 
		Auth.Role role = auth.role();
		System.out.println("AuthInterceptor9");
		//8. role이 Auth.Role.USER라면, 
		//	 인증된 모든 사용자는 접근 가능
		if( role == Auth.Role.USER) {
			return true;
		}
		
		//9. Admin Role 권한 체크 
		//	authUser.getRole().equals("ADMIN")	
		// => 과제 
		if( role == Auth.Role.ADMIN) {
			if(authUser.getRole().equals("ADMIN")) {
				return true;
			}
		}
	
		
		response.sendRedirect(request.getContextPath() + "/main");
		return false;
	}

	
}

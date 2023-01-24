package com.pomaden.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pomaden.model.AdminDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override // preHandle : 컨트롤러로 요청이 들어가기 전 수행 true이면 원래대로 컨트롤러 요청을하고  false이면 컨트롤러 요청을 하지 않는다
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		AdminDTO login = (AdminDTO) session.getAttribute("adminLogin");
		
		if(login != null) {
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/admin");
		return false;	// 반환값에 따라서 기존 요청에 대한 처리를 그대로 진행하거나	true
						// 혹은 진행을 중단하고 새로운 응답을 만들어서 보낸다		false
	}

	@Override	// postHandle : 컨트롤러 핸들러 처리가 끝나고 response가 되기 전에 수행한다
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
	}

	@Override	// afterCompletion : response 끝난 뒤 수행한다
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	
	}
}

package org.justking.homepage.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN ="login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession httpSession = request.getSession();
		logger.info("hi4");
		ModelMap modelMap = modelAndView.getModelMap();
		logger.info("hi5");
		Object memberDTO = modelMap.get("member");

		if(memberDTO != null) {
			logger.info("new login success");
			httpSession.setAttribute(LOGIN, memberDTO);
			response.sendRedirect("../../home");
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession httpSession = request.getSession();
		//������ �α��� ���� ����
		if(httpSession.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}
		return true;
	}
}

package com.proj.my.commons.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.proj.my.member.vo.MemberVO;

/*
 *  인터셉터
 *  Spring 에서 제공하는 기능중 client의 요청 처리 과정에서 특정 작업을 
 *  추가할수 있게하는 기능
 *  /frdd/* <-- free로 시작하는 하위경로
 *  /freeView <-- freeView 경로
 * */

public class LgoinCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		if(login == null) {
			response.sendRedirect(request.getContextPath()+"/loginView");
			return false;
		}
		
		return true; //로그인 정보가 있을경우
	}
}

package com.lsq.meituan.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UsersFilter implements Filter{

	@Override
	public void destroy() {	
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
			HttpServletRequest request =(HttpServletRequest)arg0;
			HttpServletResponse response = (HttpServletResponse)arg1;
			HttpSession session = request.getSession();
			String[] arr = request.getRequestURI().split("/");
			//获取最后的地址
			String url = arr[arr.length-1];
			//查看登录信息
			if(url.equals("login.jsp")||(session.getAttribute("activeSeller") != null)){
				//继续
				arg2.doFilter(request, response);
			}else{
				response.sendRedirect("login.jsp");//跳转登录
			}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}

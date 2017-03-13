package com.lsq.meituan.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lsq.meituan.tool.DB;


public class AjaxTwoforcity extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<String[]> list = new ArrayList<String[]>();
		DB db = new DB();
		PrintWriter out = response.getWriter();
		String proCode = request.getParameter("proCode");	
		String citCode = request.getParameter("citCode");	
		if(proCode != null ){
			list = db.query("select * from t_city where provinceCode="+proCode);
		}else if(citCode != null){
			list = db.query("select * from t_town where CityCode="+citCode);		
		}
		Gson gson = new Gson();
		String str = gson.toJson(list);
		out.print(str);
		out.flush();
		out.close();
	}

}

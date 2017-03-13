package com.lsq.meituan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.lsq.meituan.tool.DB;

@Controller
@RequestMapping("address")
public class AddressController {
	@RequestMapping("findProvince.action")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<String[]> list = new ArrayList<String[]>();
		DB db = new DB();
		PrintWriter out = response.getWriter();
		list = db.query("select * from t_province");
		Gson gson = new Gson();
		String str = gson.toJson(list);
		System.out.println(str);
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("findCityOrTownById.action")
	public void query(HttpServletRequest request, HttpServletResponse response)
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
	
	@RequestMapping("findHistorySum.action")
	public void findHistorySum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		DB db = new DB();
		String sum = db.query("select * from history").get(0)[0];
		out.print(sum);
		out.flush();
		out.close();
	}
}

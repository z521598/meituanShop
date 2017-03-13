package com.lsq.meituan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lsq.meituan.pojo.Advertise;
import com.lsq.meituan.service.AdvertiseService;
@Controller
@RequestMapping("advertise")
public class AdvertiseController {
	@Autowired
	AdvertiseService advertiseService;
	
	//管理员页面-查询所有广告
	@RequestMapping("findAll.action")
	public ModelAndView findAll(){
		ModelAndView mav = new ModelAndView();
		List<Advertise> list = advertiseService.queryAll();
		mav.addObject("advertise", list);
		mav.setViewName("../adminNav/advertisement.jsp");
		return mav;
	}
	
	//商户页面-添加广告
	@RequestMapping("addAdvertise.action")
	public void addAdvertise(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		Advertise advertise = new Advertise();
		advertise.setGid(Integer.parseInt(request.getParameter("gid")));
		advertise.setApplytime(new Date());
		advertise.setAsign(0);
		advertise.setAorder(1);
		int sign = advertiseService.addAdvertise(advertise);
		out.print(sign);
		out.flush();
		out.close();
	}
	//管理员页面-修改广告状态
	@RequestMapping("updateAsign.action")
	public ModelAndView updateAsign(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Advertise advertise = new Advertise();
		String aid = request.getParameter("aid");
		advertise.setAid(Integer.parseInt(aid));
		String asign = request.getParameter("asign");
		advertise.setAsign(Integer.parseInt(asign));
		advertiseService.UpdateByAid(advertise);
		mav.setViewName("findAll.action");
		return mav;
	}
	//管理员页面-ajax修改广告顺序
	@RequestMapping("updateAorderByAid.action")
	public void updateAorderByAid(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		Advertise advertise = new Advertise();
		String aid = request.getParameter("aid");
		String aorder = request.getParameter("aorder");
		advertise.setAid(Integer.parseInt(aid));
		advertise.setAorder(Integer.parseInt(aorder));
		int sign = advertiseService.UpdateByAid(advertise);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	
}

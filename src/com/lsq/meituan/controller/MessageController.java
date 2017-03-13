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

import com.google.gson.Gson;
import com.lsq.meituan.pojo.Message;
import com.lsq.meituan.service.MessageService;

@Controller
@RequestMapping("message")
public class MessageController {
	@Autowired
	MessageService messageService;
	
	//App端-添加消息
	@RequestMapping("addMessage.action")
	public void addMessage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String mcontent = request.getParameter("mcontent");
		String uusername = request.getParameter("uusername");
		String mtitle = request.getParameter("mtitle");
		Message message = new Message();
		message.setMtitle(mtitle);
		message.setMcontent(mcontent);
		message.setMtype(1);
		message.setUusername(uusername);
		message.setUsertime(new Date());
		message.setMsign(0);
		int sign = messageService.addMessage(message);
		out.print(sign);
		out.flush();
		out.close();
	}
	//商户页面-发送消息
	@RequestMapping("addMessageForSeller.action")
	public ModelAndView addMessageForSeller(Message message){
		ModelAndView mav = new ModelAndView();
		message.setMtype(1);
		message.setMsign(0);
		message.setUsertime(new Date());
		messageService.addMessage(message);
		mav.setViewName("findBySeller.action");
		return mav;
	}
	//App端-查看消息
	@RequestMapping("findByUusername.action")
	public void findAllMessage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uusername = request.getParameter("uusername");
		List<Message> list = messageService.queryByUusername(uusername);
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);
		out.print(jsonList);
		out.flush();
		out.close();
	}
	//管理员-查看所有消息，分页查询
	@RequestMapping("findAll.action")
	public ModelAndView findAll(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = messageService.queryAll().size();
		Integer lastPage = allData % pageSize == 0 ? (allData / pageSize)-1
				: (allData / pageSize + 1) - 1;
		if (pageNum == null) {
			pageNum1 = 0;
			lastdata = 0;
		} else {
			pageNum1 = Integer.parseInt(pageNum);
			if (pageNum1 > lastPage) {
				pageNum1 = lastPage;
			} else if (pageNum1 < 0) {
				pageNum1 = 0;
			}
			lastdata = pageNum1 * pageSize;
		}
		mav.addObject("pageNum", pageNum1 + "");
		mav.addObject("lastPage", lastPage);
		mav.addObject("message", messageService.queryPage(lastdata, pageSize));
		mav.setViewName("../adminNav/message.jsp");
		return mav;
	}
	//商户页面-查看该用户的消息,分页
	@RequestMapping("findBySeller.action")
	public ModelAndView findBySeller(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = messageService.queryBySeller(session).size();
		Integer lastPage = allData % pageSize == 0 ? (allData / pageSize)-1
				: (allData / pageSize + 1) - 1;
		if (pageNum == null) {
			pageNum1 = 0;
			lastdata = 0;
		} else {
			pageNum1 = Integer.parseInt(pageNum);
			if (pageNum1 > lastPage) {
				pageNum1 = lastPage;
			} else if (pageNum1 < 0) {
				pageNum1 = 0;
			}
			lastdata = pageNum1 * pageSize;
		}
		mav.addObject("pageNum", pageNum1 + "");
		mav.addObject("lastPage", lastPage);
		mav.addObject("message", messageService.queryBySellerPage(session,lastdata, pageSize));
		mav.setViewName("../sellerNav/message.jsp");
		return mav;
	}
	//管理员页面/商户页面-标记已读
	@RequestMapping("updateState.action")
	public void updateState(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Message msg = new Message();
		String mid = request.getParameter("mid");
		msg.setMid(Integer.parseInt(mid));
		msg.setMsign(1);
		int sign = messageService.updateByMid(msg);
		out.print(sign);
		out.flush();
		out.close();
	}
	//管理员页面-群发消息
	@RequestMapping("addMessageForAdmin.action")
	public ModelAndView addMessageForAdmin(HttpServletRequest request,HttpServletResponse response,Message message){
		ModelAndView mav = new ModelAndView();
		String[] uusernames  = request.getParameter("uusernames").split(";");

		int resultSign = 0;
		for(int i = 0;i<uusernames.length;i++){
			String uusername = uusernames[i];
			message.setUusername(uusername);
			message.setMtype(0);
			message.setMsign(0);
			message.setUsertime(new Date());
			int sign = messageService.addMessage(message);
			resultSign += sign;//记录成功的数目
		}
		if(resultSign == uusernames.length){
			mav.addObject("msg", "发送成功");
		}else{
			mav.addObject("msg", "有"+(uusernames.length - resultSign)+"条失败");
		}
		mav.setViewName("../adminTran/addMessage.jsp");
		return mav;
	}
}

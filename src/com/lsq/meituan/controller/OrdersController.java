package com.lsq.meituan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.lsq.meituan.pojo.Comment;
import com.lsq.meituan.pojo.Count;
import com.lsq.meituan.pojo.Goods;
import com.lsq.meituan.pojo.Users;
import com.lsq.meituan.pojo.Orders;
import com.lsq.meituan.service.CommentService;
import com.lsq.meituan.service.GoodsService;
import com.lsq.meituan.service.OrdersService;
import com.lsq.meituan.tool.DB;

@Controller
@RequestMapping("orders")
public class OrdersController {

	@Autowired
	OrdersService ordersService;
	@Autowired
	CommentService commentService;
	@Autowired
	GoodsService goodsService;
	
	
	//商家页面-根据订单ID查询订单
	@RequestMapping("findByOid.action")
	public ModelAndView findByOid(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int oid = Integer.parseInt(request.getParameter("oid"));
		Orders orders = ordersService.queryByOid(oid);
		mav.addObject("oneOrders",orders);
		mav.setViewName("../sellerTran/showOneOrders.jsp");
		return mav;
	}
	//App端-发送美团券验证事件
	
	//商家页面-验证美团券
	@RequestMapping("updateByTicketAndSellerId.action")
	public void updateByTicketAndSellerId(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String ticket = request.getParameter("ticket");
		int sellerId = ((Users)session.getAttribute("activeSeller")).getUid();
		int sign = ordersService.updateByTicketAndSellerId(ticket,sellerId);
		out.print(sign);	
		out.flush();
		out.close();
	}
	
	//商家页面-查询全部订单
	@RequestMapping("findBySellerId.action")
	public ModelAndView findBySellerId(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		int uid = ((Users)session.getAttribute("activeSeller")).getUid();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = ordersService.queryBySellerId(uid).size();
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
		mav.addObject("orders", ordersService.queryBySellerIdPage(uid,lastdata, pageSize));
		mav.setViewName("../sellerNav/orders.jsp");
		return mav;
	}
	//App端-修改订单状态
	@RequestMapping("updateOrders.action")
	public void updateOrders(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String osign = request.getParameter("osign");
		String oid = request.getParameter("oid");
		Orders orders = new Orders();
		if(osign.equals("1")){
			String ticket = (int)(Math.random()*99999)+""+(int)(Math.random()*99999)+""+(int)(Math.random()*99999);
			orders.setTicket(ticket);
		}
		
		if(osign.equals("4")){
			int old_osign = ordersService.queryByOid(Integer.parseInt(oid)).getOsign();
			if(old_osign != 1){
				System.out.println(old_osign);
				out.print("0");	
				out.flush();
				out.close();
				return;
			}
		}
		
		orders.setOsign(Integer.parseInt(osign));
		orders.setOid(Integer.parseInt(oid));
		int returnSign = ordersService.updateOrders(orders);
		out.print(returnSign);	
		out.flush();
		out.close();
	}
	
	
	//App端-下单
	@RequestMapping("addOrders.action")
	public void addOrders(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String gid = request.getParameter("gid");
		String uid = request.getParameter("uid");
		Orders orders = new Orders();
		orders.setGid(Integer.parseInt(gid));
		orders.setUid(Integer.parseInt(uid));
		orders.setOcreatetime(new Date());
		orders.setOsign(0);
		orders.setTicket("");
		int sign = ordersService.insertOrders(orders);
		// TODO 商品商量减一
		Goods goods = new Goods();
		goods.setGid(Integer.parseInt(gid));
		//goods.setGnum();
		//goodsService.updateByGid(goods);
		out.print(sign);
		out.flush();
		out.close();
	}
	//App端-查询不同类型的订单
	@RequestMapping("findOrdersByOsignAndUid.action")
	public void findOrdersByOsign(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Orders> list = null;
		String uid = request.getParameter("uid");
		String osign = request.getParameter("osign");
		if(osign.equals("10")){
			list = ordersService.queryByUid(Integer.parseInt(uid));
		}else{
			list = ordersService.queryByOsignAndUid(Integer.parseInt(osign),Integer.parseInt(uid));
		}
		Gson gson = new Gson();
		String ordersJson = gson.toJson(list);
		System.out.println(ordersJson);
		out.print(ordersJson);
		out.flush();
		out.close();
	}
	
	//App端-根据ID查询订单
	@RequestMapping("findOrdersByOidForApp.action")
	public void findOrdersByOidForApp(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String oid = request.getParameter("oid");
		Orders orders = ordersService.queryByOid(Integer.parseInt(oid));
		Gson gson = new Gson();
		String ordersJson = gson.toJson(orders);
		System.out.println(ordersJson);
		out.print(ordersJson);
		out.flush();
		out.close();
	}
	
	//App端-评价订单
	@RequestMapping("comment.action")
	public void comment(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String osign = request.getParameter("osign");
		String uid = request.getParameter("uid");
		String oid = request.getParameter("oid");
		String gid = request.getParameter("gid");
		String ccontent = request.getParameter("ccontent").replace("@"," ");
		String rating = request.getParameter("rating");
		ccontent = new String(ccontent.getBytes("iso-8859-1"), "utf-8");
		
		int old_osign = ordersService.queryByOid(Integer.parseInt(oid)).getOsign();
		if(old_osign != 2){
			out.print("0");	
			out.flush();
			out.close();
			return;
		}
		
		Comment comment = new Comment();
		comment.setUid(Integer.parseInt(uid));
		comment.setCcontent(ccontent);
		comment.setCresponse("");
		comment.setGid(Integer.parseInt(gid));
		comment.setRating(Double.parseDouble(rating));
		comment.setContenttime(new Date());
		comment.setIsdelete(0);
		int commentsign = commentService.addComment(comment);
		Orders orders = new Orders();
		orders.setOsign(Integer.parseInt(osign));
		orders.setOid(Integer.parseInt(oid));
		int ordersign = ordersService.updateOrders(orders);
		out.print(ordersign+commentsign);
		out.flush();
		out.close();
	}
	
	//商户页面-统计
	@RequestMapping("findByTime.action")
	public ModelAndView findByTime(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ParseException{
		ModelAndView mav = new ModelAndView();
		String starttime = request.getParameter("starttime");
		String overtime  = request.getParameter("overtime");
		//解析日期
		DateFormat df = DateFormat.getDateInstance();
		Date start = df.parse(starttime);
		Date over = df.parse(overtime);
		int uid = ((Users)session.getAttribute("activeSeller")).getUid();
		List<Count> list = ordersService.queryByTimeAndSellerId(uid,start,over);
		int allMoney = ordersService.querySumMoneyByTime(uid,start,over);
		mav.addObject("start",start);
		mav.addObject("over",over);
		mav.addObject("allMoney",allMoney);
		mav.addObject("result", list);
		mav.setViewName("../sellerNav/sale.jsp");
		return mav;
	}
	
	//管理员页面-查询全部订单
		@RequestMapping("findAll.action")
		public ModelAndView findAll(HttpServletRequest request,HttpServletResponse response) throws ParseException{
			ModelAndView mav = new ModelAndView();
			String starttime = request.getParameter("starttime");
			String overtime  = request.getParameter("overtime");
			String pageNum = request.getParameter("pageNum");
			//解析日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = sdf.parse(starttime);
			Date over = sdf.parse(overtime);
			Integer pageNum1 = 0;
			Integer pageSize = 8;
			Integer lastdata = 0;
			Integer allData = ordersService.queryAll(start,over).size();
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
			//传入初始数据
			mav.addObject("start",starttime);
			mav.addObject("over",overtime);
			mav.addObject("pageNum", pageNum1 + "");
			mav.addObject("lastPage", lastPage);
			mav.addObject("orders", ordersService.queryAllPage(lastdata, pageSize,start,over));
			mav.setViewName("../adminNav/journalAccount.jsp");
			return mav;
		}	
		
		//管理员界面-信息一览
		@RequestMapping("findInfo.action")
		public ModelAndView findInfo(){
			ModelAndView mav = new ModelAndView();
			List<Count> users = ordersService.queryUsers();
			List<Count> stores = ordersService.queryStores();
			List<Count> goods = ordersService.queryGoods();
			mav.addObject("users",users );
			mav.addObject("stores",stores );
			mav.addObject("goods",goods );
			mav.setViewName("../adminNav/information.jsp");
			return mav;
		}
		
		
}

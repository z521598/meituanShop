package com.lsq.meituan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lsq.meituan.pojo.Goods;
import com.lsq.meituan.pojo.Users;
import com.lsq.meituan.service.GoodsService;
import com.lsq.meituan.tool.JsonToStrings;


@Controller
@RequestMapping("goods")
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	
	//商户页面-添加产品
	@RequestMapping("addGoods.action")
	public ModelAndView addGoods(Goods goods,HttpServletRequest request,MultipartFile gcover2) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView();
		goodsService.addGoods(goods,request,gcover2);
		mav.setViewName("findByUid.action");
		return mav;
	}
	
	//商户页面-上下架物品，管理员页面-强制下架
	@RequestMapping("upGoods.action")
	public void upGoods(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String isonsale = request.getParameter("isonsale");
		String gid = request.getParameter("gid");
		Goods goods = new Goods();
		goods.setGid(Integer.parseInt(gid));
		goods.setIsonsale(Integer.parseInt(isonsale));
		int sign = goodsService.updateByGid(goods);// TODO 
		out.print(sign);
		out.flush();
		out.close();
	}
	
	//商户页面-查询该用户的商品
	@RequestMapping("findByUid.action")
	public ModelAndView findByUid(HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<Goods> list = new ArrayList<Goods>(); 
		list = goodsService.queryByUid(((Users)session.getAttribute("activeSeller")).getUid());
		mav.addObject("goods",list);
		mav.setViewName("../sellerNav/goods.jsp");
		return mav;
	}
	
	//商户页面-根据ID查询产品，管理员页面-根据ID查询产品
	@RequestMapping("findByGid.action")
	public ModelAndView findByGid(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Goods goods = goodsService.queryByGid(Integer.parseInt(request.getParameter("gid")));
		mav.addObject("oneGoods", goods);
		mav.setViewName("../sellerTran/showOneGoods.jsp");
		return mav;
	}
	
	//商户页面-ajax查询该用户的商品
	@RequestMapping("findByUidForAjax.action")
	public void findByUidForAjax(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		List<Goods> list = goodsService.queryByUid(((Users)session.getAttribute("activeSeller")).getUid());
		Gson gson  = new Gson();
		String goodsJson = gson.toJson(list);
		out.print(goodsJson);
		out.flush();
		out.close();
	}
	
	//管理员页面-查询所有商品
	@RequestMapping("findAllGoods.action")
	public ModelAndView findAllGoods(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = goodsService.queryAll().size();
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
		mav.addObject("goods", goodsService.queryPage(lastdata, pageSize));
		mav.setViewName("../adminNav/goods.jsp");
		return mav;
	}
	
	//管理员-修改商品状态
	@RequestMapping("changeState.action")
	public void changeState(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String gstate = request.getParameter("gstate");
		String gid = request.getParameter("gid");
		Goods goods = new Goods();
		goods.setGid(Integer.parseInt(gid));
		goods.setGstate(Integer.parseInt(gstate));
		int sign = goodsService.updateByGid(goods);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	
	
	//App端-根据类型查询商品
	@RequestMapping("findGoodsByGtype.action")
	public void findGoodsByGtype(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String gtype = request.getParameter("gtype");
		List<Goods> goodsList = new ArrayList<Goods>(); 
		goodsList = goodsService.queryByGtype(gtype);
		Gson gson  = new Gson();
		String goodsJson = gson.toJson(goodsList);
		out.print(goodsJson);
		out.flush();
		out.close();
	}
	
	
	//App端-根据id查询产品,一对多
	@RequestMapping("findByGidForApp.action")
	public void findByGidForApp(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		int gid = Integer.parseInt(request.getParameter("gid"));
		Goods goods = goodsService.queryByGidAndComment(gid);
		Gson gson  = new Gson();
		String goodsJson = gson.toJson(goods);
		out.print(goodsJson);
		out.flush();
		out.close();
	}
	
	//App端-广告位获取
	@RequestMapping("findByAdv.action")
	public void findByAdv(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Goods> list = goodsService.queryByAdv();
		Gson gson  = new Gson();
		String goodsJson = gson.toJson(list);
		out.print(goodsJson);
		out.flush();
		out.close();
	}
	
	//App-模糊查询
	@RequestMapping("findForSearch.action")
	public void findForSearch(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String gname = request.getParameter("gname");
		System.out.println(gname);
		gname = new String(gname.getBytes("iso-8859-1"),"utf-8");
		System.out.println(gname);
		List<Goods> list = goodsService.queryForSearch(gname);
		Gson gson  = new Gson();
		String goodsJson = gson.toJson(list);
		out.print(goodsJson);
		out.flush();
		out.close();
	}
	
	//App端-猜你喜欢
	@RequestMapping("findByKeyList.action")
	public void findByKeyList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//用做返回的List
		List<Goods> returnList = new ArrayList<Goods>();
		String key = request.getParameter("key");
		//json转化为Stringf[]
		String[] strs = new JsonToStrings().toStrings(key);
		//循环遍历
		for(int i = 0 ;i < strs.length ; i++){
			List<Goods> list = goodsService.queryForSearch(strs[i]);
			// TODO HashSet去重复
			returnList.addAll(list);
		}
		Gson gson = new Gson();
		out.print(gson.toJson(returnList));
		out.flush();
		out.close();
	}
	
	
}

package com.lsq.meituan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lsq.meituan.pojo.Store;
import com.lsq.meituan.service.StoreService;
import com.lsq.meituan.tool.DB;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@Autowired
	StoreService storeService;
	//商户界面-完善资料,添加商户
	@RequestMapping("addStore.action")
	public ModelAndView addStore(Store stores,MultipartFile simage,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView();
//		if(request.getParameter("simage") != null){
			String url = request.getSession().getServletContext().getRealPath("store");
			// 如果没有该路径，自动创建
			File floder = new File(url);
			if (!floder.exists()) {
				floder.mkdir();
			}
			if (simage != null) {
				// 原始文件名
				String originalFilename = simage.getOriginalFilename();
				// 新文件名
				String fileName = UUID.randomUUID()
						+ originalFilename.substring(originalFilename
								.lastIndexOf("."));
				// 保存图片
				simage.transferTo(new File(url, fileName));
				// 保存文件名至数据库
				stores.setSimage1("store/" + fileName);
			}
//			}
		stores.setScredit(0);
		stores.setSsign(0);
		stores.setSrating(0);
		stores.setSuptime(new Date());
		stores.setSaddress(request.getParameter("saddress1")+request.getParameter("saddress2")+request.getParameter("saddress3"));
		int proCode = Integer.parseInt(request.getParameter("saddress1"));
		int citCode = Integer.parseInt(request.getParameter("saddress2"));
		int towCode = Integer.parseInt(request.getParameter("saddress3"));
		DB db = new DB();
		String saddress1 = db.query("select name from t_province where code = "+proCode).get(0)[0];
		String saddress2 = db.query("select name from t_city where code = "+citCode).get(0)[0];
		String saddress3 = db.query("select name from t_town where code = "+towCode).get(0)[0];
		String saddress = saddress1+saddress2+saddress3;
		stores.setSaddress(saddress);
		storeService.add(stores);
		mav.setViewName("../sellerNav/home.jsp");
		return mav;
	}
	
	//管理员页面-更改商户状态
	@RequestMapping("updateSsignBySid.action")
	public void updateSstateBySid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		int sid = Integer.parseInt(request.getParameter("sid"));
		int ssign = Integer.parseInt(request.getParameter("ssign"));
		Store store = new Store();
		store.setSid(sid);
		store.setSsign(ssign);
		int sign = storeService.updateBySid(store);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	//管理员界面-查看所有商户
	@RequestMapping("findAllSeller.action")
	public ModelAndView findAllSeller(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = storeService.queryAll().size();
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
		mav.addObject("sellers", storeService.queryPage(lastdata, pageSize));
		mav.setViewName("../adminNav/seller.jsp");
		return mav;
	}
	
	//管理员页面-根据ID查询用户
	@RequestMapping("findSellerBySid.action")
	public ModelAndView findSellerBySid(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Store store = storeService.queryBySid(Integer.parseInt(request.getParameter("sid")));
		mav.setViewName("../adminTran/showOneSeller.jsp");
		mav.addObject("oneStore",store);
		return mav;
	}
	
	//App-获取商家
	@RequestMapping("findStoreBySaddress.action")
	public void findByGidForApp(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		List<Store> list = storeService.queryAll();
		Gson gson  = new Gson();
		String storeJson = gson.toJson(list);
		out.print(storeJson);
		out.flush();
		out.close();
	}
	//App-获取商家详情(一对多)
	@RequestMapping("findStoreBySidForApp.action")
	public void findStoreBySid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String sid = request.getParameter("sid");
		List<Store> list = storeService.queryGoodsAndStoreBySid(Integer.parseInt(sid));
		Gson gson  = new Gson();
		String storeJson = gson.toJson(list);
		out.print(storeJson);
		out.flush();
		out.close();
	}
	
	//商家页面-ajax获取商家信息
	@RequestMapping("findStoreByUid.action")
	public void findStoreByUid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid");
		Store store = storeService.queryByUid(Integer.parseInt(uid));
		Gson gson  = new Gson();
		String storeJson = gson.toJson(store);
		out.print(storeJson);
		out.flush();
		out.close();
	}
	
	
}

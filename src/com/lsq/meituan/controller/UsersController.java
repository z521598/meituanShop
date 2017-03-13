package com.lsq.meituan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.enterprise.context.ApplicationScoped;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lsq.meituan.pojo.Users;
import com.lsq.meituan.service.UsersService;

@Controller
@RequestMapping("users")
@SessionAttributes({"admin","activeSeller","activeUser"})
public class UsersController {
	@Autowired
	UsersService usersService;
	//商家登录
	@RequestMapping("sellerLogin.action")
	public ModelAndView sellerLogin(Users users){
		ModelAndView mav = new ModelAndView();
		Users activeUser = usersService.sellerLogin(users);
		if(activeUser == null){
			mav.addObject("wrongMsg", "用户名或者密码错误");
			mav.setViewName("../login.jsp");
		}else if(activeUser.getUisseal() == 1){
			mav.addObject("wrongMsg", "用户被封禁");
			mav.setViewName("../login.jsp");
		}else{
			mav.addObject("activeSeller", activeUser);
			mav.setViewName("../sellerMain.jsp");
		}
		
		return mav;
	}
	//商家页面-管理个人信息
	@RequestMapping("updateUsersById.action")
	public ModelAndView updateUsersById(Users users,MultipartFile uhead2,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView();	

//		if(request.getParameter("uhead2") != null){
		String url = request.getSession().getServletContext().getRealPath("head");
		// 如果没有该路径，自动创建
		File floder = new File(url);
		if (!floder.exists()) {
			floder.mkdir();
		}
		if (uhead2 != null) {
			// 原始文件名
			String originalFilename = uhead2.getOriginalFilename();
			// 新文件名
			String fileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			// 保存图片
			uhead2.transferTo(new File(url, fileName));
			// 保存文件名至数据库
			users.setUhead("head/" + fileName);
		}
//		}
		usersService.updateByUid(users);
		Users activeSeller = usersService.queryByUid(users.getUid());
		mav.addObject("activeSeller", activeSeller);
		mav.setViewName("../sellerNav/sellerInfo.jsp");
		return mav;
	}
	//管理员登录
	@RequestMapping("adminLogin.action")
	public ModelAndView adminLogin(Users users){
		ModelAndView mav = new ModelAndView();
		Users admin = usersService.adminLogin(users);
		if(admin != null){
			mav.setViewName("../adminMain.jsp");
			mav.addObject("admin", admin);
		}else{
			mav.setViewName("../login.jsp");
			mav.addObject("wrongMsg", "用户名或者密码错误");
		}
		return mav;
	}
	
	//管理员页面-查询所有用户(todo分页)
	@RequestMapping("findUsers12.action")
	public ModelAndView findUsers2(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		//Mysql分页代码，uopdate by lsq
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum="+pageNum);
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = usersService.queryBy12().size();
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
		mav.addObject("users", usersService.queryPage(lastdata, pageSize));
		mav.setViewName("../adminNav/users.jsp");
		return mav;
	}
	//ajax获取所有Uusername
	@RequestMapping("findAllUusername.action")
	public void findAllUusername(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<String> uusernames = usersService.queryAllUusername();
		Gson gson = new Gson();
		String json = gson.toJson(uusernames);
		out.print(json);
		out.flush();
		out.close();
		
	}
	//管理员页面-根据ID查询单个用户
	@RequestMapping("findUsersByUid.action")
	public ModelAndView findUsersByUid(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Users user = usersService.queryByUid(Integer.parseInt(request.getParameter("uid")));
		mav.setViewName("../adminTran/showOneUser.jsp");
		mav.addObject("oneUser",user);
		return mav;
	}
	
	//管理员-解禁/封禁用户
	@RequestMapping("updateSealByUid.action")
	public void updateSealByUid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid");
		String uisseal = request.getParameter("uisseal");
		Users users = new Users();
		users.setUid(Integer.parseInt(uid));
		users.setUisseal(Integer.parseInt(uisseal));
		PrintWriter out = response.getWriter();
		int sign = usersService.updateByUid(users);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	
	
	//App-用户登录
	@RequestMapping("usersLogin.action")
	public void userLogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		//通过URL传汉字，下面两句转码可能不好使。否则需要进入Tomcat的server.xml进行修改
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uusername = request.getParameter("uusername");
		String upassword = request.getParameter("upassword");
		Users users = new Users();
		users.setUusername(uusername);
		users.setUpassword(upassword);
		Users return_users = usersService.usersLogin(users);
		Gson gson  = new Gson();
		String usersJson = gson.toJson(return_users);
		out.print(usersJson);
		out.flush();
		out.close();
	}
	//App-用户注册
	@RequestMapping("usersRegist.action")
	public void usersRegist(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String uusername = request.getParameter("uusername");
		String upassword = request.getParameter("upassword");
		Users users = new Users();
		users.setUusername(uusername);
		users.setUpassword(upassword);
		users.setUisseal(0);
		users.setUsign(2);
		users.setUregisttime(new Date());
		users.setUlastlogtime(new Date());
		//users.setCredit(0);
		users.setUhead("");
		users.setUemail("");
		users.setUname("");
		users.setUsex("男");
		users.setUaddress("");
		users.setUtelephone("");
		int sign = usersService.addUsers(users);
		out.print(sign);
		out.flush();
		out.close();
	}
	//App-校验用户名
	@RequestMapping("testUsername.action")
	public void testUsername(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/thml");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uusername = request.getParameter("uusername");
		int sign = usersService.findByUusername(uusername);
		out.print(sign);
		out.flush();
		out.close();
	}
	//App-用户修改密码
	@RequestMapping("updateUsers.action")
	public void updateUsers(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uid = request.getParameter("uid");
		String upassword = request.getParameter("upassword");
		Users users = new Users();
		users.setUid(Integer.parseInt(uid));
		users.setUpassword(upassword);
		int sign = usersService.updateByUid(users);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	/*
	 (HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		out.print("");
		out.flush();
		out.close();
	}
	 */
	
	
	//App-用户完善资料
	@RequestMapping("updateMoreUsers.action")
	public void UpdatePassword(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String uemail = request.getParameter("uemail");
		String uaddress = request.getParameter("uaddress");
		String utelephone = request.getParameter("utelephone");
		String usex = request.getParameter("usex");
		uaddress = new String(uaddress.getBytes("iso-8859-1"), "utf-8");
		usex = new String(usex.getBytes("iso-8859-1"), "utf-8");
		uname = new String(uname.getBytes("iso-8859-1"), "utf-8");
		Users users = new Users();
		users.setUid(Integer.parseInt(uid));
		users.setUemail(uemail);
		users.setUname(uname);
		users.setUaddress(uaddress);
		users.setUtelephone(utelephone);
		users.setUsex(usex);
		int sign = usersService.updateByUid(users);
		out.print(sign);
		out.flush();
		out.close();
	}
	//App-成为商家
	@RequestMapping("updateSeller.action")
	public void ChangeSeller(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uid = request.getParameter("uid");
		Users users = new Users();
		users.setUid(Integer.parseInt(uid));
		users.setUsign(1);
		int sign = usersService.updateByUid(users);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	//商户页面-修改密码
	@RequestMapping("updatePwdByUid.action")
	public ModelAndView UpdatePwdByUid(Users users){
		ModelAndView mav = new ModelAndView();
		int sign = usersService.updateByUid(users);
		if(sign == 1){
			mav.addObject("msg","修改成功");
			mav.addObject("activeSeller", usersService.queryByUid(users.getUid()));
		}else{
			mav.addObject("msg","修改失败");	
		}
		mav.setViewName("../sellerNav/sellerKey.jsp");
		return mav;
	}
	//管理员页面-修改密码
	@RequestMapping("updateAminByUid.action")
	public ModelAndView updateAminByUid(Users users){
		ModelAndView mav = new ModelAndView();
		int sign = usersService.updateByUid(users);
		if(sign == 1){
			mav.addObject("msg","修改成功");
			mav.addObject("admin", usersService.queryByUid(users.getUid()));
		}else{
			mav.addObject("msg","修改失败");	
		}
		mav.setViewName("../adminNav/updatePassword.jsp");
		return mav;
	}
	//管理员页面-添加管理
	@RequestMapping("addAdmin.action")
	public ModelAndView addAdmin(Users users){
		ModelAndView mav = new ModelAndView();
		users.setUisseal(0);
		users.setUsign(0);
		int sign = usersService.addUsers(users);
		if(sign == 1){
			mav.addObject("msg","添加成功");
		}else{
			mav.addObject("msg","添加失败");	
		}
		mav.setViewName("../adminNav/addAdmin.jsp");
		return mav;
	}
	
}

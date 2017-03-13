package com.lsq.meituan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lsq.meituan.pojo.Comment;
import com.lsq.meituan.service.CommentService;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	CommentService commentService;
	
	//商户页面-查看商户产品评论
	@RequestMapping("findByUid.action")
	public ModelAndView findByUid(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = commentService.queryByUid(session).size();
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
		mav.addObject("comment", commentService.queryByUidPage(session,lastdata, pageSize));
		mav.setViewName("../sellerNav/evaluate.jsp");
		return mav;
	}
	
	//商户页面-回复商户评论ajax
	@RequestMapping("addResponse.action")
	public void addResponse(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		int cid = Integer.parseInt(request.getParameter("cid"));
		String cresponse = request.getParameter("cresponse");
		Comment comment = new Comment();
		comment.setCid(cid);
		comment.setCresponse(cresponse);
		int sign= commentService.updateByCid(comment);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	
	//管理员页面-查看所有评论
	@RequestMapping("findAll.action")
	public ModelAndView findAll(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 10;
		Integer lastdata = 0;
		Integer allData = commentService.queryAll().size();
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
		mav.addObject("comment", commentService.queryPage(lastdata, pageSize));
		mav.setViewName("../adminNav/evaluate.jsp");
		return mav;
	}
	//管理员页面-ajax删除评论
	@RequestMapping("deleteCom.action")
	public void findByUidForAjax(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("txt/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		int cid = Integer.parseInt(request.getParameter("cid"));
		int sign = commentService.deleteByCid(cid);
		out.print(sign);
		out.flush();
		out.close();
	}
	
	
	
	//App端-发表评论
	
	
	
}

package com.lsq.meituan.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.CommentMapper;
import com.lsq.meituan.pojo.Comment;
import com.lsq.meituan.pojo.Users;


public class CommentService {
	@Autowired
	CommentMapper commentMapper;

	public List<Comment> queryAll() {
		return commentMapper.selectAll();
	}

	public int deleteByCid(int cid) {
		return commentMapper.deleteByPrimaryKey(cid);
	}

	public List<Comment> queryByUid(HttpSession session) {
		int uid = ((Users)session.getAttribute("activeSeller")).getUid();
		return commentMapper.selectByUid(uid);
	}

	public int updateByCid(Comment comment) {
		return commentMapper.updateByPrimaryKeySelective(comment);
	}

	public int addComment(Comment comment) {
		return commentMapper.insertSelective(comment);
	}

	public List<Comment> queryPage(Integer lastdata, Integer pageSize) {
		return commentMapper.selectPageForAdmin(lastdata,pageSize);
	}

	public List<Comment> queryByUidPage(HttpSession session, Integer lastdata,
			Integer pageSize) {
		int uid = ((Users)session.getAttribute("activeSeller")).getUid();
		return commentMapper.selectByUidPage(uid,lastdata,pageSize);
	}
}

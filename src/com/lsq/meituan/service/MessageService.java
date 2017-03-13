package com.lsq.meituan.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.MessageMapper;
import com.lsq.meituan.pojo.Message;
import com.lsq.meituan.pojo.Users;

public class MessageService {
	@Autowired
	MessageMapper messageMapper;

	public int addMessage(Message message) {
		
		return messageMapper.insertSelective(message);
	}

	public List<Message> queryByUusername(String uusername) {
		return messageMapper.selectByUusername(uusername);
	}

	public List<Message> queryAll() {
		return messageMapper.selectAll();
	}

	public Object queryPage(Integer lastdata, Integer pageSize) {
		return messageMapper.selectAllPage(lastdata, pageSize);
	}

	public int updateByMid(Message msg) {
		return messageMapper.updateByPrimaryKeySelective(msg);
	}

	public List<Message> queryBySeller(HttpSession session) {
		String uusername = ((Users)session.getAttribute("activeSeller")).getUusername();
		return messageMapper.selectByUusername(uusername);
	}

	public List<Message> queryBySellerPage(HttpSession session, Integer lastdata,
			Integer pageSize) {
		String uusername = ((Users)session.getAttribute("activeSeller")).getUusername();
		return messageMapper.selectByUusernamePage(uusername,lastdata,pageSize);
	}
}

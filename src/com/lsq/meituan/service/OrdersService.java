package com.lsq.meituan.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.OrdersMapper;
import com.lsq.meituan.pojo.Count;
import com.lsq.meituan.pojo.Orders;

public class OrdersService {

	@Autowired
	OrdersMapper ordersMapper;

	public int insertOrders(Orders orders) {
		return ordersMapper.insertSelective(orders);
	}

	public List<Orders> queryByOsignAndUid(int osign, int uid) {
		return ordersMapper.selectByOsign(osign, uid);
	}

	public List<Orders> queryByUid(int uid) {
		return ordersMapper.selectByUid(uid);
	}

	public int updateOrders(Orders orders) {
		return ordersMapper.updateByPrimaryKeySelective(orders);
	}

	public List<Orders> queryBySellerId(int uid) {
		return ordersMapper.selectBySellerUid(uid);
	}

	public Orders queryByOid(int oid) {
		return ordersMapper.selectByPrimaryKey(oid);
	}

	public int updateByTicketAndSellerId(String ticket, int sellerId) {
		return ordersMapper.updateByTicketAndSellerId(ticket,sellerId);
	}

	public List<Orders> queryBySellerIdPage(int uid, Integer lastdata, Integer pageSize) {
		return ordersMapper.selectBySellerUidPage(uid,lastdata,pageSize);
	}

	public List<Orders> queryAll(Date start, Date over) {
		return ordersMapper.selectAll(start,over);
	}

	public List<Orders> queryAllPage(Integer lastdata, Integer pageSize, Date start, Date over) {
		return ordersMapper.selectAllPage(lastdata, pageSize,start,over);
	}

	public List<Count> queryByTimeAndSellerId(int uid, Date start, Date over) {
		return ordersMapper.selectByTimeAndSellerId(uid, start, over);
	}

	public Integer querySumMoneyByTime(int uid, Date start, Date over) {
		return ordersMapper.selectSumMoneyByTime(uid,start,over);
	}

	public List<Count> queryUsers() {
		
		return ordersMapper.selectUsers();
	}

	public List<Count> queryStores() {
		
		return ordersMapper.selectStore();
	}

	public List<Count> queryGoods() {
		
		return ordersMapper.selectGoods();
	}
	
	
	
}

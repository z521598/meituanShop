package com.lsq.meituan.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Count;
import com.lsq.meituan.pojo.Orders;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer oid);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer oid);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
    
    //根据类型查询用户的不同订单,联合查询
    List<Orders> selectByOsign(@Param("osign")Integer osign,@Param("uid")Integer uid);
    
    //查询商户的订单
    List<Orders> selectBySellerUid(@Param("sellerUid")Integer SellerUid);
    
    //查询普通用户的所有订单
    List<Orders> selectByUid(Integer uid);
    
    //管理员查询所有订单
    List<Orders> selectAllPage(@Param("lastdata")Integer lastdata,
			@Param("pageSize")Integer pageSize, @Param("start")Date start, @Param("over")Date over);
    
    List<Orders> selectAll(@Param("start")Date start, @Param("over")Date over);
    //验证美团券
	int updateByTicketAndSellerId(@Param("ticket")String ticket, @Param("sellerId")int sellerId);

	List<Orders> selectBySellerUidPage(@Param("sellerUid")int uid, @Param("lastdata")Integer lastdata,
			@Param("pageSize")Integer pageSize);
	
	List<Count> selectByTimeAndSellerId(@Param("sellerId")int uid, @Param("start")Date start,
			@Param("over")Date over);

	Integer selectSumMoneyByTime(@Param("sellerId")int uid, @Param("start")Date start,
			@Param("over")Date over);
	
	List<Count> selectUsers();
	
	List<Count> selectStore();
	
	List<Count> selectGoods();
	
}
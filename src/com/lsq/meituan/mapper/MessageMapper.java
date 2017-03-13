package com.lsq.meituan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

	List<Message> selectByUusername(@Param("uusername")String uusername);
	
	List<Message> selectAllPage(@Param("lastdata")Integer lastdata,@Param("pageSize") Integer pageSize);
	
	List<Message> selectAll();

	List<Message>  selectByUusernamePage(@Param("uusername")String uusername, @Param("lastdata")Integer lastdata,
			@Param("pageSize")Integer pageSize);
}
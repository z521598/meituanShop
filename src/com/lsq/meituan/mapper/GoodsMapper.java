package com.lsq.meituan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer gid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer gid);
    
    Goods selectByGidAndComment(Integer gid);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    int updateByPrimaryKey(Goods record);

	List<Goods> selectByUid(Integer uid);

	List<Goods> selectAll();

	List<Goods> selectByGtype(String gtype);

	List<Goods> selectByAdv();
	
	List<Goods> selectForSearch(@Param("gname")String gname);

	List<Goods> selectPage(@Param("lastdata")Integer lastdata,@Param("pageSize") Integer pageSize);
}
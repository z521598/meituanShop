package com.lsq.meituan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Store;

public interface StoreMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKeyWithBLOBs(Store record);

    int updateByPrimaryKey(Store record);

    List<Store> selcetAll();
    
    List<Store> selcetAllForAdmin();

	List<Store> selcetPage(@Param("lastdata")Integer lastdata,@Param("pageSize")Integer pageSize);

	Store selectByUid(@Param("uid")int uid);
	
	List<Store> selectStoreAndGoodsBySid(@Param("sid")Integer sid);
	
}
package com.lsq.meituan.mapper;

import java.util.List;

import com.lsq.meituan.pojo.Advertise;

public interface AdvertiseMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Advertise record);

    int insertSelective(Advertise record);

    Advertise selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Advertise record);

    int updateByPrimaryKey(Advertise record);

	List<Advertise> selectAll();
}
package com.lsq.meituan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.AdvertiseMapper;
import com.lsq.meituan.pojo.Advertise;

public class AdvertiseService {

	@Autowired
	AdvertiseMapper advertiseMapper;

	public List<Advertise> queryAll() {
		return advertiseMapper.selectAll();
	}

	public int UpdateByAid(Advertise advertise) {
		return advertiseMapper.updateByPrimaryKeySelective(advertise);
	}

	public int addAdvertise(Advertise advertise) {
		return advertiseMapper.insertSelective(advertise);
	}

	
}

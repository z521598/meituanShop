package com.lsq.meituan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.StoreMapper;
import com.lsq.meituan.pojo.Store;

public class StoreService {
	@Autowired
	StoreMapper storeMapper;
	
	public int add(Store stores) {
		return storeMapper.insertSelective(stores);
	}

	public List<Store> queryAll() {
		return storeMapper.selcetAll();
	}
	//
	public Store queryBySid(int sid) {
		return storeMapper.selectByPrimaryKey(sid);
	}
	
	public Store queryByUid(int uid) {
		return storeMapper.selectByUid(uid);
	}

	public int updateBySid(Store store) {
		return storeMapper.updateByPrimaryKeySelective(store);
	}

	public List<Store> queryAllForAdmin() {
		return storeMapper.selcetAllForAdmin();
	}

	public List<Store> queryPage(Integer lastdata, Integer pageSize) {
		return storeMapper.selcetPage(lastdata,pageSize);
	}

	public List<Store> queryGoodsAndStoreBySid(Integer sid) {
		return storeMapper.selectStoreAndGoodsBySid(sid);
	}


	
}

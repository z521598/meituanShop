package com.lsq.meituan.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lsq.meituan.mapper.UsersMapper;
import com.lsq.meituan.pojo.Users;

public class UsersService {
	@Autowired
	UsersMapper usersMapper;
	

	public Users sellerLogin(Users users) {
		Users u = usersMapper.selectForSellerLogin(users);
		return u;
	}
	
	public Users adminLogin(Users users) {
		Users u = usersMapper.selectForAdminLogin(users);
		return u;
	}
	
	public Users usersLogin(Users users) {
		Users u = usersMapper.selectForUsersLogin(users);
		//usersMapper.updateByUsernameAndPwd(users);
		return u;
	}
	public List<Users> queryBy2(){
		List<Users> list = new ArrayList<Users>();
		list = usersMapper.selectByUsign(2);
		return list;
	}
	
	public List<Users> queryBy12(){
		List<Users> list = new ArrayList<Users>();
		list = usersMapper.selectByUsign12();
		return list;
	}
	
	public Users queryByUid(Integer uid){
		Users users = usersMapper.selectByPrimaryKey(uid);
		return users;
	}

	public int findByUusername(String uusername) {
		return usersMapper.selectByUusernameForTest(uusername);
	}

	public int addUsers(Users users) {
		return usersMapper.insertSelective(users);
	}
	
	public int updateByUid(Users users) {
		
		return usersMapper.updateByPrimaryKeySelective(users);
	}

	public List<Users> queryPage(Integer lastdata, Integer pageSize) {
		return usersMapper.selectPage(lastdata,pageSize);
	}

	public List<String> queryAllUusername() {
		return usersMapper.selectAllUusername();
	}
	
}

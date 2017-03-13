package com.lsq.meituan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Users;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

	Users selectForSellerLogin(Users users);
	
	Users selectForAdminLogin(Users users);
	
	List<Users> selectByUsign(Integer usign);

	Users selectForUsersLogin(Users users);
	//spring注解，声明变量名
	int selectByUusernameForTest(@Param("uusername")String uusername);

	List<Users> selectByUsign12();

	List<Users> selectPage(@Param("lastdata")Integer lastdata,@Param("pageSize")Integer pageSize);

	List<String> selectAllUusername();

	int updateByUsernameAndPwd(Users users);
	
}
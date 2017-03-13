package com.lsq.meituan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lsq.meituan.pojo.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);
    
	List<Comment> selectAll();

	List<Comment> selectByUid(@Param("uid")int uid);

	List<Comment> selectPageForAdmin(@Param("lastdata")Integer lastdata,@Param("pageSize")Integer pageSize);

	List<Comment> selectByUidPage(@Param("uid")int uid,@Param("lastdata") Integer lastdata, @Param("pageSize")Integer pageSize);
}
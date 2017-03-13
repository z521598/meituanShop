package com.lsq.meituan.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;




import org.springframework.web.multipart.MultipartFile;

import com.lsq.meituan.mapper.GoodsMapper;
import com.lsq.meituan.pojo.Goods;



public class GoodsService {
	@Autowired
	GoodsMapper goodsMapper;
	
	public int addGoods(Goods goods, HttpServletRequest request, MultipartFile gcover2) throws IllegalStateException, IOException{
		//拼写商品内容
		String gcontent = "";
		String[] contentName = request.getParameterValues("contentName");
		String[] contentNumber = request.getParameterValues("contentNumber");
		for(int i = 0 ; i < contentName.length ; i++){
			if((!contentName[i].trim().equals("") && !contentNumber[i].trim().equals(""))){
				String item = contentName[i].trim() + "*" + contentNumber[i].trim()+",";
				gcontent += item;
			}else{
				continue;
			}
		}
		//去分号,去空格
		gcontent = gcontent.trim().substring(0,gcontent.trim().length()-1);
		
		
		String url = request.getSession().getServletContext().getRealPath("goods");
		// 如果没有该路径，自动创建
		File floder = new File(url);
		if (!floder.exists()) {
			floder.mkdir();
		}
		if (gcover2 != null) {
			// 原始文件名
			String originalFilename = gcover2.getOriginalFilename();
			// 新文件名
			String fileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			// 保存图片
			gcover2.transferTo(new File(url, fileName));
			// 保存文件名至数据库
			goods.setGcover("goods/" + fileName);
		}
		goods.setGcontent(gcontent);
		goods.setGstate(0);
		goods.setIsonsale(0);
		return goodsMapper.insertSelective(goods);
	}

	public List<Goods> queryByUid(Integer uid) {
		return goodsMapper.selectByUid(uid);
	}

	public Goods queryByGid(int gid) {
		return goodsMapper.selectByPrimaryKey(gid);
	}
	
	public Goods queryByGidAndComment(int gid) {
		return goodsMapper.selectByGidAndComment(gid);
	}
	
	
	public List<Goods> queryAll() {
		return goodsMapper.selectAll();
	}
	
	public List<Goods> queryByGtype(String gtype) {
		return goodsMapper.selectByGtype(gtype);
	}

	public List<Goods> queryByAdv() {
		return goodsMapper.selectByAdv();
	}

	public int updateByGid(Goods goods) {
		return goodsMapper.updateByPrimaryKeySelective(goods);
	}

	public List<Goods> queryForSearch(String gname) {
		return goodsMapper.selectForSearch("%"+gname+"%");
	}

	public List<Goods> queryPage(Integer lastdata, Integer pageSize) {
		return goodsMapper.selectPage(lastdata,pageSize);
	}

	
	
}

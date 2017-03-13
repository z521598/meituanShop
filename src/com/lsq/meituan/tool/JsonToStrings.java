package com.lsq.meituan.tool;



public class JsonToStrings {
	
	public String[] toStrings(String jsonData){
		String[] strs = null;
		if (jsonData.startsWith("[") && jsonData.endsWith("]")) {//当字符串以“[”开始，以“]”结束时，表示该字符串解析出来为集合
	          //截取字符串，去除中括号
	          jsonData = jsonData.substring(1, jsonData.length() -1);
	          if(jsonData.equals("")){
	        	  return null;
	          }else{
	        	  //去除引号
	        	  jsonData = jsonData.replace("\"", "");
	        	 strs = jsonData.split(",");
	          }
	      }//if方法
		
		return strs;
	}
}

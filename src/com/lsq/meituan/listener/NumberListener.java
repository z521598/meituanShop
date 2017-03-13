package com.lsq.meituan.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.lsq.meituan.tool.DB;

public class NumberListener implements HttpSessionListener{
	
	private DB db = new DB();
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		Integer sum = (Integer)arg0.getSession().getServletContext().getAttribute("activeUser");
		if(sum != null){
			sum++;
		}else{
			sum = 1;
		}
		db.update("UPDATE history SET `sum` = history.sum+1");
		arg0.getSession().getServletContext().setAttribute("activeUser", sum);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		Integer sum = (Integer)arg0.getSession().getServletContext().getAttribute("activeUser");
    	if(sum !=null){
    		sum--;
    	}
    	arg0.getSession().getServletContext().setAttribute("activeUser", sum);
	
		
	}

}

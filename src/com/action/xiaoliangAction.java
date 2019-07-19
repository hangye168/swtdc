package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TGoodsDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderItemDAO;
import com.model.Shanghu;
import com.model.TGoods;
import com.model.TOrder;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class xiaoliangAction extends ActionSupport {
	private TGoodsDAO goodsDAO;

	private TOrderDAO orderDAO;

	public String index() {
		HttpServletRequest req = ServletActionContext.getRequest();
		 
		 Map session= ServletActionContext.getContext().getSession();
		 Shanghu shanghu=(Shanghu)session.get("shanghu");
		 String items="";
		 String score="";
		List<TOrder> list = orderDAO.report(shanghu.getId());
		if(list!=null && list.size()>0){
			for (TOrder order : list) {
				items = items + "'"+order.getOrderDate()+"',";
				score = score + order.getSjfk() + ",";
			}
			items = items.substring(0, items.length()-1);
			score = score.substring(0, score.length()-1);
		}
		req.setAttribute("items", items);
		req.setAttribute("score", score);
		 
		return ActionSupport.SUCCESS;
	}

	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public TOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(TOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
 
}

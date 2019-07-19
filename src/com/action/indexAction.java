package com.action;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.ShanghuDAO;
import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderItemDAO;
import com.model.Shanghu;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class indexAction extends ActionSupport
{
	private TGoodsDAO goodsDAO;
	private TOrderItemDAO orderItemDAO;
	private TCatelogDAO catelogDAO;
	private ShanghuDAO shanghuDAO;
	private int store;
	private String message;
	private String path;
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session= ServletActionContext.getContext().getSession();
 
		
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		session.put("cateLogList", cateLogList);
 
		
		List shlist = shanghuDAO.findAll();
		request.put("shlist", shlist);
		
	 
		if(session.get("store")!=null){
			int st = Integer.parseInt(session.get("store")+"");
			if(st!=store){
				Cart cart = (Cart)session.get("cart");
				if(cart!=null && cart.getItems()!=null){
					cart.getItems().clear();
					session.put("cart", cart);
				}
			}
		}
		session.put("store", store);
	
		return ActionSupport.SUCCESS;
	}
	
 
	public String shindex()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session= ServletActionContext.getContext().getSession();
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		session.put("cateLogList", cateLogList);
		sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' and shid = "+store+" order by goodsId desc";
		List<TGoods> goodsList=goodsDAO.getHibernateTemplate().find(sql);
		 
		if(goodsList!=null&&goodsList.size()>0){
			for (TGoods tgoods : goodsList) {
				String shname = shanghuDAO.findById(tgoods.getShid()).getName();
				tgoods.setShname(shname);
			}
		}
	 
		request.put("goodsByCatelogList", goodsList);
		
	 
		if(session.get("store")!=null){
			int st = Integer.parseInt(session.get("store")+"");
			if(st!=store){
				Cart cart = (Cart)session.get("cart");
				if(cart!=null && cart.getItems()!=null){
					cart.getItems().clear();
					session.put("cart", cart);
				}
			}
		}
		
		Shanghu shanghu = shanghuDAO.findById(store);
		request.put("shanghu", shanghu);
		session.put("store", store);
	
		return ActionSupport.SUCCESS;
	}
	

	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}


	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}


	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}


 


	public int getStore() {
		return store;
	}


	public void setStore(int store) {
		this.store = store;
	}


	public TCatelogDAO getCatelogDAO() {
		return catelogDAO;
	}


	public void setCatelogDAO(TCatelogDAO catelogDAO) {
		this.catelogDAO = catelogDAO;
	}

 

	public ShanghuDAO getShanghuDAO() {
		return shanghuDAO;
	}


	public void setShanghuDAO(ShanghuDAO shanghuDAO) {
		this.shanghuDAO = shanghuDAO;
	}

 
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
	
}

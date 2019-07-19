package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.ShanghuDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderItemDAO;
import com.dao.TUserDAO;
import com.model.Shanghu;
import com.model.TGoods;
import com.model.TOrder;
import com.model.TOrderItem;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class buyAction extends ActionSupport
{
	private int goodsId;
	private int quantity;
	
	private int orderId;
	private int state;
	private int pid;
	private TGoodsDAO goodsDAO;
	private TOrderDAO orderDAO;
	private TOrderItemDAO orderItemDAO;
	private String message;
	private String path;
	
	private String odderSonghuodizhi;
	private String odderFukuangfangshi;
	//Spring注入相关dao
	private ShanghuDAO shanghuDAO;
	private TUserDAO userDAO;
	
	//购物车中添加
	public String addToCart()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		TOrderItem orderItem=new TOrderItem();
		orderItem.setGoods(goods);
		orderItem.setGoodsQuantity(quantity);
		
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		
		if(cart.getSid()!=0 && cart.getSid()!=goods.getShid()){
			if(cart.getItems()!=null){
				cart.getItems().clear();
			}
			
		}
		cart.setSid(goods.getShid());
		cart.addGoods(goodsId, orderItem);
		session.put("cart",cart);
		session.put("store", goods.getShid());
		//this.setMessage("");
		this.setPath("myCart.action");
		return "succeed";
	}
	
	
	//返回购物车页面
	public String myCart()
	{
		return ActionSupport.SUCCESS;
	}
	
	//
	public String orderQueren()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		return ActionSupport.SUCCESS;
	}
	
	//
	public String orderSubmit()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		TUser user=(TUser)session.get("user");
		
		Map<String,List<TOrderItem>> map = new HashMap<String,List<TOrderItem>>();
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{
			TOrderItem orderItem = (TOrderItem) it.next();
			int goodid = orderItem.getGoods().getGoodsId();
			String shid = goodsDAO.findById(goodid).getShid()+"";
			if(map.containsKey(shid)){
				List<TOrderItem> list = map.get(shid);
				list.add(orderItem);
			}else{
				List<TOrderItem> list = new ArrayList<TOrderItem>();
				list.add(orderItem);
				map.put(shid, list);
			}
			
		}
		
		
	   for (Map.Entry<String, List<TOrderItem>> entry : map.entrySet()) {
	           String key = entry.getKey();
	        
	           List<TOrderItem> list = entry.getValue();
	        
	            try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	           
		       	TOrder order=new TOrder();
				order.setOrderBianhao(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
				order.setOrderDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				order.setOrderZhuangtai("未付款");
				order.setOrderUserId(user.getUserId());
				order.setOrderJine(getTotalPrice(list));
				order.setOdderFukuangfangshi(odderFukuangfangshi);
				order.setOdderSonghuodizhi(odderSonghuodizhi);
				
				 
				order.setSjfk(cart.getfkPrice(list));
				order.setStore("0");
			 
				order.setShid(Integer.parseInt(key));
				orderDAO.save(order);
				
				for (Iterator it = list.iterator(); it.hasNext();)
				{
	
					TOrderItem orderItem = (TOrderItem) it.next();
					orderItem.setOrderId(order.getOrderId());
					orderItem.setGoodsId(orderItem.getGoods().getGoodsId());
					orderItemDAO.save(orderItem);
				}
			
		            
	   }
		
		 
		cart.getItems().clear();
		cart.setSjfk(0);
		session.put("cart", cart);
		
 
		return ActionSupport.SUCCESS;
		
	}
	
	
	
	public int getTotalPrice(List list)
	{

		int totalPrice = 0;
		for (Iterator it = list.iterator(); it.hasNext();)
		{

			TOrderItem orderItem = (TOrderItem) it.next();
			TGoods goods = orderItem.getGoods();
			int quantity = orderItem.getGoodsQuantity();
			totalPrice += goods.getGoodsShichangjia() * quantity;
		}
		return totalPrice;
	}
	
	
	
	public String myOrder()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		String sql="from TOrder where orderUserId="+user.getUserId();
		List<TOrder> orderList=orderDAO.getHibernateTemplate().find(sql);
		
		if(orderList!=null && orderList.size()>0){
			for (TOrder order : orderList) {
				String shname = shanghuDAO.findById(order.getShid()).getName();
				order.setShname(shname);
			}
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderMana()
	{
		String sql="from TOrder where 1=1 ";
		Map session= ServletActionContext.getContext().getSession();
		if(session.get("shanghu")!=null){
			Shanghu shanghu=(Shanghu)session.get("shanghu");
			sql = sql + " and shid = " + shanghu.getId();
		}
		sql = sql + " order by orderId desc ";
		List orderList=orderDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<orderList.size();i++)
		{
			TOrder order=(TOrder)orderList.get(i);
			order.setUser(userDAO.findById(order.getOrderUserId()));;
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return ActionSupport.SUCCESS;
	}
	
	 
	
	
	public String orderDel()//用户自己删除订单
	{
		TOrder order=orderDAO.findById(orderId);
		orderDAO.delete(order);
		
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		this.setMessage("删除成功");
		this.setPath("myOrder.action?userId="+user.getUserId());
		return "succeed";
	}
	
	public String orderDelByAd()//管理员删除订单
	{
		TOrder order=orderDAO.findById(orderId);
		orderDAO.delete(order);
		String sql="delete from TOrderItem where orderId="+orderId;
		orderItemDAO.getHibernateTemplate().bulkUpdate(sql);
		
		this.setMessage("删除成功");
		this.setPath("orderMana.action");
		return "succeed";
	}
	
 
	
	public String orderShouli()
	{
		TOrder order=orderDAO.findById(orderId);
		if(state==2){
			order.setOrderZhuangtai("已付款"); 
			this.setMessage("操作成功");
			this.setPath("myOrder.action");
		}
		if(state==3){
			
			long mi = 0l;
			String orderdate = order.getOrderDate();
			try {
				Date yd = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(orderdate);
				Date now = new Date();
			    mi = now.getTime() - yd.getTime();
				mi = mi/1000/60;
				 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(mi>10){
				this.setMessage("无法取消订单"); 
				this.setPath("myOrder.action");
				return "succeed";
			}else{
				order.setOrderZhuangtai("已取消"); 
				this.setMessage("操作成功");
			}
			
			this.setPath("myOrder.action");
		}
		orderDAO.attachDirty(order);
		return "succeed";
	}
	
	
	
	public String orderDetail()
	{
		String sql="from TOrderItem where orderId="+orderId;
		List orderItemList=orderItemDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<orderItemList.size();i++)
		{
			TOrderItem orderItem=(TOrderItem)orderItemList.get(i);
			orderItem.setGoods(goodsDAO.findById(orderItem.getGoodsId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderItemList", orderItemList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderDetail1()
	{
		String sql="from TOrderItem where orderId="+orderId;
		List orderItemList=orderItemDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<orderItemList.size();i++)
		{
			TOrderItem orderItem=(TOrderItem)orderItemList.get(i);
			orderItem.setGoods(goodsDAO.findById(orderItem.getGoodsId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderItemList", orderItemList);
		request.put("gsize", orderItemList.size());
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String testCart()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Map items=cart.getItems();
		
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

			TOrderItem orderItem = (TOrderItem) it.next();
			TGoods goods = orderItem.getGoods();
			int quantity = orderItem.getGoodsQuantity();
		}
		return null;
	}
	
	/**
	 * get和set方法------------------------------------------
	 * @return
	 */
	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}
	
	public String getOdderFukuangfangshi()
	{
		return odderFukuangfangshi;
	}



	public void setOdderFukuangfangshi(String odderFukuangfangshi)
	{
		this.odderFukuangfangshi = odderFukuangfangshi;
	}



	public String getOdderSonghuodizhi()
	{
		return odderSonghuodizhi;
	}



	public void setOdderSonghuodizhi(String odderSonghuodizhi)
	{
		this.odderSonghuodizhi = odderSonghuodizhi;
	}



	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}
	public int getGoodsId()
	{
		return goodsId;
	}
	
	public int getOrderId()
	{
		return orderId;
	}



	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}






	public String getMessage()
	{
		return message;
	}



	public void setMessage(String message)
	{
		this.message = message;
	}



	public String getPath()
	{
		return path;
	}



	public void setPath(String path)
	{
		this.path = path;
	}


	public void setGoodsId(int goodsId)
	{
		this.goodsId = goodsId;
	}
	public TOrderDAO getOrderDAO()
	{
		return orderDAO;
	}
	public void setOrderDAO(TOrderDAO orderDAO)
	{
		this.orderDAO = orderDAO;
	}
	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}
	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}
	public int getQuantity()
	{
		return quantity;
	}
	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}



 

	public ShanghuDAO getShanghuDAO() {
		return shanghuDAO;
	}



	public void setShanghuDAO(ShanghuDAO shanghuDAO) {
		this.shanghuDAO = shanghuDAO;
	}



	public int getState() {
		return state;
	}



	public void setState(int state) {
		this.state = state;
	}
 

	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public TUserDAO getUserDAO() {
		return userDAO;
	}



	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	

}

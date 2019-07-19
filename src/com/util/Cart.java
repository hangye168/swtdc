package com.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.model.TGoods;
import com.model.TOrderItem;

public class Cart
{

	protected Map<Integer, TOrderItem> items;
    private int sjfk;
    private int sid;
	public Cart()
	{

		if (items == null)
		{
			items = new HashMap<Integer, TOrderItem>();
		}
	}

	public void addGoods(Integer goodsId, TOrderItem orderItem)
	{

		if (items.containsKey(goodsId))
		{

			TOrderItem _orderitem = items.get(goodsId);
			_orderitem.setGoodsQuantity(_orderitem.getGoodsQuantity()+ orderItem.getGoodsQuantity());
			items.put(goodsId, _orderitem);
		} else
		{

			items.put(goodsId, orderItem);
		}
	}
	
	public void delGoods(Integer goodsId)
	{
		items.remove(goodsId);
	}
	

	public void updateCart(Integer goodsId, int quantity)
	{

		TOrderItem orderItem = items.get(goodsId);
		orderItem.setGoodsQuantity(quantity);
		items.put(goodsId, orderItem);
	}

	public int getTotalPrice()
	{

		int totalPrice = 0;
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

			TOrderItem orderItem = (TOrderItem) it.next();
			TGoods goods = orderItem.getGoods();
			int quantity = orderItem.getGoodsQuantity();
			totalPrice += goods.getGoodsShichangjia() * quantity;
		}
		return totalPrice;
	}
	public int getTotalPrice(List<TOrderItem> list)
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
	
	public int getfkPrice(List<TOrderItem> list)
	{
		int totalPrice = getTotalPrice(list);
		return totalPrice;
	}

	
	public int getfkPrice()
	{
        int fkje=0;
		int totalPrice = getTotalPrice();
		return totalPrice;
	}
	
	public Map<Integer, TOrderItem> getItems()
	{
		return items;
	}

	public int getSjfk() {
		int total = getTotalPrice();
		if(sjfk==0 && total!=0){
			sjfk = total;
		}
		return sjfk;
	}

	public void setSjfk(int sjfk) {
		this.sjfk = sjfk;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

    

	
}

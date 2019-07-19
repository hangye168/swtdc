package com.service;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.util.Cart;

public class cartService
{
	public String modiNum(int goodsId,int quantity)
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.updateCart(goodsId, quantity);
		 
	 
		 int sjfk = cart.getfkPrice();
		 cart.setSjfk(sjfk);
		 
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
	public String delGoodsFromCart(int goodsId)
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.delGoods(goodsId);
	 
		 int sjfk = cart.getfkPrice();
		 cart.setSjfk(sjfk);
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
	
	public String clearCart()
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.getItems().clear();
		 cart.setSjfk(0);
		 session.setAttribute("cart", cart);
		 return "yes";
	}
}

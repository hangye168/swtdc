package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.PinglunDAO;
import com.dao.TGoodsDAO;
import com.model.Pinglun;
import com.model.Shanghu;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class pinglunAction extends ActionSupport
{
	private int id;
	private Pinglun pinglun;
	private String message;
	private String path;
	private TGoodsDAO goodsDAO;
	private PinglunDAO pinglunDAO;
	
	public String pinglunAdd()
	{
		HttpServletRequest req = ServletActionContext.getRequest();
		int gsize = req.getParameter("gsize") == null ? 0 : Integer
				.parseInt(req.getParameter("gsize"));
		
		HttpSession session = req.getSession();
		TUser user = (TUser) session.getAttribute("user");
		String plr = user.getUserName();
		String plsj = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		for (int i = 0; i < gsize; i++) {
			String plnr = req.getParameter("plnr" + i);
			String gid = req.getParameter("gid" + i);

			Pinglun pinglun = new Pinglun();
			pinglun.setUid(user.getUserId()+"");
			pinglun.setGid(Integer.parseInt(gid));
			pinglun.setPlr(plr);
			pinglun.setPlnr(plnr);
			pinglun.setPlsj(plsj);
			pinglunDAO.save(pinglun);
		}
		this.setMessage("评价成功");
		this.setPath("/common/add_success.jsp");
		return "succeed";
	}
	
	
	public String pinglunMana()
	{
		List<Pinglun> pinglunList = new ArrayList<Pinglun>();
		
		Map session= ServletActionContext.getContext().getSession();
		if(session.get("shanghu")!=null){
			Shanghu shanghu = (Shanghu) session.get("shanghu");
			 pinglunList =pinglunDAO.findAll1(shanghu.getId()+"");
		}else{
			 pinglunList =pinglunDAO.findAll();
		}
		
		
		if(pinglunList!=null && pinglunList.size()>0){
			for (Pinglun pinglun : pinglunList) {
				pinglun.setGname(goodsDAO.findById(pinglun.getGid()).getGoodsName());
			}
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("pinglunList", pinglunList);
		return ActionSupport.SUCCESS;
	}
	
	public String pinglunDel()
	{
		Pinglun pinglun=pinglunDAO.findById(id);
		pinglunDAO.delete(pinglun);
		this.setMessage("操作成功");
		this.setPath("pinglunMana.action");
		return "succeed";
	}
	
	
	public String pinglunDetail()
	{
		Pinglun pinglun=pinglunDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("pinglun", pinglun);
		return ActionSupport.SUCCESS;
	}
	
	public String pinglunDetailQian()
	{
		Pinglun pinglun=pinglunDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("pinglun", pinglun);
		
		return ActionSupport.SUCCESS;
	}
	

	public PinglunDAO getGonggaoDAO()
	{
		return pinglunDAO;
	}

	public void setGonggaoDAO(PinglunDAO pinglunDAO)
	{
		this.pinglunDAO = pinglunDAO;
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


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Pinglun getPinglun() {
		return pinglun;
	}


	public void setPinglun(Pinglun pinglun) {
		this.pinglun = pinglun;
	}


	public PinglunDAO getPinglunDAO() {
		return pinglunDAO;
	}


	public void setPinglunDAO(PinglunDAO pinglunDAO) {
		this.pinglunDAO = pinglunDAO;
	}


	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}


	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}


	 

    
	
}

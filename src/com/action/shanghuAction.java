package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.ShanghuDAO;
import com.model.Shanghu;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class shanghuAction extends ActionSupport
{
	private int id;
	private Shanghu shanghu = new Shanghu();
	private String message;
	private String path;
	private String userName;
	private String userPw;
	private String name;
	private String tel;
	private String fujian;
	private ShanghuDAO shanghuDAO;
	
	
	public String shanghuReg()
	{
		Shanghu shanghu=new Shanghu();
		shanghu.setUname(userName);
		shanghu.setPwd(userPw);
		shanghu.setName(name);
		shanghu.setTel(tel);
		shanghuDAO.save(shanghu);
		this.setMessage("注册成功");
		this.setPath("qiantai/shanghu/shanghulogin.jsp");
		return "succeed";
	}
	
	public String shanghuLogin()
	{
		String sql="from Shanghu where uname=? and pwd=?";
		Object[] con={userName,userPw};
		List shanghuList=shanghuDAO.getHibernateTemplate().find(sql,con);
		if(shanghuList.size()==0)
		{
			this.setMessage("用户名或密码错误");
			this.setPath("qiantai/shanghu/shanghulogin.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 Shanghu shanghu=(Shanghu)shanghuList.get(0);
			 session.put("shanghu", shanghu);
			 session.put("userType","1");
			 
			 this.setMessage("成功登录");
			 this.setPath("admin/index.jsp");
		}
		return "succeed";
	}
	
	
	
	public String editShanghu()
	{
		Map session= ServletActionContext.getContext().getSession();
		Shanghu shanghu = (Shanghu) session.get("shanghu");
		shanghu.setId(id);
		shanghu.setUname(userName);
		shanghu.setPwd(userPw);
		shanghu.setName(name);
		shanghu.setTel(tel);
		shanghu.setLogo(fujian);
		shanghuDAO.attachDirty(shanghu);
		session.put("shanghu", shanghu);
		this.setMessage("修改成功");
		this.setPath("admin/shanghu/shanghuinfo.jsp");
		return "succeed";
	}
	
	public String shanghuAdd()
	{
 
		shanghuDAO.save(shanghu);
		this.setMessage("操作成功");
		this.setPath("shanghuMana.action");
		return "succeed";
	}
	
	
	public String shanghuMana()
	{
		List shanghuList =shanghuDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shanghuList", shanghuList);
		return ActionSupport.SUCCESS;
	}
	
	public String shanghuDel()
	{
		Shanghu shanghu=shanghuDAO.findById(id);
		shanghuDAO.delete(shanghu);
		this.setMessage("操作成功");
		this.setPath("shanghuMana.action");
		return "succeed";
	}
	
	
	public String shanghuDetail()
	{
		Shanghu shanghu=shanghuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shanghu", shanghu);
		return ActionSupport.SUCCESS;
	}
	
	public String shanghuDetailQian()
	{
		Shanghu shanghu=shanghuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shanghu", shanghu);
		
		return ActionSupport.SUCCESS;
	}
	

	public ShanghuDAO getGonggaoDAO()
	{
		return shanghuDAO;
	}

	public void setGonggaoDAO(ShanghuDAO shanghuDAO)
	{
		this.shanghuDAO = shanghuDAO;
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


	public Shanghu getHuodong() {
		return shanghu;
	}


	public void setHuodong(Shanghu shanghu) {
		this.shanghu = shanghu;
	}


	public Shanghu getShanghu() {
		return shanghu;
	}


	public void setShanghu(Shanghu shanghu) {
		this.shanghu = shanghu;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public ShanghuDAO getShanghuDAO() {
		return shanghuDAO;
	}


	public void setShanghuDAO(ShanghuDAO shanghuDAO) {
		this.shanghuDAO = shanghuDAO;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
 

    
	
}

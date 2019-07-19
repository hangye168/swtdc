package com.action;
//�͹���Ա��صĲ���
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.model.TAdmin;
import com.opensymphony.xwork2.ActionSupport;

public class adminAction extends ActionSupport
{
	//��ǰ�˵Ĳ�����Ϣ
	private int userId;
	private String userName;
	private String userPw;
	 
	private String message;
	private String path;
	
	private int index=1;

	//Springע��  
	private TAdminDAO adminDAO;
	
	//����Ա���
	public String adminAdd()
	{
		TAdmin admin=new TAdmin();
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		adminDAO.save(admin);
		this.setMessage("�����ɹ�");
		this.setPath("adminManage.action");
		return "succeed";
	}
	
	
	//����Ա����
	public String adminManage()
	{
		List adminList=adminDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return ActionSupport.SUCCESS;
	}
	
	 
	//ɾ������Ա
	public String adminDel()
	{
		adminDAO.delete(adminDAO.findById(userId));
		this.setMessage("ɾ���ɹ�");
		this.setPath("adminManage.action");
		return "succeed";
	}
	
	
	/**
	 * get��set����------------------------------------------
	 * @return
	 */
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}

	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}

	public String getMessage()
	{
		return message;
	}

	public int getIndex()
	{
		return index;
	}



	public void setIndex(int index)
	{
		this.index = index;
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

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	 
}

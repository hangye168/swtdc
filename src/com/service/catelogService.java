package com.service;

import java.util.List;

import com.dao.ShanghuDAO;
import com.dao.TCatelogDAO;

public class catelogService
{
    private TCatelogDAO catelogDAO;
    private ShanghuDAO shanghuDAO;
    
    public List findAllCatelog()
    {
    	try
		{
			Thread.sleep(500);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		return cateLogList;
    }
    //查找所有商户
    public List findAllShangHu()
    {
    	try
		{
			Thread.sleep(500);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	String sql="from ShangHu ";
		List ShanghuList=shanghuDAO.getHibernateTemplate().find(sql);
		return ShanghuList;
    }

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}
	public ShanghuDAO getShanghuDAO() {
		return shanghuDAO;
	}
	public void setShanghuDAO(ShanghuDAO shanghuDAO) {
		this.shanghuDAO = shanghuDAO;
	}
	
    
}

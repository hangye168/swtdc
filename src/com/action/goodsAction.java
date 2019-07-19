package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.PinglunDAO;
import com.dao.ShanghuDAO;
import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.model.Shanghu;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionSupport;

public class goodsAction extends ActionSupport
{
	private int goodsId;
	private int goodsCatelogId;
	private String goodsName;
	private String goodsMiaoshu;
	private String fujian;
	private String goodsYanse;
	private int goodsShichangjia;
	private int goodsTejia;
	private int kucun;
	private int catelogId;
	private int store;
	private int searchid;
	private String shName;
	private String message;
	private String path;
	private int shid;
	private TGoodsDAO goodsDAO;
	private TCatelogDAO catelogDAO;
	private ShanghuDAO shanghuDAO;
	private PinglunDAO pinglunDAO;
	
	
	public String goodsNoTejiaAdd()
	{
		TGoods goods=new TGoods();
		goods.setGoodsCatelogId(goodsCatelogId);
		goods.setGoodsName(goodsName);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(fujian);
		goods.setGoodsYanse(goodsYanse);
		goods.setGoodsShichangjia(goodsShichangjia);
	    goods.setKucun(kucun);
		goods.setGoodsIsnottejia("no");
		goods.setGoodsDel("no");
		
		Map session= ServletActionContext.getContext().getSession();
		Shanghu shanghu = (Shanghu) session.get("shanghu");
		goods.setShid(shanghu.getId());
		
		goodsDAO.save(goods);
		this.setMessage("操作成功");
		this.setPath("goodsManaNoTejia.action");
		return "succeed";
	}
	
	public String goodsNoTejiaDel()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		goods.setGoodsDel("yes");
		goodsDAO.attachDirty(goods);
		this.setMessage("操作成功");
		this.setPath("goodsManaNoTejia.action");
		return "succeed";
	}
	
	public String goodsManaNoTejia()
	{
		Map session= ServletActionContext.getContext().getSession();
		String userType="";
		if(session.get("userType")!=null){
			 userType =  session.get("userType")+"";
		}
		
		
		String sql="from TGoods where goodsDel='no'  ";
		if(userType.equals("1")){
			Shanghu shanghu = (Shanghu) session.get("shanghu");
			sql = sql + " and shid  = " + shanghu.getId();
		}
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<goodsList.size();i++)
		{
			TGoods goods=(TGoods)goodsList.get(i);
			System.out.println(goods.getGoodsCatelogId());
			goods.setGoodsCatelogName(catelogDAO.findById(goods.getGoodsCatelogId()).getCatelogName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	 
	
	
	public String toUpdate()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	public String updateGoods()
	{
		TGoods goods1=goodsDAO.findById(goodsId);
		goods1.setGoodsDel("yes");
		goodsDAO.attachDirty(goods1);
		
		TGoods goods=new TGoods();
		goods.setGoodsCatelogId(goodsCatelogId);
		goods.setGoodsName(goodsName);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(fujian);
		goods.setGoodsYanse(goodsYanse);
		goods.setGoodsShichangjia(goodsShichangjia);
		goods.setGoodsIsnottejia("no");
		goods.setGoodsDel("no");
		goods.setKucun(kucun);
		Map session= ServletActionContext.getContext().getSession();
		Shanghu shanghu = (Shanghu) session.get("shanghu");
		goods.setShid(shanghu.getId());
		
		goodsDAO.attachDirty(goods);
		this.setMessage("操作成功");
		this.setPath("goodsManaNoTejia.action");
		return "succeed";
		
	}
	
	
	
	public String goodsDetail()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		
		Shanghu shanghu = shanghuDAO.findById(goods.getShid());
		request.put("shanghu", shanghu);
		
		List plist = pinglunDAO.findByProperty("gid", goods.getGoodsId());
		request.put("plist", plist);
		
		return ActionSupport.SUCCESS;
	}
	
 
	
	
	
	public String goodsDetailHou()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
 
	public String goodsAllNoTejia()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		String sql="from TGoods where goodsDel='no'   order by goodsCatelogId";
		List goodsYesTejiaList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsYesTejiaList", goodsYesTejiaList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsByCatelog()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsCatelogId=? order by goodsCatelogId";
		Object[] con={catelogId};
		List<TGoods> goodsByCatelogList=goodsDAO.getHibernateTemplate().find(sql,con);
		
		if(goodsByCatelogList!=null&&goodsByCatelogList.size()>0){
			for (TGoods tgoods : goodsByCatelogList) {
				String shname = shanghuDAO.findById(tgoods.getShid()).getName();
				tgoods.setShname(shname);
			}
		}
		
		request.put("goodsByCatelogList", goodsByCatelogList);
		
		 
		return ActionSupport.SUCCESS;
	}
	
	public String goodsByCatelogsh()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
        Shanghu shanghu = shanghuDAO.findById(store);
		request.put("shanghu", shanghu);
		request.put("store", store);
		String sql="from TGoods where goodsDel='no' and goodsCatelogId=? and shid = "+store+" order by goodsCatelogId";
		Object[] con={catelogId};
		List<TGoods> goodsByCatelogList=goodsDAO.getHibernateTemplate().find(sql,con);
		
		if(goodsByCatelogList!=null&&goodsByCatelogList.size()>0){
			for (TGoods tgoods : goodsByCatelogList) {
				String shname = shanghuDAO.findById(tgoods.getShid()).getName();
				tgoods.setShname(shname);
			}
		}
		
		request.put("goodsByCatelogList", goodsByCatelogList);
		
		 
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String goodSearch()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		String sql="";
		
		if(searchid==1){
			if(catelogId==0)
			{
				sql="from TGoods where goodsDel='no' and goodsName like '%"+goodsName+"%'"+" order by goodsCatelogId";
			}
			else
			{
				sql="from TGoods where goodsDel='no' and goodsCatelogId="+catelogId+" and goodsName like '%"+goodsName+"%'"+" order by goodsCatelogId";
			}
			
			List<TGoods> goodsList=goodsDAO.getHibernateTemplate().find(sql);
			
			if(goodsList!=null&&goodsList.size()>0){
				for (TGoods tgoods : goodsList) {
					String shname = shanghuDAO.findById(tgoods.getShid()).getName();
					tgoods.setShname(shname);
				}
			}
			
			request.put("goodsByCatelogList", goodsList);
			return ActionSupport.SUCCESS;
		}
		if(searchid==2){
			sql="from Shanghu where name like '%"+shName+"%' ";
			List shlist=shanghuDAO.getHibernateTemplate().find(sql);
			request.put("shlist", shlist);
	 
			return "shlist";
		}
		
		return ActionSupport.SUCCESS;
		
	}
	
	
 
	public int getCatelogId()
	{
		return catelogId;
	}

	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}

	public int getGoodsCatelogId()
	{
		return goodsCatelogId;
	}
	public void setGoodsCatelogId(int goodsCatelogId)
	{
		this.goodsCatelogId = goodsCatelogId;
	}
	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}
	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}
	public int getGoodsId()
	{
		return goodsId;
	}
	public void setGoodsId(int goodsId)
	{
		this.goodsId = goodsId;
	}
	public String getGoodsMiaoshu()
	{
		return goodsMiaoshu;
	}
	public void setGoodsMiaoshu(String goodsMiaoshu)
	{
		this.goodsMiaoshu = goodsMiaoshu;
	}
	public String getGoodsName()
	{
		return goodsName;
	}
	
	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}
	
	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}

	public int getGoodsShichangjia()
	{
		return goodsShichangjia;
	}
	public void setGoodsShichangjia(int goodsShichangjia)
	{
		this.goodsShichangjia = goodsShichangjia;
	}
	public int getGoodsTejia()
	{
		return goodsTejia;
	}
	public void setGoodsTejia(int goodsTejia)
	{
		this.goodsTejia = goodsTejia;
	}
	public String getGoodsYanse()
	{
		return goodsYanse;
	}
	public void setGoodsYanse(String goodsYanse)
	{
		this.goodsYanse = goodsYanse;
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

	public int getKucun() {
		return kucun;
	}

	public void setKucun(int kucun) {
		this.kucun = kucun;
	}

	public ShanghuDAO getShanghuDAO() {
		return shanghuDAO;
	}

	public void setShanghuDAO(ShanghuDAO shanghuDAO) {
		this.shanghuDAO = shanghuDAO;
	}

	public int getStore() {
		return store;
	}

	public void setStore(int store) {
		this.store = store;
	}

	public PinglunDAO getPinglunDAO() {
		return pinglunDAO;
	}

	public void setPinglunDAO(PinglunDAO pinglunDAO) {
		this.pinglunDAO = pinglunDAO;
	}

	public int getShid() {
		return shid;
	}

	public void setShid(int shid) {
		this.shid = shid;
	}

	public int getSearchid() {
		return searchid;
	}

	public void setSearchid(int searchid) {
		this.searchid = searchid;
	}

	public String getShName() {
		return shName;
	}

	public void setShName(String shName) {
		this.shName = shName;
	}
	
	
}

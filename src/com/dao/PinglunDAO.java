package com.dao;
/**
 * 处理评论的sql语句执行
 */
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Pinglun;

 
public class PinglunDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(PinglunDAO.class);

	 
	protected void initDao() {
		// do nothing
	}

	public void save(Pinglun transientInstance) {
		log.debug("saving Pinglun instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Pinglun persistentInstance) {
		log.debug("deleting Pinglun instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Pinglun findById(java.lang.Integer id) {
		log.debug("getting Pinglun instance with id: " + id);
		try {
			Pinglun instance = (Pinglun) getHibernateTemplate().get(
					"com.model.Pinglun", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Pinglun instance) {
		log.debug("finding Pinglun instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Pinglun instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Pinglun as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	 
	public List findAll() {
		log.debug("finding all Pinglun instances");
		try {
			String queryString = "from Pinglun";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll1(String shid) {
		log.debug("finding all Pinglun instances");
		try {
			String queryString = " from Pinglun where gid in ( select goodsId from  TGoods where shid= "+shid+" )";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	

	public Pinglun merge(Pinglun detachedInstance) {
		log.debug("merging Pinglun instance");
		try {
			Pinglun result = (Pinglun) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Pinglun instance) {
		log.debug("attaching dirty Pinglun instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Pinglun instance) {
		log.debug("attaching clean Pinglun instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PinglunDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PinglunDAO) ctx.getBean("PinglunDAO");
	}
}
package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Shanghu;

 
public class ShanghuDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ShanghuDAO.class);

	 
	protected void initDao() {
		// do nothing
	}

	public void save(Shanghu transientInstance) {
		log.debug("saving Shanghu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Shanghu persistentInstance) {
		log.debug("deleting Shanghu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Shanghu findById(java.lang.Integer id) {
		log.debug("getting Shanghu instance with id: " + id);
		try {
			Shanghu instance = (Shanghu) getHibernateTemplate().get(
					"com.model.Shanghu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Shanghu instance) {
		log.debug("finding Shanghu instance by example");
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
		log.debug("finding Shanghu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Shanghu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	 
	public List findAll() {
		log.debug("finding all Shanghu instances");
		try {
			String queryString = "from Shanghu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Shanghu merge(Shanghu detachedInstance) {
		log.debug("merging Shanghu instance");
		try {
			Shanghu result = (Shanghu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Shanghu instance) {
		log.debug("attaching dirty Shanghu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Shanghu instance) {
		log.debug("attaching clean Shanghu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShanghuDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ShanghuDAO) ctx.getBean("ShanghuDAO");
	}
}
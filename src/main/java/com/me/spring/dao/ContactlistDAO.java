package com.me.spring.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.exception.AdException;
import com.me.spring.pojo.Contactlist;
import com.me.spring.pojo.Photo;


public class ContactlistDAO extends DAO{

	 public ContactlistDAO()
	 {
		 
	 }
	 public List get(String user) throws AdException
	 {
		 try {
				begin();
				Query q = getSession().createQuery("from Contactlist where user = :user");
				q.setString("user",user);
				List list = q.list();
				commit();
				return list;
			}catch(HibernateException e) {
				rollback();
				throw new AdException("Could not get contactlist ",e);
			}		 
	 }
	 public boolean havecontact(String user,String contact) throws AdException
	 {
		 try {
				begin();
				Query q = getSession().createQuery("from Contactlist where user = :user and contact = :contact");
				q.setString("user",user);
				q.setString("contact",contact);
				List list = q.list();
				commit();
				if(list.size() == 0)
					return false;
				else
					 return true;
			}catch(HibernateException e) {
				rollback();
				throw new AdException("Could not get contactlist ",e);
			}		 
	 }
	 public void save(String user,String contact) throws AdException
	 {
		 try {
				begin();
				Contactlist contactlist1 = new Contactlist(user,contact);
		      	getSession().save(contactlist1);
				commit();

			}catch(HibernateException e) {
				rollback();
				throw new AdException("Could not save contactlist ",e);
			}	
	 }
	 public void delete(String user,String contact) throws AdException
	 {
		 try {
				begin();
				Query q = getSession().createQuery("from Contactlist where user = :user and contact = :contact");
				q.setString("user",user);
				q.setString("contact",contact);
				Contactlist contactlist = (Contactlist) q.uniqueResult();
		      	getSession().delete(contactlist);
				commit();

			}catch(HibernateException e) {
				rollback();
				throw new AdException("Could not save contactlist ",e);
			}	
	 }
}

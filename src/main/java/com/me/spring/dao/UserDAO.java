package com.me.spring.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.exception.AdException;
import com.me.spring.pojo.User;

public class UserDAO extends DAO{
	public UserDAO()
	{
		
	}
	public User get(String account) throws AdException
	{
	 try {
	    begin();
		Query q = getSession().createQuery("from User where account = :account");
		q.setString("account",account);
		User user = (User) q.uniqueResult();
		commit();
		if(user == null) {
			return null;
		}
		return user;
	   }catch(HibernateException e) {
		   rollback();
		  throw new AdException("Could not get user "+account,e);
	   }
	}
	public boolean hasaccount(String account) throws AdException
	{
	 try {
	    begin();
		Query q = getSession().createQuery("from User where account = :account");
		q.setString("account",account);
		List aa = q.list();
		commit();
        if(aa.size() == 0)
        	return false;
        return true;
	   }catch(HibernateException e) {
		   rollback();
		  throw new AdException("Could not get user "+account,e);
	   }
	}
	public void update(User user) throws AdException
	{
		try {
			begin();
	      	getSession().update(user);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not save user "+ user.getAccount(),e);
		}
	}
	public void save(User user) throws AdException
	{
		try {
			begin();
	      	getSession().save(user);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not save user "+ user.getAccount(),e);
		}
	}
	public void delete(User user) throws AdException
	{
		try {
			begin();
	      	getSession().delete(user);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not delete user "+ user.getAccount(),e);
		}
	}
	public List searchUser(String searchby,String keyword) throws AdException
	{  
		try {
		begin();
		Query q;
		if(searchby.equals("account"))
		{
			q = getSession().createQuery("from User where account = :account");
			q.setString("account",keyword);
		}
		else if(searchby.equals("name"))
		{
		    q = getSession().createQuery("from User where name = :account");
			q.setString("account",keyword);
		}
		else if(searchby.equals("msn"))
		{
			q = getSession().createQuery("from User where msn = :account");
			q.setString("account",keyword);
		}
		else if(searchby.equals("email"))
		{
			q = getSession().createQuery("from User where email = :account");
			q.setString("account",keyword);
		}
		else 
		{
			q = getSession().createQuery("from User where address = :account");
			q.setString("account",keyword);
		}

		List list = q.list();
		commit();
		return list;
		} catch(HibernateException e) {
			rollback();
		 throw new AdException("Could not search user by  "+ searchby,e);
		}
	}

}

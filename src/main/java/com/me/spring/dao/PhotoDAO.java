package com.me.spring.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.exception.AdException;
import com.me.spring.pojo.Photo;
import com.me.spring.pojo.User;


public class PhotoDAO extends DAO{
	public PhotoDAO()
	{
		
	}
	
	public void save(String photoaddress,String photodescription,User user) throws AdException
	{
		try {
			begin();
			Photo photo = new Photo(photoaddress,photodescription,user);
	      	getSession().save(photo);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not save photo ",e);
		}
	}
	public Photo get(int photoid) throws AdException
	{
	 try {
	    begin();
		Query q = getSession().createQuery("from Photo where id = :photoid");
		q.setLong("photoid",photoid);
		Photo photo = (Photo) q.uniqueResult();
		commit();
		if(photo == null) {
			return null;
		}
		return photo;
	   }catch(HibernateException e) {
		   rollback();
		  throw new AdException("Could not get photo ",e);
	   }
	}
	public List getphoto(int userid) throws AdException
	{
	 try {
	    begin();
		Query q = getSession().createQuery("from Photo where user = :userid");
		q.setLong("userid",userid);
		List photos= q.list();
		commit();
		return photos;
	   }catch(HibernateException e) {
		   rollback();
		  throw new AdException("Could not get photo",e);
	   }
	}
	public void delete(int id) throws AdException
	{
		try {
			begin();
			Query q = getSession().createQuery("from Photo where id = :id");
			q.setLong("id",id);
			Photo photo = (Photo) q.uniqueResult();
	      	getSession().delete(photo);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not save photo ",e);
		}
	}
	
}

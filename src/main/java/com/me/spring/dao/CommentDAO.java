package com.me.spring.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.exception.AdException;
import com.me.spring.pojo.Comment;
import com.me.spring.pojo.Photo;
import com.me.spring.pojo.User;


public class CommentDAO extends DAO{
	public CommentDAO()
	{
		
	}
	
	public void save(String content,Photo photo,User user) throws AdException
	{
		try {
			begin();
			Comment comment = new Comment(content,photo,user);
	      	getSession().save(comment);
	      	commit();
		}catch(HibernateException e) {
			rollback();
			throw new AdException("Could not save photo ",e);
		}
	}
	public List getcomment(int photoid) throws AdException
	{
	 try {
	    begin();
		Query q = getSession().createQuery("from Comment where photo = :photoid");
		q.setLong("photoid",photoid);
		List commentlist= q.list();
		commit();
		return commentlist;
	   }catch(HibernateException e) {
		   rollback();
		  throw new AdException("Could not get photo",e);
	   }
	}

	
}

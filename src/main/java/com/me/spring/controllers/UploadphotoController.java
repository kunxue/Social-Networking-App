package com.me.spring.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;


import com.me.spring.dao.PhotoDAO;
import com.me.spring.exception.AdException;
import com.me.spring.pojo.Photo;
import com.me.spring.pojo.User;
import com.me.spring.validator.LoginValidator;
import com.me.spring.validator.UploadfileValidator;


public class UploadphotoController extends SimpleFormController{
     
	 public UploadphotoController()
	 {
		   setFormView("uploadphoto");
		   setCommandClass(Photo.class);
		   setValidator(new UploadfileValidator());
	 }
	   protected ModelAndView onSubmit(HttpServletRequest request,
				HttpServletResponse response, Object command, BindException errors)
				throws ServletException, IOException {
			Photo bean = (Photo) command;
			
			// let's see if there's content there
			MultipartFile file = bean.getFile();
			PhotoDAO photodao = new PhotoDAO();
		    HttpSession session = request.getSession();
		    User user = (User)session.getAttribute("user");	
		    session.setAttribute("bean",bean);
		    try {
				photodao.save(bean.getPhotoaddress(),bean.getPhotodescription(), user);
			} catch (AdException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(file == null)
			{
				return new ModelAndView("viewcontactlist");
			}
			return new ModelAndView("uploadsuccess","bean",bean);
	      
	   }
}

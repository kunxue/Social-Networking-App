package com.me.spring.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.me.spring.dao.DAO;
import com.me.spring.dao.UserDAO;
import com.me.spring.pojo.User;
import com.me.spring.validator.LoginValidator;
import com.me.spring.validator.RegistrationValidator;

public class RegistrationController extends SimpleFormController{

	   public RegistrationController()
	   {
		   setFormView("registration");
	   	  setCommandName("user");
	   	  setCommandClass(User.class);
	   	  setValidator(new RegistrationValidator());
	   }
	   protected ModelAndView onSubmit(HttpServletRequest request,
				HttpServletResponse response, Object command, BindException errors)
				throws Exception {
	       
		   User user = (User)command;
		   UserDAO userdao = new UserDAO();
		   userdao.save(user);
	        DAO.close();
		   return new ModelAndView("registrationsucceed");
	   }
}

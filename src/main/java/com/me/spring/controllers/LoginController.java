package com.me.spring.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.me.spring.dao.DAO;
import com.me.spring.dao.UserDAO;
import com.me.spring.pojo.User;
import com.me.spring.validator.LoginValidator;


public class LoginController extends SimpleFormController{
   public LoginController()
   {
	  setFormView("login");
   	  setCommandName("user");
   	  setCommandClass(User.class);
   	  setValidator(new LoginValidator());
   }
   protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
       
		User user = (User)command;	
		String account = user.getAccount();
		UserDAO userdao = new UserDAO();
		user = userdao.get(account);

	    HttpSession session = request.getSession();
	    session.setAttribute("user", user);	
        
	   return new ModelAndView("mainpage");
   }
}

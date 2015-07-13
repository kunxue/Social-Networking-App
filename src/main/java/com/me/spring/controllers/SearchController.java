package com.me.spring.controllers;

import java.util.List;

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
import com.me.spring.validator.SearchValidator;

public class SearchController extends SimpleFormController{

	   public SearchController()
	   {
		   setFormView("search");
	   	  setCommandName("user");
	   	  setCommandClass(User.class);
	   	  setValidator(new SearchValidator());
	   }
	   protected ModelAndView onSubmit(HttpServletRequest request,
				HttpServletResponse response, Object command, BindException errors)
				throws Exception {
		    HttpSession session = request.getSession();



			User user = (User)command;	
			String searchby = user.getPassword();
			String keyword = user.getAccount();
			UserDAO userdao = new UserDAO();
			List userlist = userdao.searchUser(searchby, keyword);

	        DAO.close();
		    session.setAttribute("userlist", userlist);	
		    
		    MyPagination pagination = new MyPagination();
  
	    session.setAttribute("pagination", pagination);	

		   return new ModelAndView("searchresult");
	   }
}

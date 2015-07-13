package com.me.spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;



import com.me.spring.dao.UserDAO;
import com.me.spring.exception.AdException;
import com.me.spring.pojo.User;

public class RegistrationValidator  implements Validator{

	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(User.class);
	}

	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "error-empty-account", "Account Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error-empty-password",  "Password Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "validatepassword", "error-empty-validatepassword",  "validatepassword Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "error-empty-account", "Account Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "msn", "error-empty-password",  "Password Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error-empty-validatepassword",  "validatepassword Cannot Be Empty");
		
		if(errors.hasErrors())
			return;
		User user = (User)command;	
		String account = user.getAccount();
	UserDAO userdao = new UserDAO();
     boolean aa = false;
		try {
			aa = userdao.hasaccount(account);
		} catch (AdException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(aa == true) //no user account
		{
			errors.rejectValue("account", "This account has been registed!please choose another", "This account has been registed!please choose another");
			return;
		}
       if(!user.getPassword().equals(user.getValidatepassword())) // password is not equal with validatepassword
       { 
    	   errors.rejectValue("account", "password is not equal with validatepassword", "password is not equal with validatepassword");
  		   return;
       }
		if (user.getEmail().length() < 7)
			errors.rejectValue("email", "error-email-short", "Email Doesn't Contain Enough");
		if(errors.hasErrors())
			return;
		
		Pattern pattern = Pattern.compile(".+@.+\\.[a-zA-Z]+");	
		Matcher matcher = pattern.matcher(user.getEmail());
		
		if (!matcher.matches())
			errors.rejectValue("email", "error-email-invalid", "Email Is Invalid");
	}

}

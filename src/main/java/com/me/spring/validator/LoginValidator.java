package com.me.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;



import com.me.spring.dao.UserDAO;
import com.me.spring.exception.AdException;
import com.me.spring.pojo.User;

public class LoginValidator  implements Validator{

	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(User.class);
	}

	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "error-empty-account", "account Cannot Be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error-empty-password",  "password Cannot Be Empty");
		
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
		if(aa == false) //no user account
		{
			errors.rejectValue("account", "no this account or password wrong", "no this account or password wrong");
			return;
		}
		else
		{  
			User queryuser = null;
			try {
				queryuser = userdao.get(account);
			} catch (AdException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(queryuser.getPassword().equals(user.getPassword()))
			{
				
			}
			else //password error
			{
				errors.rejectValue("account", "no this account or password wrong", "no this account or password wrong");
				return;
			}
		}

	}

}

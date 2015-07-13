package com.me.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import com.me.spring.pojo.User;

public class SearchValidator  implements Validator{

	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(User.class);
	}

	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "error-empty-input", "Cannot Be Empty");
	
		if(errors.hasErrors())
			return;	
	}

}

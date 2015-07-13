package com.me.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;




import com.me.spring.pojo.Photo;


public class UploadfileValidator  implements Validator{

	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(Photo.class);
	}

	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
	
		if(errors.hasErrors())
			return;
		Photo bean = (Photo) command;
		MultipartFile file = bean.getFile();
		String photoaddress = bean.getPhotoaddress();
		String photodescription = bean.getPhotodescription();
        if(file == null)
        {
			errors.rejectValue("file", "You have not upload file", "You have not upload file");
			return;
        }
        if(photodescription.equals(""))
        {
    		errors.rejectValue("photodescription", "Please write the description", "Please write the description");
			return;
        }
		if(photoaddress.endsWith(".jpg")||photoaddress.endsWith("JPG")||photoaddress.endsWith("gif")||photoaddress.endsWith("bmp")||photoaddress.endsWith("BMP"))
		{
			return;
		}
		else
		{
			errors.rejectValue("file", "Should be photo format", "Should be photo format");
			return;
		}

	}

}

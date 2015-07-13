package com.me.spring.pojo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
   int id;
   String photoaddress;
   String photodescription;
   User user;
   public MultipartFile file;
   public Photo()
   {
	   
   }
   public Photo(String photoaddress,String photodescription,User user)
   {
	   this.photoaddress = photoaddress;
	   this.photodescription = photodescription;
	   this.user = user;
   }
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public void setFile(MultipartFile file) {
	this.file = file;
	String fileName = file.getOriginalFilename();
	this.photoaddress = "E:\\uploads\\"+fileName;
	if(fileName.equals("")) 
	{
		this.file = null;
	}
	else
	{
	File uploadedFile = new File("E:\\uploads\\", fileName);
	try {
		file.transferTo(uploadedFile);
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
}

public MultipartFile getFile() {
	return file;
}
public String getPhotoaddress() {
	return photoaddress;
}
public void setPhotoaddress(String photoaddress) {
	this.photoaddress = photoaddress;
}
public String getPhotodescription() {
	return photodescription;
}
public void setPhotodescription(String photodescription) {
	this.photodescription = photodescription;
}

public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
}

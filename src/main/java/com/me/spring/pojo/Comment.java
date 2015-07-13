package com.me.spring.pojo;

public class Comment {
   int id;
   String content;
   Photo photo;
   User user;
   public Comment()
   {
	   
   }
   public Comment(String content,Photo photo,User user)
   {
	   this.content = content;
	   this.photo = photo;
	   this.user = user;
   }
public Photo getPhoto() {
	return photo;
}
public void setPhoto(Photo photo) {
	this.photo = photo;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

//public Photo getPhoto() {
	//return photo;
//}
//public void setPhoto(Photo photo) {
	//this.photo = photo;
//}
}

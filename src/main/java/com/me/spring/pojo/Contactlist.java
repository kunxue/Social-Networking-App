package com.me.spring.pojo;

public class Contactlist {

	 String user;
     String contact;
     int id;
     public Contactlist()
     {
    	 
     }
     public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Contactlist(String user,String contact)
     {
    	 this.user = user;
    	 this.contact = contact;
     }
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}

}

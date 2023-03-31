package com.itwillbs.javabean;

public class javaBean2 {
	private String id;
	private String pw;
	private String email;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	// alt shift s + s
	@Override
	public String toString() {
		return "javaBean2 [id=" + id + ", pw=" + pw + ", email=" + email + "]";
	}
	
	
}

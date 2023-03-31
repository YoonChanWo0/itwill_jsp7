package com.itwillbs.javabean;

public class JavaBean1 {
	
	/**
	 * javadoc 주석(설명)
	 * 
	 * id정보를 저장하는 객체
	 * id정보는 직접접근 불가능
	 * 사용하려면 get/set 메서드 사용
	 * 
	 */
	
	// id 정보를 저장하기 위해서 생성한 객체(자바빈)
	
	private String id;
	
	//public JavaBean() {} 생략되어 있음

	// alt shift s + r
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	// alt shift s + s
	@Override
	public String toString() { // toString 이라는 매서드를 만듦 
		return "JavaBean1 [id=" + id + "]";
	}
	
	
	
}

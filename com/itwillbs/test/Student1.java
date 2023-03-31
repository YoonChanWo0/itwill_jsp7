package com.itwillbs.test;

public class Student1 {
	// 이름,국,영,수 정보를 한번에 저장
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	// public Student(){ }
	// 오버로딩된 생성자가 없는 경우 컴파일러가 자동으로 기본생성자를 생성한다.
	
	// alt shift s + r
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	
	
	
}

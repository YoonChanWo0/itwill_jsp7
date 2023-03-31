package com.itwillbs.test;

public class Calculator {
	
	// 계산기 - 총합/평균
	public void sum(int k,int e, int m) {
		System.out.println("총점 :"+(k+e+m)+"점");
	}
	
	public void sum(Student1 s) {
		System.out.println("총점 :"+(s.getKor()+s.getEng()+s.getMath())+"점");
	}
	
	public double avg(int k,int e, int m) {
		return (k+e+m)/3.0;
	}
	
	
	
	
	
}

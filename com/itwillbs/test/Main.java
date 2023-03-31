package com.itwillbs.test;

public class Main {
	
	// 총합(sum) - 인스턴스 메서드 / 3개의 전달인자 받아서 해당정보를 출력
	public void sum(int k,int e, int m) {
		System.out.println("총점 :"+(k+e+m)+"점");
		System.out.println();
	}
	
	// (오버로딩) * 메서드를 구분하는 요소 -1)이름2)전달인자 타입 3)전달인자 개수 //(시그니처)
	public void sum(Student1 s) {
//		System.out.println("총점 :"+(s0..getKor()+s.getEng()+s.getMath())+"점");
	}
	
	
	public double avg(int k,int e, int m) {
		return (k+e+m)/3.0;
	}

	public static void main(String[] args) {
		
		// 학생의 이름, 국영수 점수 => 총점, 평균 출력
		
		String name = "윤씨";
		int kor = 100;
		int eng = 89;
		int math = 88;
		
		
		System.out.println("총점 :"+(kor+eng+math)+"점");
		System.out.println("평균 :"+(kor+eng+math)/3.0+"점");
		
		System.out.println("----------------");
		Main m = new Main();
		m.sum(kor, eng, math);
		
		System.out.println("평균 = "+m.avg(kor, eng, math));
		
		// 계산하는 기능만 따로 분리 사용하기(총합,평균)
		
		
		
		// 평균(avg) - 인스턴스 메서드 / 3개의 전달인자 받아서 정보 리턴

		
		
		
		
		// 92.3[3]3333333333333
		//       L> 반올림
		double tmp = (kor+eng+math)/3.0;
		
		System.out.println((int)((tmp * 10)+0.5)/10.0);
		
		System.out.println("평균(반올림) :"+(kor+eng+math)/3.0+"점");
		
		System.out.println("----------------------------------");
		
		// 학생 정보 객체저장
		Student1 s = new Student1();
		
		// s.name = "홍길동";
		s.setName("홍길동");
		s.setKor(99);
		s.setEng(77);
		s.setMath(80);
		
		// 학생의 총점
		
		m.sum(s.getKor(), s.getEng(), s.getMath());
		
		m.sum(s);
		
		///////////////////////////////////////////////////////
		
		// 계산기를 사용해서 
		Calculator cal = new Calculator(); 
		// 아이티윌 학생 총합(변수)
		cal.sum(kor, eng, math);
		// 홍길동 학생 총합(객체)
		cal.sum(s);
	}
	
}
	

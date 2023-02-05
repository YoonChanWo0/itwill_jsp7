
public class Ex5 {

	public static void main(String[] args) {
		/*
		 * 화면에 데이터를 출력하는 print(), printf(), println() 메서드
		 * -System.out.xxxx() 메서드 형태로 사용
		 * 
		 * 1.println()메서드
		 * -소괄호()내부에 출력할 데이터를 전달하면 화면에 출력
		 * - 화면에 데이터를 출력한 뒤 줄바꿈을 수행
		 * => 출력 후 엔터키 입력한 것과 동일한 결과
		 * -아무런 데이터도 전달하지 않을 경우 단순 줄바꿈 기능 수행
		 * 
		 * 2.print()메서드
		 * -소괄호() 내부에 출력할 데이터를 전달하면 화면에 출력
		 * -화면에 데이터를 출력한 뒤 줄바꿈 수행하지 않음
		 * - 아무런 데이터도 전달하지 않을 경우 오류 발생!
		 * 
		 * 3.printf() 메서드
		 * -출력할 데잍터가 변수 및 여러 가지 타입이 복합적으로 사용될 경우
		 * 출력할 데이터의 모양을 유지하기 위한 용도로 사용
		 * -소괄호() 내부에 출력할 데이터를 전달하면 화면에 출력
		 * -화면에 데이터를 출력한 뒤 줄바꿈 수행하지 않음
		 * -아무런 데이터도 전달하지 않을 경우 오류 발생
		 * 
		 */
		
		System.out.println("Hello,World"); // "Hello, World"출력 후 줄바꿈
		System.out.println("윤찬우"); // "윤찬우" 출력 후 줄바꿈
		
		int age = 20;
		System.out.println("나이는 age세 입니다."); // age가 문자열로 취급됨
		//만약 age 라는 변수를 사용하여 데이터를 활용해야되는 경우
		//문자열 바깥에 + 기호를 사용하여 변수를 문자열에 연결해야 함
		System.out.println("나이는" + age + "세 입니다.");
		
		System.out.println("-----------------"); // "--------" 출력 후 줄바꿈
		
		System.out.print("Hello,World!");
		System.out.print("윤찬우");
		System.out.println(); // 줄바꿈 수행(엔터키 역할)
		System.out.println("Hello, World!");
		System.out.println("윤찬우");
		System.out.println(1);
		System.out.println(); // 줄바꿈 수행(엔터키 역할)
		System.out.println("-----------------"); // "--------" 출력 후 줄바꿈
		
		String name = "윤찬우";
		
		System.out.println("나이는" + age +"세 입니다." + "이름은" + name + "입니다.");
//		System.out.println("나이는 %d세 입니다. 이름은 %s 입니다.", age, name);

	}

}

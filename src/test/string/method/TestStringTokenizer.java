package test.string.method;

import java.util.StringTokenizer;

public class TestStringTokenizer {

	public static void main(String[] args) {
		// java.util.StringTokenizer Test
		StringTokenizer st = new StringTokenizer("servlet jsp mybatis spring");
		System.out.println("분리된 토큰 수 : " + st.countTokens());
		
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
		System.out.println("-----------------------------------");
		StringTokenizer st2 = new StringTokenizer("eclipse,editplus staruml&exerd", ", &");
		System.out.println("토큰 수 : " + st2.countTokens());
		
		while(st2.hasMoreTokens()) {
			System.out.println(st2.nextToken());
		}

	}

}

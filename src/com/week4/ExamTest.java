package com.week4;

import java.util.Scanner;

public class ExamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		ExamString es = new ExamString();
		
		System.out.print("���ڿ� �Է� : ");
		String str = sc.next();
		
		System.out.print("���� �Է� : ");
		char ch = sc.next().charAt(0);
		
		System.out.println(es.preChar(str));
		System.out.println("���� : " + es.charSu(str, ch));
		

	}

}

package com.week4;

import java.util.StringTokenizer;

public class TestWork2 {
	public void token() {
	String s = "J a v a  P r o g r a m";
	System.out.println("��ū ó���� ��� : " + s);
	System.out.println("��ū ó�� �� ���� ���� : " + s.length() + "��");
	
	String []sar = s.split(" ");
	System.out.println("��ū ó�� �� ���� ���� : " + sar.length + "��");	
	
	System.out.print("car ��� : ");
	char[] car = s.toCharArray();
	for(int x = 0; x < car.length; x ++) {
		System.out.print(car[x]);
	}
	
	//Tokenizer �Ἥ�� �غ���
	
	String ss2 = new String(car);
	
	
	System.out.println("\nchar to String : " + ss2);
	System.out.println("����� ��ȯ : " + ss2.toUpperCase());
	
	
	
	
	
	
	
	}
	
	public static void main(String []args) {
		TestWork2 e = new TestWork2();
		e.token();
	}
	
	

}

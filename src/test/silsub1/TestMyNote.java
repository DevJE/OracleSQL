package test.silsub1;

import java.util.Scanner;

import silsub1.MyNote;

public class TestMyNote {
	private static Scanner sc = new Scanner(System.in);
	
	public TestMyNote() {}
	
	public static void menu() {
		MyNote m = new MyNote();
		int number = 0;
		
		do {
			System.out.println("******  MyNote  ******");
			System.out.println("1. ��Ʈ ���� �����"
								+ "\n2. ��Ʈ ����"
								+ "\n3. ��Ʈ ��� �����ϱ�"
								+ "\n4. ������");
			System.out.print("�޴� ��ȣ ���� : ");
			number = sc.nextInt();
			
			switch(number) {
			case 1 : m.fileSave(); break;
			case 2 : m.fileOpen(); break;
			case 3 : m.fileEdit(); break;
			case 4 : System.out.println("���α׷��� �����մϴ�.");
					return;
				default : System.out.println("��ȣ�� �ٽ� �Է��ϼ���.");
			}
			
			
		} while(true);
	}

	public static void main(String[] args) {
		// MyNote Test
		menu();

	}

}

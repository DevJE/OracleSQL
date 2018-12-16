package silsub1;

import java.util.*;
import java.io.*;

public class MyNote {
	private Scanner sc = new Scanner(System.in);
	
	public MyNote() {}
	
	public void fileSave() {
		
		/*BufferedWriter br = new BufferedWriter(fw);
		FileWriter fw = new FileWriter();*/
		String fn = null;
		
		StringBuilder sb = new StringBuilder();
		System.out.println("���Ͽ� ������ ������ �Է��Ͻÿ�.");
		String typing = null;
	
			while(!(typing = sc.nextLine()).equals("exit")) {
				sb.append(typing + "\n");
				}
		
		System.out.print("�����Ͻðڽ��ϱ�? (y/n) : ");
		/*char ch = sc.next().toUpperCase().charAt(0);*/
		if(sc.next().toUpperCase().charAt(0) == 'Y') {
			System.out.print("������ ���ϸ�(txt) : ");
			fn = sc.next();
		}
		
		try(BufferedWriter bw = new BufferedWriter(new FileWriter(fn))) {
		
		System.out.println(fn + "���Ͽ� ���������� �����Ͽ����ϴ�.");
		bw.write(sb.toString());
		bw.flush();
		
		} catch(IOException e) {
			e.printStackTrace();
		}
				
	}
	
	public void fileOpen() {
		System.out.print("������ ���ϸ� : ");
		String fn = sc.next();
		
		try(BufferedReader brr = new BufferedReader(new FileReader(fn))) {
			
			StringBuilder sb = new StringBuilder();
			String str = null;
			
			while((str = brr.readLine()) != null) {
			sb.append(str + "\n");
			}
			System.out.println("==== ���� ====");
			System.out.println(sb.toString());
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public void fileEdit() {
		System.out.print("������ ���ϸ� : ");
		String fn = sc.next();
		
		try(BufferedWriter bw = new BufferedWriter(new FileWriter(fn, true));) {
			
			StringBuilder sb = new StringBuilder();
			System.out.println("���Ͽ� �߰��� ������ �Է��ϼ���.");
			String typing = null;
			
			while(!(typing = sc.nextLine()).equals("exit")) {
				sb.append(typing + "\n");
			}
			
			System.out.print("����� ������ ���Ͽ� �߰��Ͻðڽ��ϱ�? (y/n) : ");
			if(sc.next().toUpperCase().charAt(0) == 'Y') {
				bw.write(sb.toString());
				System.out.println(fn + " ������ ������ ����Ǿ����ϴ�.");
			}
			
			System.out.println();
			bw.flush();
			
			
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
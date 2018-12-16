package test.string.method;

public class TestStringBuilder {

	public static void main(String[] args) {
		// StingBuilder Test
		// Mutable : ��ϵ� ���ڿ��� ���氡�� eg. StringBuffer, StringBuilder
		// StringBuffer : Thread safe o
		// StringBuilder : Thread safe x
		StringBuilder sb = new StringBuilder();
		System.out.println("�⺻����뷮 : " + sb.capacity() + "����");
		System.out.println("�ּ� : " + sb.hashCode());
		
		StringBuilder sb2 = sb.append("java");
		sb.append(20);
		sb.append(31.2);
		sb.append(' ');
		sb.append(true);
		
		System.out.println("sb2 �ּ� : " + sb2.hashCode());
		
		System.out.println("���ڰ��� : " + sb.length());
		System.out.println("sb : " + sb);
		sb.delete(2, 6);
		System.out.println("sb : " + sb);
		
		char []dst = new char[5];
		sb.getChars(0, 5, dst, 0);
		for(int x = 0; x < dst.length; x ++) {
			System.out.print(dst[x] + "^");
		}
		System.out.println();
		
		sb.insert(3, "POP��*");
		System.out.println("sb : " + sb);
		
		sb.reverse();
		System.out.println("rev.sb : " + sb);
		
		sb.setCharAt(7, '��');
		System.out.println();
		System.out.println("setchar sb : " + sb);
		
		//sb --> String
		// toString() �޼ҵ� ���
		String ss = sb.toString();
		// ������ ���
		String ss2 = new String(sb);
		System.out.println("ss : " + ss.toUpperCase());
		//toUpperCase, toLowerCase ����Ϸ��� String���� �������־���Ѵ�.

	}

}

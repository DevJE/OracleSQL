package test.object.method;

public class TestObjectMethod {

	public static void main(String[] args) {
		// java.lang.ObjectŬ������ ��� �ڹ��� �����̴�.
		// Object Ŭ������ ��� �޼ҵ�� �ڹٷ� ���� Ŭ�������� �ڽ��� �޼ҵ�ó�� ����� �� �ִ�.
		
		Member mm = new Member();
		
		System.out.println("mm hashCode �� " + mm.hashCode());
		System.out.println("mm toString �� " + mm.toString());
		
		Member mm2 = mm; //�ּҺ���
		System.out.println();
		
		System.out.println("�ּҰ� ������? " + mm.equals(mm2));
		System.out.println(mm == mm2); // �� ���� �ּҹ���� ��
		

	}

}

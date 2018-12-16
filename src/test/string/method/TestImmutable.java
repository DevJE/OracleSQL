package test.string.method;

public class TestImmutable {

	public static void main(String[] args) {
		// String is Immutable "
		// String. ���ڿ� ����ҿ� ��ϵ� ���ڿ� ���� ����� ������ �� ����.
		
		String s = "java";
		String s2 = new String("java");
		
		System.out.println("s == s2 �ּ� : " + (s == s2));
		System.out.println("hashCode �� : " + (s.hashCode() == s2.hashCode()));
		//�����ϰ� �ִ� ���ڿ��� ��ϵ� ��ġ������ Return�ްԲ� Override�Ǿ�����.
		//���ڿ�����Ҵ� �� �� ��ϵ� ���ڿ��� �� �� ������� �ʴ´�.
		//�̹� ��ϵ� ���ڿ��� ��ġ�� return
		System.out.println(s.hashCode());
		System.out.println(s2.hashCode());
		System.out.println();
		
		//Immutable : ����Ұ�
		String s3 = s.toUpperCase();
		System.out.println("s : " + s);
		System.out.println("s3 : " + s3);
		System.out.println();
		
		System.out.println("s : " + s.hashCode());
		System.out.println("s3 : " + s3.hashCode());
		//���� �������۽� ��~�� �޸��������� �ö󰣴�. ����Ұ����̶� ��� �߰��ϴ� ������
		//����� �� �ۿ� ���� ����.

	}

}

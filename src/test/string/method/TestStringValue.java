package test.string.method;

public class TestStringValue {
	
	public static void stringToData() {
		//���ڿ��� => �⺻�ڷ��������� ���� : parsing(�Ľ�)
		//Wrapper(����) Ŭ�������� �޼ҵ�� ����
		//�⺻�ڷ����� ���� Ŭ���� = ����Ŭ����
		//String value = "apple"; -> ���������� �ƴϱ� ������ ERROR
		String value = "12345";
		int num = Integer.parseInt(value);
		System.out.println(num);
		
		int num2 = Integer.valueOf(value);
		//Ǯ� ���� �Ʒ��� ����. ���� ���� ��츦 Auto UnBoxing ó���� �Ǿ��ٰ� �Ѵ�.
		//��ü�� ������. ��ü -> ��
		//Integer ref = Integer.valueOf(value); //IntegerŬ���� ����߱� ������ ĸ��ȭ�� �Ǿ��ִ� ����
		//int num2 = ref.intValue();
		
	}

	public static void main(String[] args) {
		//���ڿ��� <=> �⺻�ڷ����� ��ȯó���ϴ� ���
		stringToData();
	}

}

package test.string.method;

public class TestSplit {

	public static void main(String[] args) {
		// �ϳ��� ���ڿ��� ��ū���ڱ������� ���� ���� ���ڿ��� �и��ϴ� ��
		String s = "red yellow green blue purple";
		String []sar = s.split(" ");
		System.out.println(sar.length + "��");
		
		//��ü�迭�� �÷����� for each�� ���
		for(String temp : sar) {
			System.out.print(temp + " ");
		}
		System.out.println("\n������������������������������");
		
		
		String s2 = "java,oracle,jdbc";
		String []sar2 = s2.split(",");
		
		for(String temp : sar2) {
			System.out.print(temp + " ");
		}
		System.out.println("\n������������������������������");
		
		String s3 = "html5 css3,javaScript&Query��webapi";
		String []sar3 = s3.split(" |,|&|��");
		
		for(String temp : sar3) {
			System.out.print(temp + " ");
		}

	}

}

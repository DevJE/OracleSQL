package test.api;

public class TestMath {

	public static void main(String[] args) {
		// Math Class Test
		
		//���밪 ��ȯ
		/*int i = Math.abs(-10);
		double d = Math.abs(-10.0);
		System.out.println(i + ", " + d);*/
		
		
		//�� �ø�
		/*double d = Math.ceil(10.1);
		double d2 = Math.ceil(-10.1);
		double d3 = Math.ceil(10.0000015);
		System.out.println(d + ", " + d2 + ", " + d3);*/
		
		//�� ���� ��ȯ
		/*double d = Math.floor(10.0);
		double d2 = Math.floor(-10.8);
		System.out.println(d + ", " + d2);*/
		
		//�� �� �� ū �� ��ȯ
		/*double d = Math.max(9.5, 9.5000001);
		int i = Math.max(0, -1);
		System.out.println(d + ", " + i);*/
		
		//�� �� �� ���� �� ��ȯ
		/*double d = Math.min(9.5, 9.5000001);
		int i = Math.min(0, -1);
		System.out.println(d + " , " + i);*/
		
		//0.0~1.0 ���� ������ ���� double�� ��ȯ. 0.0 ����, 1.0 ������
		/*double d = Math.random();
		int i = (int)(Math.random() * 10) + 1;
		System.out.println(d + ", " + i);*/
		
		//double���� ���� ����� ������ ��ȯ
		/*double d = Math.rint(5.55);
		double d2 = Math.rint(5.11);
		double d3 = Math.rint(-5.55);
		System.out.println(d + ", " + d2 + ", " + d3);*/
		
		//�Ҽ��� ù°�ڸ����� �ݿø��� long�� ��ȯ
		/*long l = Math.round(5.55);
		long l2 = Math.round(5.11);
		long l3 = Math.round(-5.55);
		double d = 90.7552;
		double d2 = Math.round(d * 100) / 100.0;
		System.out.println(l + ", " + l2);
		System.out.println(l3);
		System.out.println(d + ", " + d2);*/

	}

}

package test.calendar;

public class ShowDate {

	public static void main(String[] args) {
		// DateCalculator �����
		DateCalculator totalDay = new DateCalculator();
		
		System.out.println(totalDay.isLeapYear(2018) == true ? "����" : "���");
		
		long total = totalDay.getDays();
		System.out.println("�� ��¥ �� : " + total);

	}

}

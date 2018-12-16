package test.object.method;

public class Member {
	//Field
	private String name;
	private int age;
	private double point;
	
	//Constructor
	public Member() {
		super(); //Object�� �⺻ �����ڸ� ����. �ƹ��͵� ��ӹ��� �ʾұ� ����.
	}

	public Member(String name, int age, double point) {
		super(); //�⺻�����ڿ� ���� ������ Object() call.
		this.name = name;
		this.age = age;
		this.point = point;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getPoint() {
		return point;
	}

	public void setPoint(double point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		//return "Ŭ������@16�����ڵ带 ���ڿ���" 
		return this.name + ", " + this.age + "��, " + this.point + "��";
	}
	
	@Override
	public boolean equals(Object obj) {
		//return this == (Member)ojb; �ּҰ� ������ �� 
		Member other = (Member)obj; //DownCasting �ʿ�
		
		return (this.name.equals(other.name) && this.age == other.age
				&& this.point == other.point);
		//this�� �����ϴ� ��ü�� other�� �����ϴ� ��ü�� ������ boolean �Ǵ�
	}
	
	@Override
	/*protected*/ public Object clone() /*throws CloneNotSupportedException*/ {
		//return this; ���� this(�ּ�)������. �ּҰ� ����ǰ� �ϴ� �޼ҵ�
							//--> �ּҸ� ���� : ���� ����(shallow copy)
		//Deep Copy : ���� ���� -> �̰ŷ� Overriding�� �� ����.
		return new Member(this.name, this.age, this.point); //Deep Copy
		//return this;
		
	}
	

}

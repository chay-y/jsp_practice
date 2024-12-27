package common; //기본 패키지 이외의 패키지(규칙1)

public class Person {
	private String name; //private 멤버 선언(규칙3)
	private int age; // ``(규칙3)
	
	public Person() {} //기본 생성자(규칙2)
	
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	//getter,setter 추가 (규칙4)
	//접근 제어자는 public 으로 설정(규칙5)
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
	
}

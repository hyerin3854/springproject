package com.oracle.aop3;

public class Student {
		private String name;
		private int age;
		private int gradeNum;
		private int classNum;
		
		Student() {
			System.out.println("Student 생성자");
		}
		public void getStudentInfo() {
			
			System.out.println("이름:" +getName());
			System.out.println("나이:" +getAge());
			System.out.println("학년:" +getGradeNum());
			System.out.println("반:" +getClassNum());
		
	//System.out.println(10/0)
		try {
			System.out.println(10/0);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
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
		public int getGradeNum() {
			return gradeNum;
		}
		public void setGradeNum(int gradeNum) {
			this.gradeNum = gradeNum;
		}
		public int getClassNum() {
			return classNum;
		}
		public void setClassNum(int classNum) {
			this.classNum = classNum;
		}
}

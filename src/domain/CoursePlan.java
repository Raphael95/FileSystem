package domain;

import java.util.Date;

public class CoursePlan {
	String cpId;
	String year;
	String semester;
	String proId;
	String courseId;
	public CoursePlan()
	{
		
	}
	public CoursePlan(String year,String semester,String proId,String courseId)
	{
		this.year=year;
		this.semester=semester;
		this.proId=proId;
		this.courseId=courseId;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	

}

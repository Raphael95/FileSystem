package domain;

public class Course {
	String courseId;
	String courseName;
	String credit;
	String content;
	String period;
	String theoryPeriod;
	String testPeriod;
	String checkWay;
	public Course()
	{
		
	}
	public Course(String courseName, String credit, String content, String period, String theoryPeriod,
			String testPeriod, String checkWay) {
		super();
		this.courseName = courseName;
		this.credit = credit;
		this.content = content;
		this.period = period;
		this.theoryPeriod = theoryPeriod;
		this.testPeriod = testPeriod;
		this.checkWay = checkWay;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTheoryPeriod() {
		return theoryPeriod;
	}
	public void setTheoryPeriod(String theoryPeriod) {
		this.theoryPeriod = theoryPeriod;
	}
	public String getTestPeriod() {
		return testPeriod;
	}
	public void setTestPeriod(String testPeriod) {
		this.testPeriod = testPeriod;
	}
	public String getCheckWay() {
		return checkWay;
	}
	public void setCheckWay(String checkWay) {
		this.checkWay = checkWay;
	}
	

}

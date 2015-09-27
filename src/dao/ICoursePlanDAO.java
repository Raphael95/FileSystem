package dao;

import java.util.List;

import domain.CoursePlan;

public interface ICoursePlanDAO {
	public List<CoursePlan> getCoursePlanByProId(String proId);
	public List<CoursePlan> getCoursePlanByCourseId(String courseId);
	public CoursePlan getCoursePlanByProYear(String proId,String year);
	public List<CoursePlan> getCoursePlanByOrder(int page,int pagesize,String proId,String year);
	public int allPage(int row,String proId,String year);
	public void addCoursePlan(String year,String proId);
	public void addCoursePlan1(String year,String semester,String proId,String courseId);
	public CoursePlan getCourseByCoYear(String courseId,String year);
}

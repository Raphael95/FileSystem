package service;

import java.util.List;

import domain.CoursePlan;

public interface ICoursePlanService {
	public List<CoursePlan> getCoursePlanByProId(String proId);
	public List<CoursePlan> getCoursePlanByCourseId(String courseId);
	public CoursePlan getCoursePlanByProYear(String proId,String year);
	public List<CoursePlan> getCoursePlanByOrder(int page,int pagesize,String proId,String year);
	public int allPage(int row,String proId,String year);
}

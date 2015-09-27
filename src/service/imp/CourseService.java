package service.imp;

import dao.ICourseDAO;
import dao.imp.CourseDAO;
import domain.Course;
import service.ICourseService;

public class CourseService implements ICourseService{
	ICourseDAO courseDAO=new CourseDAO();
	public CourseService()
	{
		
	}
	
	public Course getCourseBycId(String cId)
	{
		return courseDAO.getCourseBycId(cId);
	}
	
	public static void main(String[] args)
	{
		CourseService cs=new CourseService();
		Course c=cs.getCourseBycId("1315290");
		System.out.println(c.getCourseName());
	}

}

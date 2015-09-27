package service.imp;

import java.util.List;

import service.ICoursePlanService;
import domain.CoursePlan;
import dao.ICoursePlanDAO;
import dao.imp.CoursePlanDAO;

public class CoursePlanService implements ICoursePlanService{
	public ICoursePlanDAO coursePlanDAO=new CoursePlanDAO();
	public CoursePlanService()
	{
		
	}
	
	public List<CoursePlan> getCoursePlanByProId(String proId)
	{
		if(proId!=null)
		{
			return coursePlanDAO.getCoursePlanByProId(proId);
		}
		else
			return null;
	}
	
	public List<CoursePlan> getCoursePlanByCourseId(String courseId)
	{
			
		if(courseId!=null)
		{
			return coursePlanDAO.getCoursePlanByCourseId(courseId);
		}
		else
			return null;
	}
	
	public CoursePlan getCoursePlanByProYear(String proId,String year)
	{
		return coursePlanDAO.getCoursePlanByProYear(proId, year);
	}
	
	public List<CoursePlan> getCoursePlanByOrder(int page,int pagesize,String proId,String year)
	{
		return coursePlanDAO.getCoursePlanByOrder(page,pagesize,proId,year);
	}
	
	public int allPage(int row,String proId,String year)
	{
		return coursePlanDAO.allPage(row, proId, year);
	}
	
	public static void main(String[] args)
	{
		CoursePlanService cps=new CoursePlanService();
		//CoursePlan cp=cps.getCoursePlanByProYear("1", "2013");
		List<CoursePlan> list=cps.getCoursePlanByOrder(1,4,"1", "2013");
		//System.out.println(cp.getCpId());
		for(CoursePlan cp:list)
		{
			System.out.println(cp.getCpId());
		}
		System.out.println(cps.allPage(5, "1", "2013"));
	}


}

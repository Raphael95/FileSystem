package dao.imp;

import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ICoursePlanDAO;
import domain.CoursePlan;
import dao.imp.DataBaseDAO;
public class CoursePlanDAO implements ICoursePlanDAO{
	public CoursePlanDAO()
	{
		
	}
	public List<CoursePlan>getCoursePlanByProId(String proId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from CoursePlan where proId='"+proId+"'";
		List<CoursePlan> list=new ArrayList<CoursePlan>();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				CoursePlan cp=new CoursePlan();
				cp.setCpId(mySet.getString("cpId"));
				cp.setYear(mySet.getString("year"));
				cp.setSemester(mySet.getString("semester"));
				cp.setProId(mySet.getString("proId"));
				cp.setCourseId(mySet.getString("courseId"));
				list.add(cp);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<CoursePlan> getCoursePlanByCourseId(String courseId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from CoursePlan where courseId='"+courseId+"'";
		List<CoursePlan> list=new ArrayList<CoursePlan>();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				CoursePlan cp=new CoursePlan();
				cp.setCpId(mySet.getString("cpId"));
				cp.setYear(mySet.getString("year"));
				cp.setSemester(mySet.getString("semester"));
				cp.setProId(mySet.getString("proId"));
				cp.setCourseId(mySet.getString("courseId"));
				list.add(cp);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return list;
 	}
	
	public CoursePlan getCoursePlanByProYear(String proId,String year)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String courseId="0";
		String sql="select * from CoursePlan where proId='"+proId+"' and year='"+year+"' and courseId='"+courseId+"'";
		CoursePlan cp=new CoursePlan();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				cp.setCpId(mySet.getString("cpId"));
				cp.setYear(mySet.getString("year"));
				cp.setSemester(mySet.getString("semester"));
				cp.setProId(mySet.getString("proId"));
				cp.setCourseId(mySet.getString("courseId"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return cp;
	}
	
	public List<CoursePlan> getCoursePlanByOrder(int page,int pagesize,String proId,String year)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String courseId="0";
		String sql="select top "+pagesize+" * from CoursePlan where cpId not in(select top "+(page-1)*pagesize+" cpId from CoursePlan where proId='"+proId+"' and year='"+year+"' and courseId<>'"+courseId+"' order by cpId ASC) and proId='"+proId+"' and year='"+year+"' and courseId<>'"+courseId+"' order by cpId ASC";
		List<CoursePlan> list=new ArrayList<CoursePlan>();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				CoursePlan cp=new CoursePlan();
				cp.setCpId(mySet.getString("cpId"));
				cp.setYear(mySet.getString("year"));
				cp.setSemester(mySet.getString("semester"));
				cp.setProId(mySet.getString("proId"));
				cp.setCourseId(mySet.getString("courseId"));
				list.add(cp);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public int allPage(int row,String proId,String year)
	{
		int allpage=0;
		DataBaseDAO myDB=new DataBaseDAO();
		String courseId="0";
		String sql="select count(*) from CoursePlan where proId='"+proId+"' and year='"+year+"' and courseId<>'"+courseId+"'";
		try {
			ResultSet mySet=myDB.getResultSet(sql);
			mySet.next();
			int all=mySet.getInt(1);
			allpage=(all-1)/row+1;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			try
			{
				myDB.releaseConnection();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return allpage;
	}
	
	public void addCoursePlan(String year,String proId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="insert into UpFile(year,proId) values('"+year+"','"+proId+"')";
		try
		{
			myDB.executeSQL(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	public void addCoursePlan1(String year,String semester,String proId,String courseId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="insert into UpFile(year,semester,proId,courseId) values('"+year+"','"+semester+"','"+proId+"','"+courseId+"')";
		try
		{
			myDB.executeSQL(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	public CoursePlan getCourseByCoYear(String courseId,String year)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from CoursePlan where courseId='"+courseId+"' and year='"+year+"'";
		CoursePlan cp=new CoursePlan();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				cp.setCpId(mySet.getString("cpId"));
				cp.setYear(mySet.getString("year"));
				cp.setSemester(mySet.getString("semester"));
				cp.setProId(mySet.getString("proId"));
				cp.setCourseId(mySet.getString("courseId"));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return cp;
	}
	
	public static void main(String[] args)
	{
		CoursePlanDAO course=new CoursePlanDAO();
		List<CoursePlan> list=course.getCoursePlanByOrder(1,4,"1", "2013");
		for(CoursePlan cp:list)
		{
			System.out.println(cp.getCpId());
		}
		System.out.println(course.allPage(4, "1", "2013"));
	}
	
}

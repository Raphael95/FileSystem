package dao.imp;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.ICourseDAO;
import dao.imp.DataBaseDAO;
import domain.Course;

public class CourseDAO implements ICourseDAO{
	public CourseDAO()
	{
		
	}
	
	public Course getCourseBycId(String cId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from Course where courseId='"+cId+"'";
		Course c=new Course();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				c.setCourseId(mySet.getString("courseId"));
				c.setCourseName(mySet.getString("courseName"));
				c.setCredit(mySet.getString("credit"));
				c.setContent(mySet.getString("content"));
				c.setPeriod(mySet.getString("period"));
				c.setTheoryPeriod(mySet.getString("theoryPeriod"));
				c.setTestPeriod(mySet.getString("testPeriod"));
				c.setCheckWay(mySet.getString("checkWay"));
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
		return c;
	}
	
	

}

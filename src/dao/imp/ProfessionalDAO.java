package dao.imp;

import dao.IProfessionalDAO;
import domain.Professional;
import dao.imp.DataBaseDAO;

import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfessionalDAO implements IProfessionalDAO{
	public ProfessionalDAO()
	{
		
	}
	
	public List<Professional> getProByInstId(String instId)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from Professional where instId='"+instId+"'";
		List<Professional> list=new ArrayList<Professional>();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				Professional pro=new Professional();
				pro.setProId(mySet.getString("proId"));
				pro.setProName(mySet.getString("proName"));
				pro.setInstId(mySet.getString("instId"));
				list.add(pro);
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
		return list;
	}
	
	public Professional getProByProName(String proName)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from Professional where proName='"+proName+"'";
		Professional pro=new Professional();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				pro.setProId(mySet.getString("proId"));
				pro.setProName(mySet.getString("proName"));
				pro.setInstId(mySet.getString("instId"));
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
		return pro;
	}
	
	public static void main(String[] args)
	{
		ProfessionalDAO pro=new ProfessionalDAO();
		Professional p=pro.getProByProName("Èí¼þ¹¤³Ì");
			System.out.println(p.getProId());
	}
			
}

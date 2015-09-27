package dao.imp;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.IInstitudeDAO;
import dao.imp.DataBaseDAO;
import domain.Institude;

public class InstitudeDAO implements IInstitudeDAO{
	public InstitudeDAO()
	{
		
	}
	
	public Institude getInstByInstName(String instName)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from Institude where instName='"+instName+"'";
		Institude inst=new Institude();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				inst.setInstId(mySet.getString("instId"));
				inst.setInstName(mySet.getString("instName"));
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
		return inst;
	}
	
	public static void main(String[] args)
	{
		InstitudeDAO inst=new InstitudeDAO();
		System.out.println(inst.getInstByInstName("…Ã—ß‘∫").getInstId());
		
	}

}

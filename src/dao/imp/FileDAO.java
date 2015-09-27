package dao.imp;

import domain.FileUp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;

import dao.IFileDAO;
import dao.imp.DataBaseDAO;

public class FileDAO implements IFileDAO{
	public FileDAO()
	{
		
	}
	
	
	public FileUp getFileById(String id)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		String sql="select * from UpFile where cpId='"+id+"'";
		FileUp f=new FileUp();
		try
		{
			ResultSet mySet=myDB.getResultSet(sql);
			while(mySet.next())
			{
				f.setFileId(mySet.getString("fileId"));
				f.setFileName(mySet.getString("fileName"));
				f.setType(mySet.getString("type"));
				f.setPath(mySet.getString("path"));
				f.setDate(mySet.getString("date"));
				f.setCpId(mySet.getString("cpId"));
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
		return f;
	}
	
	public void addFile(FileUp file)
	{
		DataBaseDAO myDB=new DataBaseDAO();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String fileDate=sdf.format(date);
		String sql="insert into UpFile values('"+file.getFileName()+"','"+file.getType()+"','"+file.getPath()+"','"+fileDate+"','"+file.getCpId()+"')";
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
	
	public static void main(String[] args)
	{
		FileDAO fdao=new FileDAO();
		FileUp f=fdao.getFileById("1");
		System.out.println(f.getFileName());
	}
	

}

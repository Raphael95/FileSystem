package dao.imp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DataBaseDAO {
	private Connection conn=null;
	public Connection getConnection() throws ClassNotFoundException,SQLException
	{
		Connection conn=null;
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String connectionString="jdbc:sqlserver://127.0.0.1:1433;database=FileManager;user=sa;password=jianliang0729";
		Class.forName(driverName);
		conn=DriverManager.getConnection(connectionString);
		System.out.println("Connection created!");
		return conn;
	}
	
	public void releaseConnection()throws SQLException
	{
		this.conn.close();
		this.conn=null;
	}
	
	public void executeSQL(String sql)throws SQLException,ClassNotFoundException
	{
		if(this.conn==null)
		{
			this.conn=getConnection();
		}
		Statement stm=conn.createStatement();
		stm.executeUpdate(sql);
		this.conn.close();
		this.conn=null;
	}
	
	public ResultSet getResultSet(String sql) throws SQLException,ClassNotFoundException
	{
		if(this.conn==null)
		{
			this.conn=getConnection();
		}
		Statement stm=conn.createStatement();
		ResultSet thisRST=stm.executeQuery(sql);
		return thisRST;
	}
	
	public static void main(String[] args)
	{
		DataBaseDAO dao=new DataBaseDAO();
		try {
			Connection conn=dao.getConnection();
			System.out.println("HELLO SQL");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

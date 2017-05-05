package tools;

import java.sql.*;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;
public class DBUtil 
{
	public static Connection getConnection()
	{
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost/edu","root","1234");
		    System.out.println("成功加载MySQL驱动程序");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
    public static int dosql(String sql)
    {
    	 int retVal = 0;
    	 Connection conn= getConnection();
    	 Statement stmt;
    	
		try {
			stmt = conn.createStatement();
			retVal = stmt.executeUpdate(sql);
	    	 stmt.close();
	    	 conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retVal;
    }
    public static CachedRowSet getRowSet(String sql)
    {
    	CachedRowSet crs=null;
    	try
    	{
    		crs = new CachedRowSetImpl();
    		Connection conn = getConnection();
    		Statement stmt = conn.createStatement();
    		ResultSet rs=stmt.executeQuery(sql);
    		crs.populate(rs);
    		rs.close();
    		stmt.close();
    		conn.close();
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    	}
    	return crs;
    }
}

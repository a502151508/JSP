package tools;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;
import javax.websocket.Session;
public class getCourse 	
{
	public static String getCouname(int a,int b,String stunum)
	{
		
		CachedRowSet rs=tools.DBUtil.getRowSet("select*from enroll where stunum="+stunum);
		String counum="";
		String couName="";
		try 
		{
			while(rs.next())
			{
				counum=rs.getString("counum");
				CachedRowSet crs=tools.DBUtil.getRowSet("select * from course where day='"+a+"' and section='"+b+"' and counum="+counum);
			    if(crs.next())
			    {
				if(crs.getString("couname")!=null)
			    {
			    	
					couName=crs.getString("couname");	
				break;
			    }
			    }
			}      
		}	
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return couName;
	}
}

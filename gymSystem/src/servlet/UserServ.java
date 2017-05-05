package servlet;
import javax.sql.rowset.CachedRowSet;

import tools.DBUtil;
public class UserServ
{

	public boolean check_Stu(String stunum,String pwd) 
	{
		
		boolean retVal=false;
		try{
		String sql = "select * from stu_information where stunum=" + stunum;
		CachedRowSet rs=DBUtil.getRowSet(sql);
		if(rs.next())
		{
			String stuPwd = rs.getString("stupwd");
			if(stuPwd.equals(pwd))
			retVal=true;
		}
	}
		catch(Exception e){
			e.printStackTrace();
		}
	return retVal;
	}
	
}

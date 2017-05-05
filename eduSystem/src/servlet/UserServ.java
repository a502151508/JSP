package servlet;
import javax.sql.rowset.CachedRowSet;

import tools.DBUtil;
import tools.MD5;
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
	public boolean check_Adm(String admnum,String pwd) 
	{
		
		boolean retVal=false;
		try{
		String sql = "select * from adm_information where admnum=" + admnum;
		CachedRowSet rs=DBUtil.getRowSet(sql);
		if(rs.next())
		{
			String admPwd = rs.getString("admpwd");
			if(admPwd.equals(MD5.GetMD5Code(pwd)))
			retVal=true;
		}
	}
		catch(Exception e){
			e.printStackTrace();
		}
	return retVal;
	}
	public boolean check_Tea(String teanum,String pwd) 
	{
		
		boolean retVal=false;
		try{
		String sql = "select * from tea_information where teanum=" + teanum;
		CachedRowSet rs=DBUtil.getRowSet(sql);
		if(rs.next())
		{
			String teaPwd = rs.getString("teapwd");
			if(teaPwd.equals(MD5.GetMD5Code(pwd)))
			retVal=true;
		}
	}
		catch(Exception e){
			e.printStackTrace();
		}
	return retVal;
	}
}

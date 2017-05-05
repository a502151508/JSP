package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtil;
import tools.MD5;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String stuNum = request.getParameter("stunum");
		String stuName = request.getParameter("stuname");
		String stuPwd = request.getParameter("stupwd");
		String clAss = request.getParameter("class");
		String telNum=request.getParameter("telnum");
		request.getSession().setAttribute("stuName", stuName);
		if(stuPwd!=null&&stuPwd.length()>0)
		{
			stuPwd=MD5.GetMD5Code(stuPwd);
		}
		String sql = "insert into stu_information(stunum,stupwd,stuname,class,telnum) values("+stuNum+",'"+stuPwd+"','"+stuName+"','"+clAss+"','"+telNum+"')";
		System.out.println("sql:" + sql);
		
		try 
		{
			DBUtil.dosql(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("system/stu_frame.jsp");
		
	   }
}


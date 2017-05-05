package servlet;

import tools.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.MD5;

/**
 * Servlet implementation class InsertStu
 */
@WebServlet("/InsertStu")
public class InsertStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStu() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String stuNum = request.getParameter("stunum");
		String stuName = request.getParameter("stuname");
		String sEx = request.getParameter("sex");
		String stuPwd = request.getParameter("stupwd");
		String clAss = request.getParameter("class");
		String telNum = request.getParameter("telnum");
		String email = request.getParameter("email");
		if(stuPwd!=null&&stuPwd.length()>0)
		{
			stuPwd=MD5.GetMD5Code(stuPwd);
		}
		String sql = "insert into stu_information(stunum,stuname,sex,stupwd,class,telnum,email) "
				+ "values("+stuNum+",'"+stuName+"','"+sEx+"','"+stuPwd+"','"+clAss+"','"+telNum+"','"+email+"')";
		System.out.println("sql:" + sql);
		try {
			DBUtil.dosql(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("system/list_stu.jsp");
		
	}

}

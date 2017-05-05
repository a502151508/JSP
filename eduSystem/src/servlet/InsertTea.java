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
@WebServlet("/InsertTea")
public class InsertTea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTea() {
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
		String teaNum = request.getParameter("teanum");
		String teaName = request.getParameter("teaname");
		String sEx = request.getParameter("sex");
		String teaPwd = request.getParameter("teapwd");
		String couRse = request.getParameter("course");
		String teatelNum = request.getParameter("teatelnum"); String email = request.getParameter("email");
		if(teaPwd!=null&&teaPwd.length()>0)
		{
			teaPwd=MD5.GetMD5Code(teaPwd);
		}
		String sql = "insert into tea_information(teanum,teaname,sex,teapwd,course,teatelnum,email) "
				+ "values("+teaNum+",'"+teaName+"','"+sEx+"','"+teaPwd+"','"+couRse+"','"+teatelNum+"','"+email+"')";
		System.out.println("sql:" + sql);
		try {
			DBUtil.dosql(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("system/list_tea.jsp");
		
	}

}

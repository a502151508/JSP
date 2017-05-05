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
@WebServlet("/InsertCou")
public class InsertCou extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCou() {
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
		String couNum = request.getParameter("counum");
		String couName = request.getParameter("couname");
		String claRoom = request.getParameter("classroom");
		String teaName=request.getParameter("teaname");
		String dAy = request.getParameter("day");
		String secTion = request.getParameter("section");
		String sql = "insert into course (counum,couname,classroom,teaname,day,section) "
				+ "values("+couNum+",'"+couName+"','"+claRoom+"','"+teaName+"','"+dAy+"','"+secTion+"')";
		System.out.println("sql:" + sql);
		try {
			DBUtil.dosql(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("system/list_course.jsp");
		
	}

}

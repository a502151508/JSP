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
@WebServlet("/SetScore")
public class SetScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetScore() {
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
		String Score = request.getParameter("score");
		String couNum=request.getParameter("counum");
		String sql = "update enroll set score='"+Score+"' where stunum='"+stuNum+"' and counum="+couNum;
		System.out.println("sql:" + sql);
		try {
			DBUtil.dosql(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("system/list_course_stu.jsp");
		
	}

}

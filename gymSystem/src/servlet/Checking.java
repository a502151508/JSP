package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtil;

/**
 * Servlet implementation class Checking
 */
@WebServlet("/Checking")
public class Checking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checking() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String resId = request.getParameter("resId");
		String stuNum = request.getParameter("stunum");
		String isUsed=request.getParameter("isUsed");
		if(isUsed.equals("δ�볡")){
			
		String sql4check = "update booking set isUsed=0 where resId="+resId+" and stunum="+stuNum;
		System.out.println("sql1:" +  sql4check);
		try {
			DBUtil.dosql(sql4check);
		}catch(Exception e){
			e.printStackTrace();
		}
		PrintWriter out=response.getWriter();
		{out .println("<script>alert('check successfully');window.history.go(-2)</script>");}
		}
		else
		{
			PrintWriter out=response.getWriter();
			{out .println("<script>alert('has been used');window.history.go(-2)</script>");}
			
		}
	}

		
	}



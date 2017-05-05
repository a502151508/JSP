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
 * Servlet implementation class Enroll
 */
@WebServlet("/Booking")
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Booking() {
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
		String resId = request.getParameter("resId");
		String stuNum = request.getParameter("stunum");
		String Num=request.getParameter("num");
		System.out.println(Integer.parseInt(Num));
		if(Integer.parseInt(Num)>0){
			
			
		String sql = "insert into booking (stunum,resId,isUsed)"
				+ "values("+stuNum+","+resId+","+1+")";
		String sql1 = "update reserve set num=num-1 where resId="+resId
				;
		System.out.println("sql:" +  sql);
		System.out.println("sql1:" +  sql1);
		try {
			DBUtil.dosql(sql);
			DBUtil.dosql(sql1);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("list_booking_stu.jsp");
		}
		else
		{
			PrintWriter out=response.getWriter();
			{out .println("<script>alert('no enough');window.history.go(-2)</script>");}
			
		}
	}

	}



package servlet;

import servlet.UserServ;
import tools.DBUtil;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate_Stu")
public class Validate_Stu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate_Stu() {
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
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("userpwd");
		CachedRowSet rs=DBUtil.getRowSet("select*from stu_information where stunum="+userName);
		System.out.println("select*from stu_information where stunum="+userName);
		System.out.println("Validate.servlet UserName:" + userName);
		System.out.println("Validate.servlet userPwd:" + userPwd);
		try {
			while(rs.next()){
				String stuName = rs.getString("stuname");
				request.getSession().setAttribute("stuName",stuName );
				request.getSession().setAttribute("stuNum",userName );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UserServ userSrv = new UserServ();
		if(userSrv.check_Stu(userName,userPwd)){
			System.out.println("OK to frame");
			response.sendRedirect("list_reserve_stu.jsp");
		}else{
			System.out.println("ERROR to login");
			response.sendRedirect("login_stu.jsp");
		}
	}

}

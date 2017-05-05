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
@WebServlet("/Validate_Adm")
public class Validate_Adm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate_Adm() {
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
		CachedRowSet rs=DBUtil.getRowSet("select*from Adm_information where admnum="+userName);
		try {
			while(rs.next()){
				String admName = rs.getString("admname");
				request.getSession().setAttribute("admName",admName );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Validate.servlet UserName:" + userName);
		System.out.println("Validate.servlet userPwd:" + userPwd);
		UserServ userSrv = new UserServ();
		if(userSrv.check_Adm(userName,userPwd)){
			System.out.println("OK to frame");
			response.sendRedirect("system/adm_frame.jsp");
		}else{
			System.out.println("ERROR to login");
			response.sendRedirect("adm_login.jsp");
		}
	}

}

package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/ModifyStu")
public class ModifyStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyStu() {
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
		String stuPwd = "";
		String sEx = request.getParameter("sex");
		String clAss = request.getParameter("class");
		String telNum = request.getParameter("telnum");
		String eMail = request.getParameter("email");
		String sql = "update stu_information set stuname='"+stuName+"',stupwd='"+stuPwd+"',"+ "sex='"
        +sEx+"',class='"+clAss+"'"+ ",telnum='"+telNum+"',email='"+eMail+"' where stunum="+stuNum;
		System.out.println("sql:" + sql);
		tools.DBUtil.dosql(sql);
		response.sendRedirect("system/list_stu.jsp");
	}

}

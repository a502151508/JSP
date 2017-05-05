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
@WebServlet("/ModifyTea")
public class ModifyTea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyTea() {
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
		String teaPwd = "";
		String sEx = request.getParameter("sex");
		String couRse = request.getParameter("course");
		String teatelNum = request.getParameter("teatelnum");
		String eMail = request.getParameter("email");
		String sql = "update tea_information set teaname='"+teaName+"',teapwd='"+teaPwd+"',"+ "sex='"
        +sEx+"',course='"+couRse+"'"+ ",teatelnum='"+teatelNum+"',email='"+eMail+"' where teanum="+teaNum;
		System.out.println("sql:" + sql);
		tools.DBUtil.dosql(sql);
		response.sendRedirect("system/list_tea.jsp");
	}

}

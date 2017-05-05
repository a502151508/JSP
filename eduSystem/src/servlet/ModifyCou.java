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
@WebServlet("/ModifyCou")
public class ModifyCou extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCou() {
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
		String sql = "update course set couname='"+couName+"',classroom='"+claRoom+"',teaname='"+teaName+"',"+ "day='"
        +dAy+"',section='"+secTion+"'"+ " where counum="+couNum;
		System.out.println("sql:" + sql);
		tools.DBUtil.dosql(sql);
		response.sendRedirect("system/list_course.jsp");
	}

}

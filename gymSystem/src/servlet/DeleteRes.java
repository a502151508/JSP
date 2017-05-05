package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteRes
 */
@WebServlet("/DeleteRes")
public class DeleteRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRes() {
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
		String sql = "delete from reserve where resId="+resId;
		String sql1 = "delete from booking where resId="+resId;
		System.out.println("delres:" + sql+" "+sql1);
		
		try {
			tools.DBUtil.dosql(sql);
			tools.DBUtil.dosql(sql1);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("showReserve.jsp");
	}
	}



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import Action.LoginAction;
import Bean.DataMap;
import Bean.LoginBean;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usr = request.getParameter("userId");
		String pass = request.getParameter("pass");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setUserId(usr);
		loginBean.setPassword(pass);
		
		LoginAction loginAction = new LoginAction();
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		if(loginAction.validateLogin(loginBean)) {
			request.setAttribute("value", usr);
			
			ArrayList<DataMap> data = new ArrayList<DataMap>();
			data = loginAction.getData();
			request.setAttribute("data", data);
	        request.getRequestDispatcher("/welcome.jsp").forward(request, response);
		}else {
			out.println("Please use username(admin) & pass(admin)");
			RequestDispatcher rq=request.getRequestDispatcher("obs.jsp");
			rq.include(request,response);
		}
	}

}

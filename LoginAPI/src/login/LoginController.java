package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/APIlogin.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("controller왔다");
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		
		if(command.equals("kakaologin")) {	//카카오로그인
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			
			session.setAttribute("email", email);	//로그인 한 사용자의 정보들을 세션에 저장
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			
			response.sendRedirect("index.jsp");
			
		} else if(command.equals("logout"))	{
			session.invalidate();
			response.sendRedirect("index.jsp");
			
		} else if(command.equals("naverlogin")) {	//네이버로그인
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			
			session.setAttribute("email", email);	//로그인 한 사용자의 정보들을 세션에 저장
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			
			String res = "<script type='text/javascript'>"
					   + " opener.parent.location.reload();"
					   + " self.close();"
					   + "</script>";
			PrintWriter out = response.getWriter();
			out.println(res);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

}

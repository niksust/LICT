package jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpVerification
 */
@WebServlet("/SignUpVerification")
public class SignUpVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email_id");
		String user_reg_string= request.getParameter("user_reg");
		int user_reg = Integer.parseInt(user_reg_string);
		String user_pass= request.getParameter("user_pass");
		String user_name= request.getParameter("user_name");
		String user_image= "D:\\Study\\4-1\\Web Engineering Lab\\WebContent\\Img\\"+user_reg+".jpg";
		String Query= "INSERT INTO account values ("+user_reg+", '"+email+"', '"+user_pass+"', '"+user_name+"', '"+user_image+"');";
		Connection c= MySQL.connect();
		Statement statement = null;
		//ResultSet rs = null;
		try {
			statement = c.createStatement();
			statement.executeUpdate(Query);
			System.out.println("Works statement");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new Error(e);
		}
		MySQL.close(c);
		System.out.println(c);
		HttpSession session = request.getSession();
		session.setAttribute("user_reg", user_reg);
		System.out.println(session);
		response.sendRedirect("UserIndex.jsp");
	}

}

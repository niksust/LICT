package jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginVerification
 */
@WebServlet("/LoginVerification")
public class LoginVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int user_reg = 0 ;
		String email = request.getParameter("email_id");
        String user_pass = request.getParameter("user_pass");
        Connection c= MySQL.connect();
        System.out.println("Login verification "+email+" pass "+user_pass);
        if(email== null || user_pass == null){
        	//must be done later
        	response.sendRedirect("Login.jsp");
        }
        else{
        	
        	Statement statement = null;
        	ResultSet rs= null;
        	String Query_for_Email= "SELECT email_id FROM ACCOUNT WHERE email_id = '"+email+"';";
        	String Query_for_PassWord= "SELECT user_pass FROM ACCOUNT WHERE email_id = '"+email+"';";
        	String Query_for_User_reg= "SELECT user_reg FROM ACCOUNT WHERE email_id = '"+email+"';";
        	try {
				statement= c.createStatement();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        	System.out.println("Works lV");
        	try {
				rs = statement.executeQuery(Query_for_Email);
				boolean IsCorrectEmail =rs.next();
				if(IsCorrectEmail == false){
					statement.close();
					rs.close();
					MySQL.close(c);
					System.out.println("Need to sign in");
					response.sendRedirect("Login.jsp");
				}
				else{
					System.out.println("email Check");
					rs= statement.executeQuery(Query_for_PassWord);
					System.out.println("email Check");
					boolean IsCorrectPass = rs.next();
					if(IsCorrectPass == false){
						statement.close();
						rs.close();
						MySQL.close(c);
						System.out.println("Wrong Password");
						response.sendRedirect("index.jsp");
					}
					else{
						rs= statement.executeQuery(Query_for_User_reg);
						while(rs.next()){
							user_reg = rs.getInt("USER_REG");
							System.out.println(" "+user_reg +" Password Check");
						}
						
						statement.close();
						rs.close();
						MySQL.close(c);
						HttpSession session = request.getSession();
						session.setAttribute("user_reg", user_reg);
						response.sendRedirect("UserIndex.jsp");
							
					}
					
					System.out.println("In database");
					statement.close();
					rs.close();
					MySQL.close(c);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        	
        	
        	
        }
        
        
        MySQL.close(c);
        
		
	}

}

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

/**
 * Servlet implementation class AddData
 */
@WebServlet("/AddData")
public class AddData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_reg= (Integer)request.getSession(false).getAttribute("user_reg");
		Connection c =MySQL.connect();
		//contact table 
		String user_address= request.getParameter("user_address");
		String user_email= request.getParameter("user_email");
		String user_mobile= request.getParameter("user_mobile");
		
		//project table 
		String project_name= request.getParameter("project_name");
		String project_details= request.getParameter("project_details");
		String project_technology= request.getParameter("project_technology");
		String project_git_link= request.getParameter("project_git_link");
		
		//field of interest table 
		String interest_field= request.getParameter("interest_field");
		
		//skill table 
		String skill_field= request.getParameter("skill_field");
		
		//Cocurricular Activity table 
		String CoCurricularParticipation= request.getParameter("CoCurricularParticipation");
		String CoCurricular_Achievement = request.getParameter("CoCurricular_Achievement");
		String CoCurricular_Sports= request.getParameter("CoCurricular_Sports");
		String CoCurricular_Cultural = request.getParameter("CoCurricular_Cultural");
		String CoCurricular_Organizational= request.getParameter("CoCurricular_Organizational");
												
		System.out.println(user_address+" "+ user_email+" "+user_mobile );
		Statement statement;
		try {
			statement = c.createStatement();
			String Query_Insert_Contact_info= "Insert Into Contact values("+null +",'"+user_mobile +"','"+user_email +"','"+user_address +"',"+user_reg+");";
			String Query_Insert_Project_info= "Insert Into project values("+null +",'"+project_name +"','"+project_details+"','"+project_technology +"','"+project_git_link+"',"+user_reg+");";
			String Query_Insert_Field_of_Interest_info = "Insert Into Field_of_interest values("+null +",'"+interest_field+"',"+user_reg+");";
			String Query_Insert_Skill_info= "Insert Into Skills values("+null +",'"+skill_field+"',"+user_reg+");";
			String Query_Insert_CoCurricular_info= "Insert Into CoCurricular_participation values("+null +",'"+CoCurricularParticipation +"','"+CoCurricular_Achievement +"','"+CoCurricular_Sports+"','"+CoCurricular_Cultural+"','"+CoCurricular_Organizational +"',"+user_reg+");";
			
			
			statement.executeUpdate(Query_Insert_Contact_info);
			statement.executeUpdate(Query_Insert_Project_info);
			statement.executeUpdate(Query_Insert_Field_of_Interest_info);
			statement.executeUpdate(Query_Insert_Skill_info);
			statement.executeUpdate(Query_Insert_CoCurricular_info);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		MySQL.close(c);
		response.sendRedirect("AddImage.jsp");
		
	}

}

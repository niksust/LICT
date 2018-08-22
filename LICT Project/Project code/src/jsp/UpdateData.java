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
 * Servlet implementation class UpdateData
 */
@WebServlet("/UpdateData")
public class UpdateData extends HttpServlet {
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
			System.out.println("Unit test UpdateData.java 1");
			statement = c.createStatement();
			String Query_Update_Contact_info= "Update Contact Set  user_mobile ='"+user_mobile +"',user_email='"+user_email +"',user_address='"+user_address +"' where user_reg="+user_reg +";";
			statement.executeUpdate(Query_Update_Contact_info);
			statement.close();
			
			System.out.println("Unit test UpdateData.java 2");
			statement = c.createStatement();
			String Query_Update_Project_info= "Update project Set  project_name='"+project_name +"',project_details ='"+project_details+"',project_technology='"+project_technology +"',project_git_link='"+project_git_link+"' where user_reg="+user_reg+";";
			statement.executeUpdate(Query_Update_Project_info);
			statement.close();
			
			System.out.println("Unit test UpdateData.java 3");
			statement = c.createStatement();
			String Query_Update_Field_of_Interest_info = "Update Field_of_interest Set  interest_field ='"+interest_field+"' where user_reg= "+user_reg+";";
			statement.executeUpdate(Query_Update_Field_of_Interest_info);
			statement.close();
			
			System.out.println("Unit test UpdateData.java 4");
			statement = c.createStatement();
			String Query_Update_Skill_info= "Update Skills Set skill_field='"+skill_field+"' where user_reg= "+user_reg+";";
			statement.executeUpdate(Query_Update_Skill_info);
			statement.close();
			
			System.out.println("Unit test UpdateData.java 5");
			statement = c.createStatement();
			String Query_Update_CoCurricular_info= "Update CoCurricular_participation Set CoCurricularParticipation='"+CoCurricularParticipation+"',CoCurricular_Achievement='"+CoCurricular_Achievement +"',CoCurricular_Sports='"+CoCurricular_Sports+"',CoCurricular_Cultural='"+CoCurricular_Cultural+"',CoCurricular_Organizational= '"+CoCurricular_Organizational+"' where user_reg= "+user_reg+";";
			statement.executeUpdate(Query_Update_CoCurricular_info);
			statement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		MySQL.close(c);
		response.sendRedirect("AddImage.jsp");
		
	}

}

package jsp;

import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class SearchStudent
 */
@WebServlet("/SearchStudent")
public class PublicSearchStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String key = request.getParameter("search_field");
		PrintWriter out =response.getWriter();
		//PrintWriter out = response.getWriter();
		//out.println("<h3> On the Search</h3>");
		
		
		//checking if temp table is being created
		Connection conn =MySQL.connect();
		Statement statement=null, stm2 = null, stm3=null;
		String subQ = null, subQ2= null;
		ResultSet rs = null, subrs = null;
		
		
		
		
		try {
			statement = (Statement) conn.createStatement();
			stm2 = (Statement) conn.createStatement();
			stm3 = (Statement) conn.createStatement();
			
			statement.executeUpdate("DROP TABLE temp");
			System.out.println("table created");
			statement.close();
		} catch (SQLException e) {
			
		}
		String Q= "CREATE TABLE temp(id int not null auto_increment, reg VARCHAR(45), matchfound int, PRIMARY KEY(id))";
		//System.out.println("Hello Saif");
		try{
			statement = (Statement) conn.createStatement();
			//System.out.println("Hello Saif 2");
			statement.executeUpdate(Q);
			//System.out.println("Hello Saif 3");
		} catch(Exception c){
			System.out.println("Catch e ashbena konodin");
		}
		
		
		// searching on account table if found then update temp table
		Q = "SELECT user_reg FROM account WHERE User_reg LIKE'%"+key+"%' OR Email_id LIKE '%"+key+"%' OR user_name LIKE '%"+key+"%';";
		
		try{
			rs = statement.executeQuery(Q);
			//System.out.println("Hello Saif 4");
			String user_reg;
			while(rs.next()){
				user_reg = rs.getString(1);
				int t=0;
				subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
				subrs = stm2.executeQuery(subQ);
				//System.out.println("Hello Saif 5");
				while(subrs.next()){
					t++;
					int count =subrs.getInt(1);
					count++;
					System.out.println("increase matchfound in account for "+ key);
					subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
					stm3.executeUpdate(subQ2);
				}
				if(t==0){
					subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
					System.out.println("inserting reg from account"+user_reg+" for the first time for "+ key);
					//System.out.println("Hello Saif 6");
					stm3.executeUpdate(subQ);
				}
				
			}
			
			//System.out.println("Hello Saif 7");
		} catch(Exception e){
			e.printStackTrace();	
		}
		
		
		//  searching on curricular_participation table if found then update temp table 
		Q = "SELECT user_reg FROM cocurricular_participation WHERE CoCurricularParticipation LIKE '%"+key+"%' OR CoCurricular_Achievement LIKE '%"+key+"%' OR CoCurricular_Sports LIKE '%"+key+"%' OR CoCurricular_Cultural LIKE '%"+key+"%' OR CoCurricular_Organizational LIKE '%"+key+"%';";
		
		try{
			rs = statement.executeQuery(Q);
			String user_reg;
			while(rs.next()){
				user_reg = rs.getString(1);
				int t=0;
				subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
				subrs = stm2.executeQuery(subQ);
				while(subrs.next()){
					int count =subrs.getInt(1);
					count++;
					t++;
					System.out.println("increase matchfound from co-curricular for "+ key);
					
					subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
					stm3.executeUpdate(subQ2);
				}
				if(t==0){
					subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
					stm3.executeUpdate(subQ);
					System.out.println("inserting reg from co-curritular"+user_reg+" for the first time for "+ key);
					
				}
				
			}
		} catch(Exception e){
			e.printStackTrace();	
		}
		
		
	//  searching on contact table if found then update temp table 
			Q = "SELECT user_reg FROM contact WHERE user_mobile LIKE '%"+key+"%' OR user_email LIKE '%"+key+"%' OR user_address LIKE '%"+key+"%';";
			
			try{
				rs = statement.executeQuery(Q);
				String user_reg;
				while(rs.next()){
					user_reg = rs.getString(1);
					int t=0;
					subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
					subrs = stm2.executeQuery(subQ);
					while(subrs.next()){
						t++;
						System.out.println("increase matchfound from contact for "+ key);
						
						int count =subrs.getInt(1);
						count++;
						subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
						stm3.executeUpdate(subQ2);
					}
					if(t==0){
						subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
						System.out.println("inserting reg from contact"+user_reg+" for the first time for "+ key);
						
						stm3.executeUpdate(subQ);
					}
					
				}
			} catch(Exception e){
				e.printStackTrace();	
			}
		
		
		//  searching on field_of_interest table if found then update temp table 
					Q = "SELECT user_reg FROM field_of_interest WHERE interest_field LIKE'%"+key+"%';";
					
					try{
						rs = statement.executeQuery(Q);
						String user_reg;
						while(rs.next()){
							user_reg = rs.getString(1);
							int t=0;
							subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
							subrs = stm2.executeQuery(subQ);
							while(subrs.next()){
								t++;
								int count =subrs.getInt(1);
								count++;
								System.out.println("increase matchfound from feild of interest for "+ key);
								
								subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
								stm3.executeUpdate(subQ2);
							}
							if(t==0){
								subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
								stm3.executeUpdate(subQ);
								System.out.println("inserting reg from field of interest"+user_reg+" for the first time for "+ key);
								
							}
							
						}
					} catch(Exception e){
						e.printStackTrace();	
					}
					
	
		//  searching on project table if found then update temp table 
					Q = "SELECT user_reg FROM project WHERE Project_name LIKE '%"+key+"%' OR project_details LIKE '%"+key+"%' OR Project_Technology LIKE '%"+key+"%' OR Project_git_link LIKE '%"+key+"%';";
					
					try{
						rs = statement.executeQuery(Q);
						String user_reg;
						while(rs.next()){
							user_reg = rs.getString(1);
							int t=0;
							subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
							subrs = stm2.executeQuery(subQ);
							while(subrs.next()){
								t++;
								int count =subrs.getInt(1);
								count++;
								
								System.out.println("increase matchfound from project for "+ key);
								
								subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
								stm3.executeUpdate(subQ2);
							}
							if(t==0){
								subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
								System.out.println("inserting reg from project"+user_reg+" for the first time for "+ key);
								
								stm3.executeUpdate(subQ);
							}
							
						}
					} catch(Exception e){
						e.printStackTrace();	
					}
					
	
				//  searching on skills table if found then update temp table 
					Q = "SELECT user_reg FROM skills WHERE skill_field LIKE '%"+key+"%';";
					
					try{
						rs = statement.executeQuery(Q);
						String user_reg;
						while(rs.next()){
							user_reg = rs.getString(1);
							int t=0;
							subQ = "SELECT matchfound FROM temp WHERE reg LIKE '%"+user_reg+"%';";
							subrs = stm2.executeQuery(subQ);
							while(subrs.next()){
								int count =subrs.getInt(1);
								count++;
								t++;
								System.out.println("increase matchfound from skills for "+ key);
								
								subQ2 = "UPDATE temp SET matchfound = "+count+" WHERE reg ='"+user_reg+"';";
								stm3.executeUpdate(subQ2);
							}
							if(t==0){
								subQ = "INSERT INTO temp VALUES(null, '"+user_reg+"', 0)";
								stm3.executeUpdate(subQ);
								System.out.println("inserting reg from skills"+user_reg+" for the first time for "+ key);
								
							}
							
						}
					} catch(Exception e){
						e.printStackTrace();	
					}
					
		//Showing result		
		Q = "SELECT * FROM temp ORDER BY matchfound DESC";
		try{
			request.getRequestDispatcher("PublicTopper.jsp").include(request, response);
			
			out.println("<br><br><br><br><br><br><br>");
			rs = statement.executeQuery(Q);
			while(rs.next()){
				System.out.println(rs.getString(2)+"---"+rs.getInt(3));
				
				out.println("<br>"+rs.getString(2));
		
			}
		} catch(Exception e){
			e.printStackTrace();	
		}
		request.getRequestDispatcher("Footer.jsp").include(request, response);
		
		// drop temp table
		Q = "DROP TABLE temp;";
		try {
			statement.executeUpdate(Q);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		MySQL.close(conn);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

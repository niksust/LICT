package jsp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_reg= (Integer)request.getSession(false).getAttribute("user_reg");
		System.out.println("user _reg is "+user_reg);
		System.out.println("done uploading1");
		PrintWriter out = response.getWriter();
		if(!ServletFileUpload.isMultipartContent(request)){
			out.println("Nothing to upload");
			return;
		}
		
		FileItemFactory itemfactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(itemfactory);
		
		try {
			// Uploading a file
			List<FileItem> items =upload.parseRequest(new ServletRequestContext(request));
			for(FileItem item : items){
				if(!item.isFormField()){
				    item.write( new File("D:\\Study\\4-1\\Web Engineering Lab\\WebContent\\Img" + File.separator + ""+user_reg+".jpg"));
				}
			}
			Connection c =MySQL.connect();
			String Query_for_image_update= "UPDATE Account SET user_photo='D:/Study/4-1/Web Engineering Lab/WebContent/Img/" +user_reg+ ".jpg' WHERE user_reg = user_reg;";
			Statement statement=null;
			try {
				statement = (Statement) c.createStatement();
				statement.executeUpdate(Query_for_image_update);
				System.out.println("Works statement");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new Error(e);
			}
			
			MySQL.close(c);
		} catch (FileUploadException e) {
			System.out.println("upload fail");
		} catch (Exception e) {
			System.out.println("saving fail");
		}
		response.sendRedirect("MyProfileShow.jsp");
	}

}

package jsp;
import java.sql.*;
public class MySQL {
	public static Connection connect(){
		try{
			System.out.println("run1 ");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("run2 ");
			return DriverManager
					.getConnection("jdbc:mysql://localhost:3306/webproject?autoReconnect=true&useSSL=false", "root", "root");
		}catch(Exception e){
			throw new Error(e);
		}
		}
	public static boolean close(Connection c){
		try {
			c.close();
			return true;
		}catch(Exception e){
			return false;
		}
	}
}

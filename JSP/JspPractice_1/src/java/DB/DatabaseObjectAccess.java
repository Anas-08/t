package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseObjectAccess {
      public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myjsp?useSSL=false","root","Thispc@123");
            System.out.println("Connected...");
        }catch(ClassNotFoundException e){
            System.out.println("Class error" + e.getMessage());
        }catch(SQLException e){
            System.out.println("SQL error" + e.getMessage());
        } 
        return con;
    }
    
    public static int insert(Connection con, String name, String email, String password, String mobile, String city){
        int rowsAffected = 0;
        try{
            String insertQuery = "insert into register1(name, email, password, mobile, city) values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(insertQuery);
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,password);
            ps.setString(4,mobile);
            ps.setString(5,city);
            
            rowsAffected = ps.executeUpdate();
            
        }catch(SQLException e){
            System.out.println("Insert error" + e.getMessage());
        }
        return rowsAffected;
    }
    
   
}

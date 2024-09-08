package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DOA {
    
    public static Connection getConnection(){
        Connection con = null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myjsp?useSSL=false","root","Thispc@123");
                System.out.println("Connectd...");
            }catch(ClassNotFoundException e){
                System.out.println("Class Error" + e.getMessage());
            }catch(SQLException e){
                System.out.println("sql Error" + e.getMessage());
            }         
        return con;
    }
    
    public static int insert(Connection con, String id, String name, String price){
        int rowsAffected = 0;
        try{
            String insertQuery = "insert into bookmaster(bookid, bookname, bookprice) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(insertQuery);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, price);
            rowsAffected = ps.executeUpdate();
        }catch(SQLException e){
            System.out.println("insert error" + e.getMessage());
        }    
        return rowsAffected;
    }
    
    public static int update(Connection con,int id, String bookid, String name, String price){
        int rowsAffected = 0;
        try{
            String updateQuery = "update bookmaster set bookid = ?, bookname =?, bookprice = ? where id =?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, bookid);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setInt(4, id);
            rowsAffected = ps.executeUpdate();
        }catch(SQLException e){
            System.out.println("update error" + e.getMessage());
        }    
        return rowsAffected;
    }
    
    public static int delete(Connection con,int id){
        int rowsAffected = 0;
        try{
            String deleteQuery = "delete from bookmaster where id =?";
            PreparedStatement ps = con.prepareStatement(deleteQuery);

            ps.setInt(1, id);
            rowsAffected = ps.executeUpdate();
        }catch(SQLException e){
            System.out.println("delete error" + e.getMessage());
        }    
        return rowsAffected;
    }
    

}

package UserController;

import java.sql.*;
import java.util.*;

public class UserModel {

    // Validate login
    public static User validateUser(String username, String password) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE username='" + username + "' AND password='" + password + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                user = new User(
                    rs.getInt("uid"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("rollno")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Insert new user
    public static void insertUser(String name, String email, String phone, String address, String username, String password, String rollno) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO user (name, email, phone, address, username, password, rollno) VALUES ('"+name+"','"+email+"','"+phone+"','"+address+"','"+username+"','"+password+"','"+rollno+"')";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update existing user
    public static void updateUser(int uid, String name, String email, String phone, String address, String username, String password, String rollno) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE user SET name='"+name+"', email='"+email+"', phone='"+phone+"', address='"+address+"', username='"+username+"', password='"+password+"', rollno='"+rollno+"' WHERE uid="+uid;
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete user
    public static void deleteUser(int uid) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM user WHERE uid="+uid;
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get user by ID
    public static User getUserById(int uid) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE uid="+uid;
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                user = new User(
                    rs.getInt("uid"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("rollno")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Get users by roles (multiple roles)
    public static List<User> getUsersByRoles(List<String> roles) {
        List<User> users = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE rollno IN ('"+String.join("','", roles)+"')";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User u = new User(
                    rs.getInt("uid"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("rollno")
                );
                users.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
}

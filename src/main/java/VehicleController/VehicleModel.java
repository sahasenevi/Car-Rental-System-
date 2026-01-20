package VehicleController;

import java.sql.*;
import java.util.*;

public class VehicleModel {
    public static boolean insertVehicle(String supplier, String vbrand, String vname,
                                        String mdate, String fuel, int seatno, double price, String image) {
        boolean isSuccess = false;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO vehicle (supplier, vbrand, vname, mdate, fuel, seatno, price, image) VALUES ('" + 
                         supplier + "','" + vbrand + "','" + vname + "','" + mdate + "','" + fuel + "'," + seatno + "," + price + ",'" + image + "')";
            int rs = stmt.executeUpdate(sql);
            isSuccess = rs > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static List<Vehicle> getVehiclesBySupplier(String supplier) {
        List<Vehicle> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM vehicle WHERE supplier='" + supplier + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vehicle v = new Vehicle(
                    rs.getInt("vid"),
                    rs.getString("supplier"),
                    rs.getString("vbrand"),
                    rs.getString("vname"),
                    rs.getString("mdate"),
                    rs.getString("fuel"),
                    rs.getInt("seatno"),
                    rs.getDouble("price"),
                    rs.getString("image")
                );
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Vehicle getVehicleById(int vid) {
        Vehicle v = null;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vehicle WHERE vid=" + vid);
            if (rs.next()) {
                v = new Vehicle(
                    rs.getInt("vid"),
                    rs.getString("supplier"),
                    rs.getString("vbrand"),
                    rs.getString("vname"),
                    rs.getString("mdate"),
                    rs.getString("fuel"),
                    rs.getInt("seatno"),
                    rs.getDouble("price"),
                    rs.getString("image")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }

    public static boolean updateVehicle(int vid, String vbrand, String vname, String mdate,
                                        String fuel, int seatno, double price, String image) {
        boolean isSuccess = false;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE vehicle SET vbrand='" + vbrand + "', vname='" + vname + "', mdate='" + mdate +
                         "', fuel='" + fuel + "', seatno=" + seatno + ", price=" + price + ", image='" + image +
                         "' WHERE vid=" + vid;
            int rs = stmt.executeUpdate(sql);
            isSuccess = rs > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static boolean deleteVehicle(int vid) {
        boolean isSuccess = false;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            int rs = stmt.executeUpdate("DELETE FROM vehicle WHERE vid=" + vid);
            isSuccess = rs > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    
 // Get latest N vehicles
    public static List<Vehicle> getLatestVehicles(int limit) {
        List<Vehicle> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vehicle ORDER BY vid DESC LIMIT " + limit);
            while (rs.next()) {
                Vehicle v = new Vehicle(
                    rs.getInt("vid"),
                    rs.getString("supplier"),
                    rs.getString("vbrand"),
                    rs.getString("vname"),
                    rs.getString("mdate"),
                    rs.getString("fuel"),
                    rs.getInt("seatno"),
                    rs.getDouble("price"),
                    rs.getString("image")
                );
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get all vehicles
    public static List<Vehicle> getAllVehicles() {
        List<Vehicle> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vehicle");
            while (rs.next()) {
                Vehicle v = new Vehicle(
                    rs.getInt("vid"),
                    rs.getString("supplier"),
                    rs.getString("vbrand"),
                    rs.getString("vname"),
                    rs.getString("mdate"),
                    rs.getString("fuel"),
                    rs.getInt("seatno"),
                    rs.getDouble("price"),
                    rs.getString("image")
                );
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

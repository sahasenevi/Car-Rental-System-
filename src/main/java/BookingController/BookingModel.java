package BookingController;

import java.sql.*;
import java.util.*;

public class BookingModel {

    public static boolean insertBooking(int uid, int vid, int oid, String startDate, String endDate, double total) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO booking (uid, vid, oid, start_date, end_date, total_price) VALUES (" +
                uid + "," + vid + "," + oid + ",'" + startDate + "','" + endDate + "'," + total + ")";
            return stmt.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Booking> getBookingsByUser(int uid) {
        List<Booking> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM booking WHERE uid=" + uid);
            while (rs.next()) {
                list.add(new Booking(
                    rs.getInt("bid"),
                    rs.getInt("uid"),
                    rs.getInt("vid"),
                    rs.getInt("oid"),
                    rs.getString("start_date"),
                    rs.getString("end_date"),
                    rs.getDouble("total_price")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Booking getBookingById(int bid) {
        Booking b = null;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM booking WHERE bid=" + bid);
            if (rs.next()) {
                b = new Booking(
                    rs.getInt("bid"),
                    rs.getInt("uid"),
                    rs.getInt("vid"),
                    rs.getInt("oid"),
                    rs.getString("start_date"),
                    rs.getString("end_date"),
                    rs.getDouble("total_price")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public static boolean updateBooking(int bid, int vid, int oid, String startDate, String endDate, double total) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE booking SET vid=" + vid + ", oid=" + oid + ", start_date='" + startDate +
                         "', end_date='" + endDate + "', total_price=" + total + " WHERE bid=" + bid;
            return stmt.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteBooking(int bid) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            return stmt.executeUpdate("DELETE FROM booking WHERE bid=" + bid) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    
    
    
    public static List<Integer> getUnavailableVehicleIds(String startDate, String endDate) {
        List<Integer> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();

            String sql = "SELECT vid FROM booking WHERE " +
                         "('" + startDate + "' BETWEEN start_date AND end_date OR " +
                         "'" + endDate + "' BETWEEN start_date AND end_date OR " +
                         "start_date BETWEEN '" + startDate + "' AND '" + endDate + "' OR " +
                         "end_date BETWEEN '" + startDate + "' AND '" + endDate + "')";

            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(rs.getInt("vid"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

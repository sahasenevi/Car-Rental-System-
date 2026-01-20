package OfferController;

import java.sql.*;
import java.util.*;

public class OfferModel {
	
	public static boolean insertOffer(String title, String description, double discount, String validUntil, String addedBy, String image) {
	    try {
	        Connection con = DBConnection.getConnection();
	        Statement stmt = con.createStatement();
	        String sql = "INSERT INTO offer (title, description, discount, valid_until, added_by, image) VALUES ('" +
	                title + "','" + description + "'," + discount + ",'" + validUntil + "','" + addedBy + "','" + image + "')";
	        return stmt.executeUpdate(sql) > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

    public static List<Offer> getOffersByStaff(String staff) {
        List<Offer> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM offer WHERE added_by='" + staff + "'");
            while (rs.next()) {
                list.add(new Offer(
                    rs.getInt("oid"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getDouble("discount"),
                    rs.getString("valid_until"),
                    rs.getString("added_by"),
                    rs.getString("image")

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Offer getOfferById(int oid) {
        Offer o = null;
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM offer WHERE oid=" + oid);
            if (rs.next()) {
                o = new Offer(
                    rs.getInt("oid"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getDouble("discount"),
                    rs.getString("valid_until"),
                    rs.getString("added_by"),
                    rs.getString("image")

                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    public static boolean updateOffer(int oid, String title, String description, double discount, String validUntil, String image) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE offer SET title='" + title + "', description='" + description + "', discount=" + discount +
                         ", valid_until='" + validUntil + "', image='" + image + "' WHERE oid=" + oid;
            return stmt.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static boolean deleteOffer(int oid) {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            return stmt.executeUpdate("DELETE FROM offer WHERE oid=" + oid) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public static List<Offer> getLatestOffers(int limit) {
        List<Offer> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM offer ORDER BY oid DESC LIMIT " + limit);
            while (rs.next()) {
                list.add(new Offer(
                    rs.getInt("oid"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getDouble("discount"),
                    rs.getString("valid_until"),
                    rs.getString("added_by"),
                    rs.getString("image")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

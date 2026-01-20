package AdminController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminModel {
	
	private static Connection con= null;
	private static Statement stmt = null;
	private static ResultSet rs = null; 
	
	private static boolean Success;
	
	
	//Validate
	public static boolean validate(String userName,String password) {
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql= "select * from admin_table where UserName ='"+userName+"' and Password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				Success = true;
			}else {
				Success = false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}

		
		return Success;		
	}
	
	

		public static List<Admin> getAdmin(String userName){
			
			ArrayList<Admin> admin= new ArrayList<>();	
			
			try {
				
				con=DBConnection.getConnection();
				stmt = con.createStatement();
				String sql = "Select * from admin_table where UserName= '"+userName+"'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String email= rs.getString(3);
					String phone= rs.getString(4);
					String UN= rs.getString(5);
					String PW= rs.getString(6);

					
					Admin a = new Admin(id,name,email,phone,UN,PW);
					admin.add(a);

					
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return admin;
		
		}
		
		
		
		//Insert
		public static boolean insertAdmin(String name, String email, String phone, String userName, String password) {
			
			boolean Success= false;
			
			//DB Connection
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				String sql= "Insert into admin_table Values (0,'"+name+"','"+email+"','"+phone+"','"+userName+"','"+password+"')";
				int rs = stmt.executeUpdate(sql);
				
				
				
				
				if(rs>0) {
					Success = true;
				}else {
					Success = false;
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			return Success;
			
			
		}
		
		
		
		//Update
		public static boolean updateAdmin(String AdminId, String name, String email, String phone, String userName, String password) {
			
			//DB Connection
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				String sql= "Update admin_table SET Name='"+name+"',Email='"+email+"',Phone='"+phone+"',UserName='"+userName+"',Password='"+password+"' WHERE AdminId='"+AdminId+"'" ;
				int rs = stmt.executeUpdate(sql);
				
				
				if(rs>0) {
					Success = true;
				}else {
					Success = false;
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
	
			
			return Success;
		}
		
		
		
		//Data Retrieve
		public static List<Admin> getAdminDetails(String Id){
			ArrayList<Admin> admin=new ArrayList<>();
			
			int convertedID = Integer.parseInt(Id);
			
			//DB Connection
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				String sql= "Select * from admin_table WHERE AdminId='"+convertedID+"'" ;
				rs = stmt.executeQuery(sql);
				
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String email= rs.getString(3);
					String phone= rs.getString(4);
					String userName= rs.getString(5);
					String password= rs.getString(6);
					
					Admin a = new Admin(id,name,email,phone,userName,password);
					admin.add(a);
					
				}

				
			}catch(Exception e) {
				e.printStackTrace();
				
			}

			
			return admin;
		}
		
		
		
		//Delete
		public static boolean deleteAdmin(String Id) {
			int convertedID= Integer.parseInt(Id);
			
			//DB Connection
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				String sql= "Delete from admin_table WHERE AdminId='"+convertedID+"'" ;
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					Success = true;
				}else {
					Success = false;
				}

				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
			
			return Success;
		}
		
		
		
	
}

package AdminController;

public class Admin {
	private int adminId;
	private String name;
	private String email;
	private String phone;
	private String userName;
	private String password;
	
	
	public Admin(int adminId, String name, String email, String phone, String userName, String password) {
		this.adminId = adminId;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.userName = userName;
		this.password = password;
	}


	public int getAdminId() {
		return adminId;
	}


	public String getName() {
		return name;
	}



	public String getEmail() {
		return email;
	}



	public String getPhone() {
		return phone;
	}



	public String getUserName() {
		return userName;
	}


	public String getPassword() {
		return password;
	}

	
	
}

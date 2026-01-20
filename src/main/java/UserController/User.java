package UserController;

public class User {
    private int uid;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String username;
    private String password;
    private String rollno;

    public User(int uid, String name, String email, String phone, String address, 
                String username, String password, String rollno) {
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.username = username;
        this.password = password;
        this.rollno = rollno;
    }

    // Getters
    public int getUid() { return uid; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getRollno() { return rollno; }
}

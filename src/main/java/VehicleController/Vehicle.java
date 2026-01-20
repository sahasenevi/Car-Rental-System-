package VehicleController;

public class Vehicle {
    private int vid;
    private String supplier;
    private String vbrand;
    private String vname;
    private String mdate;
    private String fuel;
    private int seatno;
    private double price;
    private String image;

    public Vehicle(int vid, String supplier, String vbrand, String vname, String mdate,
                   String fuel, int seatno, double price, String image) {
        this.vid = vid;
        this.supplier = supplier;
        this.vbrand = vbrand;
        this.vname = vname;
        this.mdate = mdate;
        this.fuel = fuel;
        this.seatno = seatno;
        this.price = price;
        this.image = image;
    }

    // Getters
    public int getVid() { return vid; }
    public String getSupplier() { return supplier; }
    public String getVbrand() { return vbrand; }
    public String getVname() { return vname; }
    public String getMdate() { return mdate; }
    public String getFuel() { return fuel; }
    public int getSeatno() { return seatno; }
    public double getPrice() { return price; }
    public String getImage() { return image; }
}

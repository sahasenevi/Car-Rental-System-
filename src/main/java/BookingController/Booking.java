package BookingController;

public class Booking {
    private int bid;
    private int uid;
    private int vid;
    private int oid;
    private String startDate;
    private String endDate;
    private double totalPrice;

    public Booking(int bid, int uid, int vid, int oid, String startDate, String endDate, double totalPrice) {
        this.bid = bid;
        this.uid = uid;
        this.vid = vid;
        this.oid = oid;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalPrice = totalPrice;
    }

    public int getBid() { return bid; }
    public int getUid() { return uid; }
    public int getVid() { return vid; }
    public int getOid() { return oid; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }
    public double getTotalPrice() { return totalPrice; }
}

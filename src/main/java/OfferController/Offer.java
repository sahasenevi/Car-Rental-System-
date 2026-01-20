package OfferController;

public class Offer {
    private int oid;
    private String title;
    private String description;
    private double discount;
    private String validUntil;
    private String addedBy;
    private String image;

    public Offer(int oid, String title, String description, double discount, String validUntil, String addedBy, String image) {
        this.oid = oid;
        this.title = title;
        this.description = description;
        this.discount = discount;
        this.validUntil = validUntil;
        this.addedBy = addedBy;
        this.image = image;

    }

    public int getOid() { return oid; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public double getDiscount() { return discount; }
    public String getValidUntil() { return validUntil; }
    public String getAddedBy() { return addedBy; }
    public String getImage() { return image; }

}

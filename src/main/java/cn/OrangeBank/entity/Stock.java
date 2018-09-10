package cn.OrangeBank.entity;

public class Stock {
    private long stock_id;
    private String stock_name;
    private String stock_describe;
    private String stock_unit;
    private long stock_count;
    private double stock_ordermoney;
    private int stock_warehouseid;
    private String stock_orderid;

    private  Position pos;

    public Position getPos() {
        return pos;
    }

    public void setPos(Position pos) {
        this.pos = pos;
    }

    public int getStock_warehouseid() {
        return stock_warehouseid;
    }

    public void setStock_warehouseid(int stock_warehouseid) {
        this.stock_warehouseid = stock_warehouseid;
    }

    public long getStock_id() {
        return stock_id;
    }

    public void setStock_id(long stock_id) {
        this.stock_id = stock_id;
    }

    public String getStock_name() {
        return stock_name;
    }

    public void setStock_name(String stock_name) {
        this.stock_name = stock_name;
    }

    public String getStock_describe() {
        return stock_describe;
    }

    public void setStock_describe(String stock_describe) {
        this.stock_describe = stock_describe;
    }

    public String getStock_unit() {
        return stock_unit;
    }

    public void setStock_unit(String stock_unit) {
        this.stock_unit = stock_unit;
    }

    public long getStock_count() {
        return stock_count;
    }

    public void setStock_count(long stock_count) {
        this.stock_count = stock_count;
    }

    public double getStock_ordermoney() {
        return stock_ordermoney;
    }

    public void setStock_ordermoney(double stock_ordermoney) {
        this.stock_ordermoney = stock_ordermoney;
    }

    public String getStock_orderid() {
        return stock_orderid;
    }

    public void setStock_orderid(String stock_orderid) {
        this.stock_orderid = stock_orderid;
    }
}
